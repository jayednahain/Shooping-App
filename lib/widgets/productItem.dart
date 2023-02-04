import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductItem extends StatelessWidget {

  final String? id;
  final String? title;
  final String? imageUrl;

  ProductItem({
    super.key,
    this.id,
    this.title,
    this.imageUrl
    });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child:Image.network(
        imageUrl!,
        //image will take all the abatable space
        fit: BoxFit.cover),
    );
  }
}
