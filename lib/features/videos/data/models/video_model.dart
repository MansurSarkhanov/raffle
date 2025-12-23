

class VideoModel {
  final String videoUrl;
  final String videoMode;
  VideoModel({required this.videoUrl,required this.videoMode});


  factory VideoModel.fromJson(Map<String, dynamic> json){
    return VideoModel(videoUrl: json['videoUrl'], videoMode: json['videoMode']);
  }
    Map<String, dynamic> toJson() {
    return {
    };
  }
}