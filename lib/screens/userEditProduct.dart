import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// (editproduct1.1)
class UserEditProduct extends StatefulWidget {
  static const routeName = '/edit-product';
  const UserEditProduct({super.key});

  @override
  State<UserEditProduct> createState() => _UserEditProductState();
}

class _UserEditProductState extends State<UserEditProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit text')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        //(editproduct1.2)
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
            )
          ],
        )),
      ),
    );
  }
}
