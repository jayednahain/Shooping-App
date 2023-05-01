import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;

// (editproduct1.1)
class UserEditProduct extends StatefulWidget {
  static const routeName = '/edit-product';
  const UserEditProduct({super.key});

  @override
  State<UserEditProduct> createState() => _UserEditProductState();
}

class _UserEditProductState extends State<UserEditProduct> {
  final _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit text')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        //(editproduct1.3)
        child: Form(
            child: ListView(
          children: [
            //(editproduct1.4)
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              //(editproduct1.7)
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            //(editproduct1.4)
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              // textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              //(editproduct1.6)
              focusNode: _priceFocusNode,
            )
          ],
        )),
      ),
    );
  }
}
