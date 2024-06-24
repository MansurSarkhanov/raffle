import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/data/local/shared_preferences_service.dart';
import 'package:raffle_app/features/auth/data/service/firebase_auth_service.dart';
import '../../../../core/utilities/firebase/firestore_database_referance.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/user_model.dart';

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.firebaseAuth, required this.sharedPreference});
  final FirebaseAuthServiceImpl firebaseAuth;
  final SharedPreferenceServiceImpl sharedPreference;
  @override
  Future<Result<User?, Exception>> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      final user = await firebaseAuth.loginWithEmailAndPassword(email: email, password: password);
      await sharedPreference.saveBool('logged', true);
      await sharedPreference.saveString('token', user!.uid);
      return Result.success(user);
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  @override
  Future<Result<User?, String>> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String number,
      required String surname}) async {
    try {
      final user = await firebaseAuth.registerWithEmailAndPassword(
          email: email, password: password, name: name, number: number, surname: surname);
      if (user != null) {
        final userModel = UserModel(
                name: name,
                email: user.email,
                password: password,
                uid: user.uid,
                number: number,
                surname: surname,
                balance: 0,
                image:
                    'https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/im_person.png?alt=media&token=5aa3c7e7-a53d-4d85-ae9e-b24b43d8d03c')
            .toJson();
        if (userModel.isNotEmpty) {
          final firebaseRef = FirebaseReference.users.ref;
          firebaseRef.doc(user.uid).set(userModel);
          final token = user.uid;
          print(token);
          await sharedPreference.saveBool('logged', true);
          await sharedPreference.saveString('token', token);
        }
      }
      return Result.success(user!);
    } on FirebaseAuthException catch (e) {
      if (e.message == 'CONFIGURATION_NOT_FOUND') {
        return const Result.error("Email or password is incorrect");
      }
      return const Result.error("Unknown error occured");
    } catch (e) {
      return const Result.error("Unknown error occured");
    }
  }

  @override
  bool checkAuth() {
    try {
      final isAuth = sharedPreference.readBool('logged');
      return isAuth ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await sharedPreference.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
