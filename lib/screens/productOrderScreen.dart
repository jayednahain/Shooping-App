import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ordersProvider.dart';
import '../widgets/orderItem.dart';
import '../widgets/appDrawer.dart';
//product_order1.9
class ProductOrderScreen extends StatelessWidget {
  const ProductOrderScreen({super.key});

  static const routeName = 'orderScreen';
  @override
  Widget build(BuildContext context) {
    final singleOrderData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('your orders'),
      ),
      body: ListView.builder(
          itemCount: singleOrderData.allOrders.length,
          //(product_order1.12)
          itemBuilder: ((ctx, index) =>
              OrderItem(singleOrderData.allOrders[index]))),
    );
  }
}
