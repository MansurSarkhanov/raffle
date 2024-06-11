import '../../constants/path/gif_path.dart';

extension GifPathExt on GifPath {
  String get toPath {
    return 'assets/gif/$name.gif';
  }
}
