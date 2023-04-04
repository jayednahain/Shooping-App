import 'package:flutter/cupertino.dart';
import 'package:shopping_app/model/orderItemModel.dart';
import 'package:shopping_app/model/chartModel.dart';

// (product_order1.3)
class OrdersProvider with ChangeNotifier {
  List<OrderItemModel> _allOrders = [];

  List<OrderItemModel> get allOrders {
    return [..._allOrders];
  }

  //(product_order1.4)
  void addOrder(List<CartItemModel> singleCartProduct, double total) {
    _allOrders.insert(
        0,
        OrderItemModel(
            id: DateTime.now().toString(),
            amount: total,
            products: singleCartProduct,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
