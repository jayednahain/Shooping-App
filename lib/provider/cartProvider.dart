import 'package:flutter/foundation.dart';
import '../model/chartModel.dart';

//#chart1.2

class cartProvider with ChangeNotifier {
  //#chart1.3
  Map<String, CartItemModel>? _allCartItems;

  //#chart1.3
  Map<String, CartItemModel> get allCartItems {
    return {..._allCartItems!};
  }

   //#chart1.4 // add product to cart
  void addItem(String productId, double price, String title) {


     //#chart1.5
    if (_allCartItems!.containsKey(productId)) {
      _allCartItems!.update(
          productId,
          (existingCartItem) => CartItemModel(
              id: existingCartItem.id,
              title: existingCartItem.title, 
              quantity: existingCartItem.quantity! + 1, 
              price: price)
            );
    } else {
       //#chart1.6
      _allCartItems!.putIfAbsent(
          productId,
          () => CartItemModel(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
  }
}
