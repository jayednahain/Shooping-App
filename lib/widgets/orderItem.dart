import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
// import '../provider/ordersProvider.dart';
import '../model/orderItemModel.dart';
import 'package:intl/intl.dart';

//(product_order1.1)
//(product_order1.1)
class OrderItem extends StatefulWidget {
  final OrderItemModel order;
  const OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  //product_order1.14
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd/mm/yyyy hh:mm').format(widget.order.dateTime!)),
            trailing: IconButton(
              icon:
                  _expanded ? Icon(Icons.expand_more) : Icon(Icons.expand_less),
              onPressed: () {
                //(product_order1.14)
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
            height: min( (widget.order.products?.length)! * (20.0+10) ,100),
            child: ListView(
              children:widget.order.products!.map((singleProduct) => 
              //(product_order1.15)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    singleProduct.title.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "${singleProduct.quantity}x \$${singleProduct.price!.toStringAsFixed(2)}",
                     style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    )
                  )
                ],
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
