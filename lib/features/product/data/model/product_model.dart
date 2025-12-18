class ProductModel {
  String? prize;
  String? buy;
  String? price;
  String? image;
  String? leftPrice;
  String? rightPrice;
  int? percent;
  bool? isAnimating;

  ProductModel({this.prize, this.buy, this.price, this.image, this.leftPrice, this.rightPrice, this.percent});

  ProductModel.fromJson(Map<String, dynamic> json) {
    prize = json['prize'];
    buy = json['buy'];
    price = json['price'];
    image = json['image'];
    leftPrice = json['left_price'];
    rightPrice = json['right_price'];
    percent = json['percent'];
    isAnimating = json['is_animating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prize'] = prize;
    data['buy'] = buy;
    data['price'] = price;
    data['image'] = image;
    data['left_price'] = leftPrice;
    data['right_price'] = rightPrice;
    data['percent'] = percent;
    data['is_animating'] = isAnimating;

    return data;
  }
}
