// models/product.dart
class ProductModel {
  final int id;
  final String imageUrl;
  final String title;
  final String brand;
  final double price;
  final double rating;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      imageUrl: json['thumbnail'],
      title: json['title'] ?? '',
      brand: json['brand'] ?? '',
      price: double.parse(json['price'].toString()),
      rating: double.parse(json['rating'].toString()),
    );
  }
}

