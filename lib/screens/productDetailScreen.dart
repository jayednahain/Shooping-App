import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/productProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  ProductDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    // #3 filter product using current product id from provider object
    //#3
    final allProduct = Provider.of<ProductProvider>(context).allItems;
    final singleProduct = allProduct.firstWhere((item) => item.id == productID);
    print(singleProduct);
    return Scaffold(
      appBar: AppBar(
        title: Text(productID.toString()),
      ),
    );
  }
}
