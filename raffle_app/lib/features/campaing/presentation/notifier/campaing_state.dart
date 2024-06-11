import 'package:equatable/equatable.dart';

import '../../data/model/campaing_model.dart';

abstract class CampaingListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CampaingListInitial extends CampaingListState {}

class CampaingListProgress extends CampaingListState {}

class CampaingListSuccess extends CampaingListState {
  final List<CampaingModel>? campainglistModel;

  CampaingListSuccess({required this.campainglistModel});
}

class CampaingListError extends CampaingListState {}
