import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cartProvider.dart';
import 'package:shopping_app/provider/ordersProvider.dart';
import 'package:shopping_app/widgets/cartItem.dart';
import 'package:shopping_app/model/orderItemModel.dart';

// #chart1.15
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    // #chart1.17.1
    final cart = Provider.of<CartProvider>(context);
    //(#chart1.21.2)
    final allCartItemsKeys = cart.allCartItems.keys.toList();
    final allCartItem = cart.allCartItems.values.toList();
    //(product_order1.12) 
    final order = Provider.of<OrdersProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 10)),
                  // #chart1.17.1
                  Chip(label: Text(cart.totalAmount.toStringAsFixed(2))),
                  TextButton(
                      onPressed: () {
                        //(product_order1.7)
                        order.addOrder(cart.allCartItems.values.toList(),
                        cart.totalAmount);
                        //(product_order1.8)
                        cart.clearCart();
                      },
                      child: Text("ORDER NOW"))
                ],
              ),
            ),
          ),
          // (#chart1.20)
          SizedBox(height: 10),
          Expanded(
              //(#chart1.21.1)
              child: ListView.builder(
                  itemCount: cart.cartItemCount,
                  itemBuilder: (ctx, i) => CartItem(
                        productId: allCartItemsKeys[i],
                        id: allCartItem[i].id,
                        price: allCartItem[i].price,
                        quantity: allCartItem[i].quantity,
                        title: allCartItem[i].title,
                      )))
        ],
      ),
    );
  }
}
