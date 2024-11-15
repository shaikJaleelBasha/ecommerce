import 'package:flutter/material.dart'; // Flutter's Material package

// Product data
final List<Map<String, String>> productData = [
  {
    'title': 'Product 1',
    'cost': '19.99',
    'imageUrl': 'assets/product1.jpg', // Ensure your image path is correct
  },
  {
    'title': 'Product 2',
    'cost': '29.99',
    'imageUrl': 'assets/product2.jpg', // Ensure your image path is correct
  },
  // Add more products here
];

// Define color constants for consistent use
const Color greyBackgroundColor = Color(0xFFB0BEC5); // A light grey shade
const Color primaryColor = Color(0xFFFF5722); // A vibrant orange (could be used for buttons, etc.)
const Color primaryTextColor = Color(0xFF333333); // Dark grey for primary text
const Color secondaryTextColor = Color(0xFF757575); // Lighter grey for secondary text

// You can also define dynamic colors if needed
Color getDynamicColor() {
  return Colors.blue.shade400; // Example of getting a dynamic color from the material palette
}
