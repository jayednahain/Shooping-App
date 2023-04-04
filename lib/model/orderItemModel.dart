import 'package:flutter/cupertino.dart';
import 'package:shopping_app/model/chartModel.dart';
// import 'package:shopping_app/widgets/cartItem.dart';

//(product_order1.1)
class OrderItemModel {
  final String? id;
  final double? amount;
  // A single order have multiple porduct
  final List<CartItemModel>? products;
  final DateTime? dateTime;

  OrderItemModel({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}
