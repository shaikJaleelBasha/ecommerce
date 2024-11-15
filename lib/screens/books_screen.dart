import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String price;
  final VoidCallback onBuy;
  final VoidCallback onAddToCart;

  const BookItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.onBuy,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddToCart,
      child: Card(
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

            // Title Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Description Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Price Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$$price',
                style: TextStyle(fontSize: 14, color: Colors.orange),
              ),
            ),

            // Action buttons - Stack them vertically
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Buy Button
                  ElevatedButton(
                    onPressed: onBuy,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 36), // Reduced height
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(fontSize: 14), // Smaller text
                    ),
                    child: Text('Buy'),
                  ),
                  SizedBox(height: 8), // Space between the buttons

                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: onAddToCart,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 36), // Reduced height
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 14), // Smaller text
                    ),
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BooksScreen extends StatelessWidget {
  static const String routeName = '/books'; // Add this for route navigation

  final List<Map<String, String>> books = [
    {
      'title': 'Book 1: Flutter Basics',
      'description': 'A complete guide to Flutter development.',
      'imageUrl': 'assets/images/book1.jpg', // Add actual images to assets
      'price': '15.00',
    },
    {
      'title': 'Book 2: Dart Programming',
      'description': 'Master the Dart programming language for Flutter.',
      'imageUrl': 'assets/images/book2.jpg',
      'price': '20.00',
    },
    {
      'title': 'Book 3: Advanced Flutter',
      'description': 'Take your Flutter skills to the next level.',
      'imageUrl': 'assets/images/book3.jpg',
      'price': '30.00',
    },
    {
      'title': 'Book 4: UI/UX with Flutter',
      'description': 'Learn the art of designing beautiful UI/UX in Flutter.',
      'imageUrl': 'assets/images/book4.jpg',
      'price': '25.00',
    },
    {
      'title': 'Book 5: Flutter for Web',
      'description': 'Build responsive web applications with Flutter.',
      'imageUrl': 'assets/images/book5.jpg',
      'price': '18.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and description
            Text(
              'Dive Into Our Extensive Collection of Books!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Find your next great read across all genres, including fiction, non-fiction, and more.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Section for displaying books
            Expanded(
              child: GridView.builder(
                itemCount: books.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  var book = books[index];
                  return BookItem(
                    title: book['title']!,
                    description: book['description']!,
                    imageUrl: book['imageUrl']!,
                    price: book['price']!,
                    onBuy: () {
                      // Navigate to the payment screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentScreen(book)),
                      );
                    },
                    onAddToCart: () {
                      // Add to cart
                      Cart.addToCart(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${book['title']} added to cart')),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart {
  static List<Map<String, String>> items = [];

  static void addToCart(Map<String, String> item) {
    items.add(item);
  }

  static List<Map<String, String>> getCartItems() {
    return items;
  }
}

class PaymentScreen extends StatelessWidget {
  final Map<String, String> book;

  PaymentScreen(this.book);

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
            Text(
              'Proceed to Payment for "${book['title']}"',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Price: \$${book['price']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Payment processing logic goes here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment successful for ${book['title']}')),
                );
                Navigator.pop(context);
              },
              child: Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
