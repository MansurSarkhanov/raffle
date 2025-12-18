import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raffle_app/core/utilities/firebase/firestore_database_referance.dart';
import 'package:raffle_app/data/local/shared_preferences_service.dart';
import 'package:raffle_app/features/auth/data/model/user_model.dart';

abstract class UserInfoService {
  Future<DocumentReference<UserModel>?> getUserInfo();
}

final class UserInfoServiceImpl implements UserInfoService {
  final _firebaseReference = FirebaseReference.users.ref;
  final SharedPreferenceService sharedPreferenceService = SharedPreferenceServiceImpl();
  @override
  Future<DocumentReference<UserModel>?> getUserInfo() async {
    try {
      final uid = sharedPreferenceService.readString('token');

      final response = _firebaseReference.doc(uid).withConverter(
        fromFirestore: (snapshot, options) {
          return UserModel.fromJson(snapshot.data()!);
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
}
