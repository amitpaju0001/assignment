import 'package:assignment/provider/product_provider.dart';
import 'package:assignment/ui/widget/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (productProvider.errorMessage.isNotEmpty) {
            return Center(child: Text('Error: ${productProvider.errorMessage}'));
          } else if (productProvider.products.isEmpty) {
            return const Center(child: Text('No products available'));
          } else {
            return ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(productId: product.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
