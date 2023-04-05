import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ordersProvider.dart';
import '../widgets/orderItem.dart';

//product_order1.9
class ProductOrderScreen extends StatelessWidget {
  const ProductOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final singleOrderData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('your orders'),),
      body: ListView.builder(
        itemCount: singleOrderData.allOrders.length,
        //(product_order1.12)
        itemBuilder:((ctx, index) =>OrderItem(singleOrderData.allOrders[index]))),
    );
  }
}
