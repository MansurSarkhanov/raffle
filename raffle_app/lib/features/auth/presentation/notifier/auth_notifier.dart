import 'package:flutter/material.dart';
import 'package:raffle_app/features/auth/domain/repository/auth_repository.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_state.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this.authRepository);

  final AuthRepository authRepository;
  AuthState state = AuthInitial();

  Future<bool> loginUser(
      {required String email, required String password}) async {
    state = AuthProgress();
    notifyListeners();
    try {
      final result = await authRepository.loginWithEmailAndPassword(email: email, password: password);
      if (result.tryGetSuccess()!.uid.isNotEmpty) {
        state = AuthSuccess();
        notifyListeners();

        return true;
      }
    } catch (e) {
      print(e.toString());
      state = AuthError();
      notifyListeners();
      return false;

    }
    return false;
  }

  Future<void> registerUser(
      {required String email,
      required String password,
      required String name,
      required String number,
      required String surname}) async {
    state = AuthProgress();
    notifyListeners();
    final result = await authRepository.registerWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      number: number,
      surname: surname,
    );
    if (result.isSuccess()) {
      state = AuthSuccess();
      notifyListeners();
    } else if (result.isError()) {
      state = AuthError();
      notifyListeners();
    }
  }

  bool checkAuth() {
    try {
      final isAuth = authRepository.checkAuth();
      return isAuth;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      final isLogut = await authRepository.logout();
      return isLogut;
    } catch (e) {
      return false;
    }
  }
}
