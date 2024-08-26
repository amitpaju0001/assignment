
class ProductDetailModel {
  final String imageUrl;
  final String title;
  final String brand;
  final double price;
  final double rating;
  final int reviewCount;
  final String description;

  ProductDetailModel({
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.description,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      imageUrl: json['thumbnail'] ?? '',
      title: json['title'] ?? '',
      brand: json['brand'] ?? '',
      price: double.parse(json['price'].toString()),
      rating: double.parse(json['rating'].toString()),
      reviewCount: json['reviewCount'] ?? 0,
      description: json['description'] ?? '',
    );
  }
}