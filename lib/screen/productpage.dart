import 'package:cartproduct/model/notification.dart';
import 'package:cartproduct/model/productTile.dart';
import 'package:cartproduct/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addtocart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List products = []; // Stores the list of products
  bool isLoading = false; // Tracks loading state
  final String apiUrl = 'https://dummyjson.com/products'; // API endpoint

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Fetch products when the page is initialized
  }

  /// Fetches product data from the API and updates the UI.
  Future<void> fetchProducts() async {
    if (isLoading) return; // Prevent multiple fetch calls
    setState(() => isLoading = true);

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> fetchedProducts = json.decode(response.body)['products'];

        setState(() {
          products = fetchedProducts.map((product) {
            double price = (product['price'] ?? 0).toDouble();
            double discount = (product['discountPercentage'] ?? 0).toDouble();
            double offerPrice = price - (price * discount / 100);

            return {
              'id': product['id'] ?? 0,
              'title': product['title'] ?? 'No Title',
              'brand': product['brand'] ?? 'No Brand',
              'originalPrice': price.toStringAsFixed(2),
              'offerPrice': offerPrice.toStringAsFixed(2),
              'offerPercentage': discount.toStringAsFixed(0),
              'thumbnail': product['thumbnail'] ?? '',
            };
          }).toList();
        });
      } else {
        print("Failed to load products: \${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching products: \$e");
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE4E1), // Light pink background
      appBar: AppBar(
        backgroundColor: Color(0xFFFFE4E1),
        title: Text(
          'Catalogue',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Navigate to AddToCartPage when cart icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToCartPage()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loader while fetching data
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75, // Adjusting the aspect ratio for UI balance
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    product: products[index],
                    onAddToCart: () {
                      // Add product to cart using Provider
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(products[index]);

                      // Show success notification
                      NotificationService.showSuccessNotification(
                          context, "Item added to cart!");
                    },
                  );
                },
              ),
            ),
    );
  }
}
