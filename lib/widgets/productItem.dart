import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/screens/productDetailScreen.dart';

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;

  ProductItem({super.key, this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            //sending id argument on product detail page
            arguments:id
            );
        },
        child: GridTile(
          header: Text("hellow"),
          child: Image.network(imageUrl!, fit: BoxFit.cover),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
            title: Text(title!, textAlign: TextAlign.center),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
