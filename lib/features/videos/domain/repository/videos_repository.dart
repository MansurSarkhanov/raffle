


import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/videos/data/models/video_model.dart';
import 'package:raffle_app/features/videos/data/service/video_service.dart';
import 'package:raffle_app/features/videos/domain/video_domain.dart';

class VideosRepository implements VideosDomain{
  final VideoService service;

  VideosRepository({required this.service});

  @override
  Future<Result<List<VideoModel>?, Exception>> getVideos() async {
      try {
      final productList = await service.getMainVideos();
      if (productList is List) {
        return Result.success(productList);
      }
    } on Exception catch (e) {
      return Error(Exception(e));
    }
    return Error(Exception('Something went wrong'));
  }
}