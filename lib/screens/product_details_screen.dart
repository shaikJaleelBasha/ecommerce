import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "/product-details"; // Define route name

  @override
  Widget build(BuildContext context) {
    // Extract the product details passed via the arguments
    final product = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']!), // Display the product title in the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(product['imageUrl']!), // Display the product image
            SizedBox(height: 16),
            Text(product['title']!, style: TextStyle(fontSize: 24)), // Display the product title
            SizedBox(height: 8),
            Text("\$${product['cost']!}", style: TextStyle(fontSize: 20)), // Display the product cost
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/order-summary'); // Navigate to order summary
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
