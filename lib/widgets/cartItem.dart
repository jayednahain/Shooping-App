import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cartProvider.dart';




// #chart1.16
// (#chart1.21)
class CartItem extends StatelessWidget {

  final String? productId;
  final String? id;
  final double? price;
  final int? quantity;
  final String? title;

  CartItem({
    this.productId,
    this.id,
    this.price,
    this.quantity,
    this.title
    }) ;

  @override
  Widget build(BuildContext context) {
    //(#chart1.23)
    final cart = Provider.of<CartProvider>(context);
    return Dismissible(
      onDismissed: (direction){
        //(#chart1.24)
        cart.removeItem(productId!);
      },
      direction: DismissDirection.endToStart,
      background:Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          color: Colors.red,
          height: 20,
          child: Icon(Icons.delete,color: Colors.white,size: 30,),
        ),
      ),
      key: ValueKey(id),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 4
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text("${price}"),
          ),
          title: Text(title.toString()),
          subtitle: Text("${price! * quantity!}",
            style:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold ),),
          trailing: Text('${quantity}'),
        ),
      ),
    );
  }
}

// title: Text(title),
//           subtitle: Text('Total price: \$${(price*quantity)}',
