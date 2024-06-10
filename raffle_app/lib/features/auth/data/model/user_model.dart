class UserModel {
  String? email;
  String? password;
  String? uid;
  String? name;
  String? surname;
  String? number;

  UserModel({this.email, this.password, this.uid, this.name, this.surname, this.number});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    uid = json['uid'];
    name = json['name'];
    surname = json['surname'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['uid'] = uid;
    data['name'] = name;
    data['surname'] = surname;
    data['number'] = number;
    return data;
  }
}
