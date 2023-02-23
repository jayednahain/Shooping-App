import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cartProvider.dart';

// #chart1.15
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    // #chart1.17.1
    final cart = Provider.of<CartProvider>(context);
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
                  Text("Total",style: TextStyle(fontSize: 10)),
                  // #chart1.17.1
                  Chip(label: Text(cart.totalAmount.toString())),
                  TextButton(onPressed:() {}, child: Text("ORDER NOW"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
