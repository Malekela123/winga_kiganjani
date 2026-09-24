import '../../food/domain/food_model.dart';

class CartItem {
  final FoodItem foodItem;
  int quantity;

  CartItem({
    required this.foodItem,
    this.quantity = 1,
  });

  double get unitPrice => foodItem.minPrice;

  double get totalPrice => unitPrice * quantity;
}

class CartState {
  final String? vendorId;
  final List<CartItem> items;

  CartState({
    this.vendorId,
    required this.items,
  });

  double get grandTotal {
    return items.fold(
      0,
      (sum, item) => sum + item.totalPrice,
    );
  }
}