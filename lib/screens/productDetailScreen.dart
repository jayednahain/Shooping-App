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
    //#5
    final singleProduct = Provider.of<ProductProvider>(context,listen: false).findProductById(productID); 
    return Scaffold(
      appBar: AppBar(
        title: Text(singleProduct.title.toString()),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(singleProduct.imageUrl!,fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text('\$${singleProduct.price}',style:TextStyle(color:Colors.grey,fontSize: 20)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                '${singleProduct.description}',
                textAlign: TextAlign.center,
                softWrap: true,
                style:TextStyle(color:Colors.black,fontSize: 30))),
          ],
        ),
      ),
    );
  }
}
