import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/productProvider.dart';

//prduct model
import '../model/productModel.dart';
//single product item
import '../widgets/productItem.dart';

class ProductGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //#2 creating a instance of provider class
    final productData = Provider.of<ProductProvider>(context);
    final productsList = productData.allItems;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //two column
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        //how the grid structure
        itemBuilder: (ctx, i) => ProductItem(
              id: productsList[i].id,
              title: productsList[i].title,
              imageUrl: productsList[i].imageUrl,
            ));
  }
}
