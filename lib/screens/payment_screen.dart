import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final List<Map<String, String>> cartItems;

  // Constructor for receiving cart items
  PaymentScreen({required this.cartItems});  // named parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display cart items in the payment screen
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return ListTile(
                    title: Text(item['title']!),
                    subtitle: Text('\$${item['price']}'),
                    leading: Image.asset(item['imageUrl']!),
                  );
                },
              ),
            ),
            // Total Price and Proceed to Payment
            ElevatedButton(
              onPressed: () {
                // Handle the payment process
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Proceeding to Payment...')),
                );
              },
              child: Text('Pay Now'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
