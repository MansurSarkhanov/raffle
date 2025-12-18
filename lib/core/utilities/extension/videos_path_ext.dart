import 'package:raffle_app/core/constants/path/videos_path.dart';

extension VideosPathExt on VideosPath {
  String get toPath {
    return 'assets/videos/$name.mp4';
  }
}
