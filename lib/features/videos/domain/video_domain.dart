


import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/videos/data/models/video_model.dart';

abstract class VideosDomain{
   Future<Result<List<VideoModel>?, Exception>> getVideos();
}