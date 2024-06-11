import '../../constants/path/image_path.dart';

extension ImagePathExt on ImagePath {
  String get toPathPng {
    return 'assets/images/im_$name.png';
  }

  String get toPathSvg {
    return 'assets/svg/$name.svg';
  }
}
