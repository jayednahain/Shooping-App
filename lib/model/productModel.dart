import 'package:flutter/cupertino.dart';

// #6.1
class ProductModel with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavorite;

  ProductModel(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});
  //#9
  void UpdateFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
