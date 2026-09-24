import 'package:flutter/foundation.dart';

import '../../../food/domain/food_model.dart';
import '../../domain/cart_model.dart';

class CartProvider with ChangeNotifier {
  CartState _cart = CartState(items: []);

  CartState get cart => _cart;

  void addItem(FoodItem food) {
    // Prevent mixing food from different vendors.
    if (_cart.vendorId != null &&
        _cart.vendorId != food.vendorId) {
      throw Exception(
        'Huwezi kuchanganya vyakula kutoka kwa wauzaji tofauti!',
      );
    }

    final List<CartItem> updatedItems = List.from(_cart.items);

    final int existingIndex = updatedItems.indexWhere(
      (item) => item.foodItem.id == food.id,
    );

    if (existingIndex >= 0) {
      updatedItems[existingIndex].quantity += 1;
    } else {
      updatedItems.add(
        CartItem(foodItem: food),
      );
    }

    _cart = CartState(
      vendorId: food.vendorId,
      items: updatedItems,
    );

    notifyListeners();
  }

  void removeItem(String foodId) {
    final List<CartItem> updatedItems = List.from(_cart.items);

    final int existingIndex = updatedItems.indexWhere(
      (item) => item.foodItem.id == foodId,
    );

    if (existingIndex == -1) {
      return;
    }

    if (updatedItems[existingIndex].quantity > 1) {
      updatedItems[existingIndex].quantity -= 1;
    } else {
      updatedItems.removeAt(existingIndex);
    }

    _cart = CartState(
      vendorId: updatedItems.isEmpty
          ? null
          : updatedItems.first.foodItem.vendorId,
      items: updatedItems,
    );

    notifyListeners();
  }

  void clearCart() {
    _cart = CartState(items: []);
    notifyListeners();
  }
}