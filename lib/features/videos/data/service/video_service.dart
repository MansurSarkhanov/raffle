import 'package:raffle_app/features/videos/data/models/video_model.dart';

import '../../../../core/utilities/firebase/firestore_database_referance.dart';

abstract class VideoService {
  Future<List<VideoModel>?> getMainVideos();
}

class VideoServiceImpl implements VideoService {
  final _firebaseReference = FirebaseReference.videos.ref;
  @override
  Future<List<VideoModel>?> getMainVideos() async {
    try {
      final response =await _firebaseReference.withConverter(
        fromFirestore: (snapshot, options) {
          return VideoModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.toJson();
        },
      ).get();

      if (response.docs.isNotEmpty) {
        final videoList = response.docs.map((e) => e.data()).toList();
        return videoList;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
