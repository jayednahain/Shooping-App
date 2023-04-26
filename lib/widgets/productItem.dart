import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/chartModel.dart';
import 'package:shopping_app/model/productModel.dart';
import 'package:shopping_app/provider/cartProvider.dart';
import 'package:shopping_app/screens/productDetailScreen.dart';

class ProductItem extends StatelessWidget {
  // final String? id;
  // final String? title;
  // final String? imageUrl;
  // ProductItem({super.key, this.id, this.title, this.imageUrl});

  //199
  // (#Consumer1.1)
  @override
  Widget build(BuildContext context) {
    // #8
    final singleProduct = Provider.of<ProductModel>(context, listen: false);
    // #chart1.9
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: singleProduct.id);
        },
        child: GridTile(
          child: Image.network(singleProduct.imageUrl!, fit: BoxFit.cover),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            // #Consumer1.2
            leading: Consumer<ProductModel>(
              builder: (context, singleProduct, child) => IconButton(
                icon: Icon(
                  singleProduct.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  singleProduct.UpdateFavoriteStatus();
                },
              ),
            ),
            title: Text(singleProduct.title!, textAlign: TextAlign.center),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                //(#chart1.10)
                cart.addItem(singleProduct.id!, singleProduct.price!,
                    singleProduct.title!);
                //(snacksBar1.1)
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  margin: EdgeInsets.all(10),
                  behavior: SnackBarBehavior.floating,
                  // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4) ,
                  content: Text('Added item to Chart'),
                  duration: Duration(seconds: 2),
                  //(snacksBar1.2)
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(singleProduct.id!);
                    },
                  ),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
