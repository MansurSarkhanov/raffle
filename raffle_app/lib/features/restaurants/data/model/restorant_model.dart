import 'place_model.dart';

class RestaurantModel {
  List<Places>? places;
  int? total;
  int? currence;
  String? imageUrl;
  String? name;
  int? percent;

  RestaurantModel({this.places, this.total, this.currence, this.imageUrl, this.name, this.percent});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(Places.fromJson(v));
      });
    }
    total = json['total'];
    currence = json['currence'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (places != null) {
      data['places'] = places!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['currence'] = currence;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['percent'] = percent;
    return data;
  }
}
