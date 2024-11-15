import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String cost;
  final String imageUrl;
  final VoidCallback onBuy;

  const ProductCard({
    required this.title,
    required this.cost,
    required this.imageUrl,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("\$$cost", style: TextStyle(fontSize: 14, color: Colors.green)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onBuy,
              child: Text("View Details"),
            ),
          ),
        ],
      ),
    );
  }
}
