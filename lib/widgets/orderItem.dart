import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
// import '../provider/ordersProvider.dart';
import '../model/orderItemModel.dart';
import 'package:intl/intl.dart';

//(product_order1.10)
class OrderItem extends StatelessWidget {
  final OrderItemModel order;
  const OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle:
                Text(DateFormat('dd mm yyyy hh:mm').format(order.dateTime!)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
