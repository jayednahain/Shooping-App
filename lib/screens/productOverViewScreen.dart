//all product list
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/productProvider.dart';
//prduct model
import '../model/productModel.dart';
//single product item
import '../widgets/productItem.dart';
//product GridView
import '../widgets/productGridView.dart';

// #enum_1.1
enum FilterOptions { Favorites, All }

class ProductOverViewScreen extends StatelessWidget {
  ProductOverViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // #global_filter_1.5
    final productConainer =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          // #popupmenu_1.1
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                onSelected: (FilterOptions selectedValue) {
                  // print(selectedValue);
                  // global_filter_1.6
                  if (selectedValue == FilterOptions.Favorites) {
                    productConainer.showFavoritesOnly();
                  } else {
                    productConainer.showAll();
                  }
                },
                itemBuilder: (_) => [
                      PopupMenuItem(
                          child: Text("show only facorite"),
                          value: FilterOptions.Favorites),
                      PopupMenuItem(
                          child: Text("show All"), value: FilterOptions.All)
                    ]),
          ],
        ),
        body: ProductGridView());
  }
}
