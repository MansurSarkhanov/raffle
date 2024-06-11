import '../../../../core/utilities/firebase/firestore_database_referance.dart';
import '../model/campaing_model.dart';

abstract interface class CampaingService {
  Future<List<CampaingModel>?> getCampaings();
}

final class CampaingServiceImpl implements CampaingService {
  final _firebaseReference = FirebaseReference.campaings.ref;
  @override
  Future<List<CampaingModel>?> getCampaings() async {
    try {
      final response = await _firebaseReference.withConverter(
        fromFirestore: (snapshot, options) {
          return CampaingModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.toJson();
        },
      ).get();
      if (response.docs.isNotEmpty) {
        final campaingList = response.docs.map((e) => e.data()).toList();
        return campaingList;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
