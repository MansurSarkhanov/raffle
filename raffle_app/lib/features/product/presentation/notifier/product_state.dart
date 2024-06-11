import 'package:equatable/equatable.dart';

import '../../data/model/product_model.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductProgress extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel>? productModel;
  ProductSuccess({this.productModel});
}

class ProductError extends ProductState {}
