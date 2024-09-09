import 'package:flutter/material.dart';
import 'package:raffle_app/features/auth/domain/repository/auth_repository.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_state.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this.authRepository);

  final AuthRepository authRepository;
  AuthState state = AuthInitial();

  Future<bool> loginUser({required String email, required String password}) async {
    state = AuthProgress();
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 3));
      final result = await authRepository.loginWithEmailAndPassword(email: email, password: password);
      if (result.tryGetSuccess()!.uid.isNotEmpty) {
        state = AuthSuccess();
        notifyListeners();

        return true;
      }
    } catch (e) {
      state = AuthError();
      notifyListeners();
      return false;
    }
    return false;
  }

  Future<bool> registerUser(
      {required String email,
      required String password,
      required String name,
      required String number,
      required String surname}) async {
    state = AuthProgress();
    notifyListeners();
    try {
      final result = await authRepository.registerWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      number: number,
      surname: surname,
    );
      if (result.tryGetSuccess()!.uid.isNotEmpty) {
      state = AuthSuccess();
      notifyListeners();
        return true;
    } else if (result.isError()) {
      state = AuthError();
      notifyListeners();
        return false;
    }
    } catch (e) {
      state = AuthError();
      notifyListeners();
      return false;
    }
    return false;
    
  }

  Future<bool> checkAuth() async {
    try {
      final isAuth = await authRepository.checkAuth();
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
