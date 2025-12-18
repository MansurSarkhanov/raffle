import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AuthRepository {
  Future<Result<User?, Exception>> loginWithEmailAndPassword({required String email, required String password});
  Future<Result<User?, String>> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String number,
      required String surname});

  Future<bool> checkAuth();

  Future<bool> logout();
}
