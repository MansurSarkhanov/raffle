class CampaingModel {
  String? image;
  String? price;
  String? date;
  int? percent;

  CampaingModel({this.image, this.price, this.date,this.percent});

  CampaingModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    price = json['price'];
    date = json['date'];
    percent = json['percent'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['price'] = price;
    data['date'] = date;
    data['percent'] = percent;

    return data;
  }
}
