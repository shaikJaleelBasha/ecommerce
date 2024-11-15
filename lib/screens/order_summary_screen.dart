import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  static const String routeName = "/order-summary";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1, // Replace with your cart items count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Product Title"),
                  subtitle: Text("\$Price"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle item removal
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
              },
              child: Text("Proceed to Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
