import 'package:flutter/material.dart';
import 'package:raffle_app/features/campaing/domain/repository/campaing_repository.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_state.dart';

class CampaingListNotifier extends ChangeNotifier {
  CampaingListNotifier(this.campaingRepository);

  final CampaingRepository campaingRepository;
  CampaingListState state = CampaingListInitial();

  Future<void> getCampaingList() async {
    try {
      state = CampaingListProgress();
      notifyListeners();
      final result = await campaingRepository.getCampaings();
      if (result.isSuccess()) {
        final campaingList = result.tryGetSuccess();
        state = CampaingListSuccess(campainglistModel: campaingList);
        notifyListeners();
      } else if (result.isError()) {
        state = CampaingListError();
        notifyListeners();
      }
    } catch (e) {
      state = CampaingListError();
      notifyListeners();
    }
  }
}
