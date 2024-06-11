class UserInfoModel {
  int? balance;
  String? email;
  String? image;
  String? name;
  String? surname;
  String? uid;

  UserInfoModel({this.balance, this.email, this.image, this.name, this.surname, this.uid});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    email = json['email'];
    image = json['image'];
    name = json['name'];
    surname = json['surname'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['email'] = email;
    data['image'] = image;
    data['name'] = name;
    data['surname'] = surname;
    data['uid'] = uid;
    return data;
  }
}
