import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  ProductItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Image.asset(
            imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Product Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Product Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 14, color: Colors.orange),
            ),
          ),
          // Add to Cart and Buy Now buttons (Stacked vertically)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Add to Cart Button
                ElevatedButton(
                  onPressed: onAddToCart,
                  child: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 36), // Adjusted size
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(fontSize: 14), // Smaller font size
                  ),
                ),
                SizedBox(height: 8), // Space between the buttons
                // Buy Now Button
                ElevatedButton(
                  onPressed: onBuyNow,
                  child: Text('Buy Now'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 36), // Adjusted size
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(fontSize: 14), // Smaller font size
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
