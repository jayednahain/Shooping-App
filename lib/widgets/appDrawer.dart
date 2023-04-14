import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/productOrderScreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return (Drawer(
      child: Column(
        children: [
          AppBar(title: Text("hellow"), automaticallyImplyLeading: false),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              // navigate to home page
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Order"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProductOrderScreen.routeName);
            },
          )
          
        ],
      ),
    ));
  }
}
