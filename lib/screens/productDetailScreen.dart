import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/productProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  ProductDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    //filter product using current product id from provider object
    // final allProduct = Provider.of<ProductProvider>(context).allItems;
    //#3
    //final singleProduct = allProduct.firstWhere(((element) => element.id == productID));
    //#4
    final singleProduct = Provider.of<ProductProvider>(context).findProductById(productID); 
    

    return Scaffold(
      appBar: AppBar(
        title: Text(singleProduct.title.toString()),
      ),
    );
  }
}
