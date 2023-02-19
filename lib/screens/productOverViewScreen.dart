//all product list
import 'package:flutter/material.dart';
//prduct model
import '../model/productModel.dart';
//single product item
import '../widgets/productItem.dart';
//product GridView
import '../widgets/productGridView.dart';

// #enum_1.1
enum FilterOptions{
  Favorites,
  All
}

class ProductOverViewScreen extends StatelessWidget {
  ProductOverViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // #popupmenu_1.1
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert
              ),
              onSelected: (FilterOptions selectedValue) {
                  print(selectedValue);
              },
              itemBuilder: (_) => [
                PopupMenuItem( child: Text("show only facorite"), value: FilterOptions.Favorites),
                PopupMenuItem(child: Text("show All"), value: FilterOptions.All)
              ]
            ),
          ],
        ),
        body: ProductGridView());
  }
}
