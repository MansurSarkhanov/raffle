import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utilities/firebase/firestore_database_referance.dart';
import '../../../../data/local/shared_preferences_service.dart';
import '../models/ticket_model.dart';

abstract class TicketService {
  Stream<List<TicketModel>> getUserTicket();
  Future<bool> buyTicket(TicketModel ticket);
}

class TicketServiceImpl implements TicketService {
  final _firebaseReference = FirebaseReference.tickets.ref;
  final SharedPreferenceService sharedPreferenceService =
      SharedPreferenceServiceImpl();
 
  @override
  Stream<List<TicketModel>> getUserTicket() {
    final uid = sharedPreferenceService.readString('token');

    return _firebaseReference.doc(uid).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return <TicketModel>[];
      }

      final data = snapshot.data() as Map<String, dynamic>;
      final List list = data['data'] ?? [];

      return list
          .map((e) => TicketModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    });
  }


  @override
  Future<bool> buyTicket(TicketModel ticket) async {
    try {
      final uid = sharedPreferenceService.readString('token');
      await _firebaseReference.doc(uid).update({
        'data': FieldValue.arrayUnion([ticket.toJson()])
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
