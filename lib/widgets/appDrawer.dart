import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

//navigation
import 'package:shopping_app/screens/productOrderScreen.dart';
import 'package:shopping_app/screens/userProductScreen.dart';

// #drawer1.1
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return (Drawer(
      child: Column(
        children: [
          AppBar(title: Text("hellow"), automaticallyImplyLeading: false),
          //#drawer1.3
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              // navigate to home page
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Order"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProductOrderScreen.routeName);},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage Product"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
            },
          )
          
        ],
      ),
    ));
  }
}
