//all product list
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cartProvider.dart';
import 'package:shopping_app/provider/productProvider.dart';
//prduct model
import '../model/productModel.dart';
//single product item
import '../widgets/productItem.dart';
//product GridView
import '../widgets/productGridView.dart';
//import cart badge
import '../widgets/badge.dart';

// #enum_1.1
enum FilterOptions { Favorites, All }

class ProductOverViewScreen extends StatefulWidget {
  ProductOverViewScreen({super.key});

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  // #local_filter1.2
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    // #global_filter_1.5
    // final productConainer = Provider.of<ProductProvider>(context, listen: false);

    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          // #popupmenu_1.1
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                onSelected: (FilterOptions selectedValue) {
                  // global_filter_1.6
                  // productConainer.showFavoritesOnly();
                  // productConainer.showAll();

                  // #local_filter1.3
                  // if (_showOnlyFavorite =!_showOnlyFavorite) {
                  print("diff-- run");
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      _showOnlyFavorite = true;
                    } else {
                      _showOnlyFavorite = false;
                    }
                  });
                  // }
                },
                itemBuilder: (_) => [
                      PopupMenuItem(
                          child: Text("show only facorite"),
                          value: FilterOptions.Favorites),
                      PopupMenuItem(
                          child: Text("show All"), value: FilterOptions.All)
                    ]),

            // #chart1.14
            Consumer<CartProvider>(
              // #chart1.11
              builder:(_,cart,ch)=>Badge(
                child: ch,
                value: cart.cartItemCount.toString()),
              // #chart1.15  
              child:IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ) ,  
            )
          ],
        ),
        // #local_filter1.4
        body: ProductGridView(_showOnlyFavorite));
  }
}


