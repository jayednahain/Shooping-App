import 'package:flutter/material.dart';
import 'package:shopping_app/model/chartModel.dart';
import 'package:shopping_app/provider/ordersProvider.dart';

import 'package:provider/provider.dart';
import 'package:shopping_app/screens/userProductScreen.dart';

//product list Screen
import './screens/productOverViewScreen.dart';
// for routing
import './screens/cartScreen.dart';
import 'package:shopping_app/screens/productDetailScreen.dart';
import './screens/productOrderScreen.dart';



//product provider
import './provider/productProvider.dart';
// cart provider
import './provider/cartProvider.dart';
// order provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // #provider_one
    // setup multi provider
    // #chart1.7
    return MultiProvider(
      //#1 initial provider
      providers: [
        ChangeNotifierProvider(create: (ctx)=>ProductProvider()),
        // #chart1.8
        ChangeNotifierProvider(create: (ctx)=>CartProvider()),
        //product_order1.6
        ChangeNotifierProvider(create: (ctx)=>OrdersProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor:Colors.orange),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName:(context) => ProductDetailScreen(),
          // #chart1.18
          CartScreen.routeName:(context) =>CartScreen(),
          // (#drawer1.1)
          ProductOrderScreen.routeName:(context) =>ProductOrderScreen(),
          //userProduct1.6
          UserProductScreen.routeName:(context) => UserProductScreen()
          

        },
      ),
    );
  }
}

