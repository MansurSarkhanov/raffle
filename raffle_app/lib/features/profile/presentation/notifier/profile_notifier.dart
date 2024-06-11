import 'package:flutter/material.dart';
import 'package:raffle_app/features/profile/domain/repository/user_info_repository.dart';

import 'profile_state.dart';

class ProfileNotifier extends ChangeNotifier {
  ProfileNotifier(this.userInfoRepository);
  final UserInfoRepository userInfoRepository;
  ProfileState state = ProfileInitial();

  Future<void> getUserInformation() async {
    try {
      print('sdfsfs');
      state = ProfileProgress();
      notifyListeners();
      final userInfoModel = await userInfoRepository.getUserInfo();
      if (userInfoModel.isSuccess()) {
        final userInfo = userInfoModel.tryGetSuccess();
        state = ProfileSuccess(user: userInfo);
        notifyListeners();
      } else if (userInfoModel.isError()) {
        state = ProfileError();
        notifyListeners();
      }
    } catch (e) {
      state = ProfileError();
      notifyListeners();
    }
  }
}
