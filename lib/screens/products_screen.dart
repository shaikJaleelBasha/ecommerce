import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = "/product-list";

  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 6.0,
            childAspectRatio: screenWidth / 250,
          ),
          itemCount: productData.length,
          itemBuilder: (context, index) {
            final product = productData[index];
            return ProductCard(
              title: product['title']!,
              cost: product['cost']!,
              imageUrl: product['imageUrl']!,
              onBuy: () {
                Navigator.pushNamed(
                  context,
                  '/product-details',
                  arguments: product,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
