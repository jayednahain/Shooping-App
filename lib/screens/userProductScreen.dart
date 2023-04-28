import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/screens/userEditProduct.dart';
//userProduct1.2
import '../model/productModel.dart';
import '../provider/productProvider.dart';
//widget
import '../widgets/userProductItem.dart';
import '../widgets/appDrawer.dart';

//userProduct1.1
class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //userProduct1.3
    final allProduct = Provider.of<ProductProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UserEditProduct.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: allProduct.allItems.length,
            //(userProduct1.5)
            itemBuilder: (_, i) => UserProductItem(
                title: allProduct.allItems[i].title,
                imageUrl: allProduct.allItems[i].imageUrl)),
      ),
    );
  }
}
