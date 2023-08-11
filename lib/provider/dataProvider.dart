import 'package:e_commerce/model/product_model.dart';

import 'package:flutter/cupertino.dart';

class dataProvider extends ChangeNotifier {
  late final ProductModel product;

  List<ProductModel> _cart = [];
  List<ProductModel> get carts => _cart;

  void addToCart(ProductModel products_toCart) {
    _cart.add(products_toCart);
    notifyListeners();
  }

  void removefromCart(ProductModel products_remove) {
    _cart.remove(products_remove);
    notifyListeners();
  }

  void addItem(String productId, String productName) {
    for (var item in _cart) {
      if (item.id == productId) {
        item.count++;
        notifyListeners();
        return;
      }
    }
    _cart.add(product);
    notifyListeners();
  }
}
