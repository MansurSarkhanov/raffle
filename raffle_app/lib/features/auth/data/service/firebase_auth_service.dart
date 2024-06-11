import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirebaseAuthService {
  Future<User?> loginWithEmailAndPassword({required String email, required String password});
  Future<User?> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String number,
      required String surname});
  Future<void> signOut();
}

final class FirebaseAuthServiceImpl implements FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      print(user?.uid);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String number,
    required String surname,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      print(user?.uid);
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
