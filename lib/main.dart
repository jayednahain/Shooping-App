import 'package:flutter/material.dart';
import 'package:shopping_app/screens/productDetailScreen.dart';
import 'package:provider/provider.dart';

//product list Screen
import './screens/productOverViewScreen.dart';
//product provider
import './provider/productProvider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //#1 initial provider
      create: (context) => ProductProvider(),
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

