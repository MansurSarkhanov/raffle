class CampaingModel {
  String? image;
  String? price;
  String? date;

  CampaingModel({this.image, this.price, this.date});

  CampaingModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['price'] = price;
    data['date'] = date;
    return data;
  }
}
