import '../../constants/path/icon_path.dart';

extension IconPathExt on IconPath {
  String get toPathPng {
    return 'assets/icons/ic_$name.png';
  }
}
