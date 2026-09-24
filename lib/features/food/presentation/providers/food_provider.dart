import 'package:flutter/foundation.dart';

import '../../data/food_api.dart';
import '../../domain/food_model.dart';

class FoodProvider extends ChangeNotifier {
  final FoodApi _foodApi;

  FoodProvider({FoodApi? foodApi})
      : _foodApi = foodApi ?? FoodApi();

  List<FoodItem> _foods = [];
  bool _isLoading = false;
  String? _error;

  List<FoodItem> get foods => _foods;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadFoods() async {
    _isLoading = true;
    _error = null;

    notifyListeners();

    try {
      final result = await _foodApi.getFoodList();

      _foods = result;
    } catch (e) {
      _error = e.toString();
      _foods = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadFoods();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearFoods() {
    _foods = [];
    notifyListeners();
  }
}