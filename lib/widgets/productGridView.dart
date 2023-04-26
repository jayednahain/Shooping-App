import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/productProvider.dart';

//prduct model
import '../model/productModel.dart';
//single product item
import 'productItem.dart';

class ProductGridView extends StatelessWidget {
  
  // #local_filter1.5 
  final showFav;
  ProductGridView(this.showFav);

  @override
  Widget build(BuildContext context) {
    //#2 creating a instance of provider class
    final productData = Provider.of<ProductProvider>(context);

    // #local_filter1.6 showing data depending on argument
    final productsList = showFav ? productData.favoriteItem : productData.allItems;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //two column
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        // #provider_two
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: productsList[i],
              child: ProductItem(),
            ));
  }
}
