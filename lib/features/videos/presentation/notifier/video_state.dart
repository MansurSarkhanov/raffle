import 'package:raffle_app/features/videos/data/models/video_model.dart';

abstract class VideoState   {

}

class VideoInitial extends VideoState {}

class VideoProgress extends VideoState {}

class VideoSuccess extends VideoState {
  final List<VideoModel>? vidoes;
  VideoSuccess({this.vidoes});
}

class VideoError extends VideoState {}
