import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;

  ProductItem({super.key, this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Text("hellow"),
      child: Image.network(imageUrl!, fit: BoxFit.cover),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        title: Text(title!, textAlign: TextAlign.center),
        trailing: IconButton(
          icon: Icon(Icons.shopping_bag),
          onPressed: () {},
        ),
      ),
    );
  }
}
