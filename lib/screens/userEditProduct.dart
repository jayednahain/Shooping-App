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
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController =TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  @override
  void initState() {
    _imageUrlController.addListener(_updateImageUrl);
    super.initState();
  }
  void _updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      setState(() {});
    }
  }

  @override
  // (editproduct1.6)
  void dispose() {
    _imageUrlController.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }


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
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              //(editproduct1.6)
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              focusNode: _descriptionFocusNode,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 8,right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey),
                  ),
                  child: _imageUrlController.text.isEmpty? Center(
                      child: Text("Enter URL"))
                      :FittedBox(child:
                  Image.network(_imageUrlController.text)
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "type image URl"),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    focusNode: _imageUrlFocusNode,
                  ),
                )
              ],
            )

          ],
        )),
      ),
    );
  }
}
