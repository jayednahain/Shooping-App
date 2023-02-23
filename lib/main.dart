import 'package:flutter/material.dart';
import 'package:shopping_app/model/chartModel.dart';
import 'package:shopping_app/screens/productDetailScreen.dart';
import 'package:provider/provider.dart';

//product list Screen
import './screens/productOverViewScreen.dart';
//product provider
import './provider/productProvider.dart';
// cart provider
import './provider/cartProvider.dart';


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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor:Colors.orange),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName:(context) => ProductDetailScreen()
        },
      ),
    );
  }
}

