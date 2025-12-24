import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utilities/firebase/firestore_database_referance.dart';
import '../../../../data/local/shared_preferences_service.dart';
import '../models/ticket_model.dart';

abstract class TicketService {
  Future<DocumentReference<TicketDataModel>?> getUserTicket();
  Future<bool> buyTicket(TicketModel ticket);
}

class TicketServiceImpl implements TicketService {
  final _firebaseReference = FirebaseReference.tickets.ref;
  final SharedPreferenceService sharedPreferenceService =
      SharedPreferenceServiceImpl();
  @override
  Future<DocumentReference<TicketDataModel>?> getUserTicket() async {
    try {
      final uid = sharedPreferenceService.readString('token');
      final response = _firebaseReference.doc(uid).withConverter(
        fromFirestore: (snapshot, options) {
          return TicketDataModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.toJson();
        },
      );

      return response;
    } catch (e) {
      return null;
    }
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
