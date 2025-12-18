import 'package:flutter/material.dart';
import 'package:raffle_app/features/profile/data/service/firebase_storage_service.dart';
import 'package:raffle_app/features/profile/domain/repository/user_info_repository.dart';

import '../../../auth/data/model/user_model.dart';
import 'profile_state.dart';

class ProfileNotifier extends ChangeNotifier {
  ProfileNotifier(this.userInfoRepository);
  final UserInfoRepository userInfoRepository;
  ProfileState state = ProfileInitial();
  bool isLoadingImage = false;
  String? testImage;

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

  Future<void> changeProfileImage(FirebaseStorageService storage) async {
    isLoadingImage = true;
    notifyListeners();
    testImage = await storage.uploadImage();
    notifyListeners();
    isLoadingImage = false;
    notifyListeners();
  }
}
