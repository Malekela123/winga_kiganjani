class FoodItem {
  final String id;
  final String name;
  final String vendorId;
  final String vendorName;
  final String category;
  final double minPrice;
  final double maxPrice;
  final String? imageUrl;
  final bool available;

  FoodItem({
    required this.id,
    required this.name,
    required this.vendorId,
    required this.vendorName,
    required this.category,
    required this.minPrice,
    required this.maxPrice,
    this.imageUrl,
    required this.available,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      vendorId: json['vendorId']?.toString() ?? '',
      vendorName: json['vendorName']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      minPrice: _toDouble(json['minPrice']),
      maxPrice: _toDouble(json['maxPrice']),
      imageUrl: json['imageUrl']?.toString(),
      available: json['available'] == true,
    );
  }

  static double _toDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(value?.toString() ?? '') ?? 0.0;
  }
}