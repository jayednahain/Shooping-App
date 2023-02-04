//all product list
import 'package:flutter/material.dart';
//prduct model
import '../model/productModel.dart';
//single product item
import '../widgets/productItem.dart';
//product GridView
import './productGridView.dart';

class ProductOverViewScreen extends StatelessWidget {
  ProductOverViewScreen({super.key});
  final List<ProductModel> loadedPorducts = [
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProductGridView()
    );
  }
}


