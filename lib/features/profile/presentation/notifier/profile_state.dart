import 'package:equatable/equatable.dart';
import 'package:raffle_app/features/auth/data/model/user_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileProgress extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserModel? user;
  ProfileSuccess({this.user});

  @override
  List<Object?> get props => [user];
}

final class ProfileError extends ProfileState {}
