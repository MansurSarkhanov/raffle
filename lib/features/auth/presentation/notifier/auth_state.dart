import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {

}

final class AuthProgress extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthError extends AuthState {

}
