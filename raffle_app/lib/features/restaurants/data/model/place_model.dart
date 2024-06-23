class Places {
  String? foodName;
  bool? isSaved;
  String? imageUrl;
  String? location;
  int? savedCount;
  bool? isFavorite;

  Places({this.foodName, this.isSaved, this.imageUrl, this.location, this.savedCount, this.isFavorite});

  Places.fromJson(Map<String, dynamic> json) {
    foodName = json['foodName'];
    isSaved = json['isSaved'];
    imageUrl = json['imageUrl'];
    location = json['location'];
    savedCount = json['savedCount'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodName'] = foodName;
    data['isSaved'] = isSaved;
    data['imageUrl'] = imageUrl;
    data['location'] = location;
    data['savedCount'] = savedCount;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
