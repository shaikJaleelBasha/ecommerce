import 'package:flutter/material.dart';
import 'payment_screen.dart';  // Assuming you already have a PaymentScreen

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart'; // Route for navigation

  // Sample Cart data (You can manage cart data more efficiently using state management or a provider)
  static List<Map<String, String>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    // Retrieve cart items
    final cartItems = CartScreen.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.orange,
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty.',
          style: TextStyle(fontSize: 20),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display cart items
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(
                        item['imageUrl']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['title']!),
                      subtitle: Text('\$${item['price']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remove item from cart
                          CartScreen.cartItems.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${item['title']} removed from cart')),
                          );
                          // Trigger a rebuild by using setState
                          (context as Element).markNeedsBuild();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            // Proceed to checkout button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(cartItems: cartItems),
                  ),
                );
              },
              child: Text('Proceed to Checkout'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  // Static method to add an item to the cart
  static void addToCart(Map<String, String> item) {
    cartItems.add(item);
  }
}
