import 'package:flutter/material.dart';
import 'package:raffle_app/features/profile/domain/repository/user_info_repository.dart';

import '../../../auth/data/model/user_model.dart';
import 'profile_state.dart';

class ProfileNotifier extends ChangeNotifier {
  ProfileNotifier(this.userInfoRepository);
  final UserInfoRepository userInfoRepository;
  ProfileState state = ProfileInitial();
  
UserModel? user = UserModel();
  Future<void> getUserInformation() async {
    try {
      state = ProfileProgress();
      notifyListeners();
      final userInfoModel = await userInfoRepository.getUserInfo();
      if (userInfoModel.isSuccess()) {
        user = userInfoModel.tryGetSuccess();
        state = ProfileSuccess(user: user);
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
