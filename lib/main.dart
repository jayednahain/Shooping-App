import 'package:flutter/material.dart';
import 'package:shopping_app/screens/productDetailScreen.dart';
//product list
import './screens/productOverViewScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor:Colors.orange),
      home: ProductOverViewScreen(),
      routes: {
        ProductDetailScreen.routeName:(context) => ProductDetailScreen()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Shopping App")),
      body: Center(
        child: Text("my shopping app"),
      ),
    );
  }
}
