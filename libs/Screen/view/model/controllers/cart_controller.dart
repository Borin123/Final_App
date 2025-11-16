import 'package:final_app/models/product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  var cartItems = <Product, int>{}.obs;

  // Add product with quantity
  void addProduct(Product product, {int quantity = 1}) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + quantity;
    } else {
      cartItems[product] = quantity;
    }
  }

  void removeProduct(Product product) {
    if (cartItems.containsKey(product) && cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    } else {
      cartItems.remove(product);
    }
  }

  int getQuantity(Product product) {
    return cartItems[product] ?? 0;
  }

  int get totalItems => cartItems.values.fold(0, (sum, qty) => sum + qty);
}
