import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'product_details_screen.dart';
import 'category_item.dart';
import 'clothing_screen.dart';
import 'electronics_screen.dart';
import 'books_screen.dart';
import 'watch_screen.dart';
import 'cart_screen.dart';  // Assuming you have a CartScreen

// Dummy product list
final List<Map<String, String>> products = [
  {
    'title': 'Product 1',
    'imageUrl': 'assets/images/product1.jpg',
    'cost': '10.00',
  },
  {
    'title': 'Product 2',
    'imageUrl': 'assets/images/product2.jpg',
    'cost': '20.00',
  },
  {
    'title': 'Product 3',
    'imageUrl': 'assets/images/product3.jpg',
    'cost': '30.00',
  },
  {
    'title': 'Product 4',
    'imageUrl': 'assets/images/product4.jpg',
    'cost': '40.00',
  },
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartScreen
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout functionality here
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Logged out successfully!'),
              ));
              // Navigate to the login screen or handle logout logic
              Navigator.pushReplacementNamed(context, '/login'); // Example
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Section (Carousel)
            Container(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/images/banner1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/banner2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/banner3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Category Section (Example categories)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Explore Our Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Use a GridView with shrinkWrap to prevent overflow
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ElectronicsScreen(),
                            ),
                          );
                        },
                        child: CategoryItem(
                          title: 'Electronics',
                          imageUrl: 'assets/images/electronics.jpeg',
                        ),
                      );
                    case 1:
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClothingScreen(),
                            ),
                          );
                        },
                        child: CategoryItem(
                          title: 'Clothing',
                          imageUrl: 'assets/images/clothing.jpeg',
                        ),
                      );
                    case 2:
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WatchScreen(),
                            ),
                          );
                        },
                        child: CategoryItem(
                          title: 'Watch',
                          imageUrl: 'assets/images/watches.jpg',
                        ),
                      );
                    case 3:
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BooksScreen(),
                            ),
                          );
                        },
                        child: CategoryItem(
                          title: 'Books',
                          imageUrl: 'assets/images/books.jpeg',
                        ),
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
            SizedBox(height: 20),

            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Featured Products',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Featured products grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailsScreen.routeName,
                      arguments: product,
                    );
                  },
                  child: ProductItem(
                    imageUrl: product['imageUrl']!,
                    title: product['title']!,
                    price: '\$${product['cost']}',
                    onAddToCart: () {
                      // Add the product to the cart
                      Cart.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product['title']} added to cart')),
                      );
                    },
                    onBuyNow: () {
                      // Navigate to the Payment Screen directly
                      Navigator.pushNamed(context, '/payment', arguments: product);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
