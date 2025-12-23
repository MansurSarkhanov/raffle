



import 'package:flutter/material.dart';
import 'package:raffle_app/features/videos/domain/video_domain.dart';
import 'package:raffle_app/features/videos/presentation/notifier/video_state.dart';

class VideoNotifier extends ChangeNotifier{
final VideosDomain repository;

  VideoNotifier({required this.repository});
  VideoState state = VideoInitial();

  Future<void> getVideos() async {
    try {
      state = VideoProgress();
      final result = await repository.getVideos();
      if (result.isSuccess()) {
        final videoList = result.tryGetSuccess();
        state = VideoSuccess(vidoes: videoList);
      } else if (result.isError()) {
        state = VideoError();
      }
      notifyListeners();
    } catch (e) {
      state = VideoError();
      notifyListeners();
    }
  }
}