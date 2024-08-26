import 'package:assignment/model/product_model.dart';
import 'package:assignment/model/product_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  final String _baseUrl = 'https://dummyjson.com';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['products'];
      return json.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductDetailModel> fetchProductDetail(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return ProductDetailModel.fromJson(json);
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
