import 'package:flutter/material.dart';

class WatchScreen extends StatelessWidget {
  static const String routeName = '/watch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watches'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Explore Our Exclusive Collection of Watches!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'From luxury to casual styles, we have a watch for every occasion.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Display watches (this would be dynamic with a list, but for now, placeholder)
            ElevatedButton(
              onPressed: () {
                // Implement a navigation or action for adding watches to cart
              },
              child: Text('Browse Watches'),
            ),
          ],
        ),
      ),
    );
  }
}
