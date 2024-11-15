import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  CategoryItem({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8), // Add padding around the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners for the container
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // This ensures the size of the column is minimal
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 80, // Slightly increased image size for better visibility
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14, // Increased font size
              fontWeight: FontWeight.bold, // Added font weight
              color: Colors.black87, // Slightly darker text color for better readability
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
