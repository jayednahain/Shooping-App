import 'package:flutter/material.dart';
import '../model/productModel.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _privateAllItems = [
    ProductModel(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    ProductModel(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductModel(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductModel(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    )
  ];

  // #global_filter_1.1
  // var _showFavoritesOnly = false;

  List<ProductModel> get allItems {
    // #global_filter_1.2
    // if (_showFavoritesOnly) {
    //   return _privateAllItems.where((item) => item.isFavorite).toList();
    // }
    return [..._privateAllItems];
  }

  // #local_filter1.1
  List<ProductModel> get favoriteItem {
    return _privateAllItems.where((item) => item.isFavorite).toList();
  }

  // // #global_filter_1.3
  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // #global_filter_1.4
  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  //#4
  ProductModel findProductById(String id) {
    return _privateAllItems.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
