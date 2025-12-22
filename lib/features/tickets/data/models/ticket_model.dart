class TicketDataModel{
  List<TicketModel> data;
  TicketDataModel({required this.data});

  factory TicketDataModel.fromJson(Map<String, dynamic> json) {
    return TicketDataModel(
      data: (json['data']as   List<dynamic>).map((e) =>TicketModel.fromJson(e)).toList()
     
    );
  }


  Map<String, dynamic> toJson() {
    return {
   
    };
  }
}


class TicketModel {
  final String issuedOn;
  final String price;
  final String product;
  final String soldOut;
  final String ticketNo;

  TicketModel({
    required this.issuedOn,
    required this.price,
    required this.product,
    required this.soldOut,
    required this.ticketNo,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      issuedOn: json['issuedOn'] ?? '',
      price: json['price'] ?? '',
      product: json['product'] ?? '',
      soldOut: json['soldOut'] ?? '',
      ticketNo: json['ticketNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'issuedOn': issuedOn,
      'price': price,
      'product': product,
      'soldOut': soldOut,
      'ticketNo': ticketNo,
    };
  }
}
