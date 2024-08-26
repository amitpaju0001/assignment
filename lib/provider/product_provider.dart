import 'package:assignment/model/product_detail_model.dart';
import 'package:assignment/model/product_model.dart';
import 'package:assignment/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> _products = [];
  ProductDetailModel? _productDetail;

  bool _isLoading = false;
  String _errorMessage = '';

  List<ProductModel> get products => _products;
  ProductDetailModel? get productDetail => _productDetail;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _productService.fetchProducts();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductDetail(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _productDetail = await _productService.fetchProductDetail(id);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
