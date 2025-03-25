import 'package:cartproduct/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE4E1), // Light pink background
      appBar: AppBar(
        backgroundColor: Color(0xFFFFE4E1),
        title: Center(
          child: Text(
            'My Cart',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        elevation: 0, // Remove shadow under the app bar
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Column(
            children: [
              // Cart Item List
              Expanded(
                child: cartProvider.cart.isEmpty
                    ? Center(
                        child: Text(
                          'Your cart is empty!',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: cartProvider.cart.length,
                        itemBuilder: (context, index) {
                          final product = cartProvider.cart[index];
                          double originalPrice = double.tryParse(
                                  product['originalPrice'].toString()) ??
                              0.0;
                          double offerPrice = double.tryParse(
                                  product['offerPrice'].toString()) ??
                              0.0;

                          // Calculate discount percentage safely
                          int discount = product.containsKey('offerPercentage')
                              ? product['offerPercentage']
                              : originalPrice > 0
                                  ? (((originalPrice - offerPrice) /
                                              originalPrice) *
                                          100)
                                      .round()
                                  : 0;

                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Product Image with fallback in case of error
                                  Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(product['thumbnail']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),

                                  // Product Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          product['brand'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700]),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          '₹${originalPrice.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '₹${offerPrice.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '$discount% OFF',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Quantity Controls
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove_circle,
                                            color: Colors.red, size: 28),
                                        onPressed: () {
                                          if (product['quantity'] > 1) {
                                            cartProvider.updateQuantity(
                                                index, -1);
                                          } else {
                                            cartProvider.removeFromCart(index);
                                          }
                                        },
                                      ),
                                      Text(
                                        "${product['quantity']}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add_circle,
                                            color: Colors.green, size: 28),
                                        onPressed: () => cartProvider
                                            .updateQuantity(index, 1),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

              // Bottom Summary Container (Always Visible)
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Total Amount Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Amount:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '₹${cartProvider.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    // Buy Now Button with Item Count
                    SizedBox(
                      width: 180,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: cartProvider.totalItems == 0
                            ? null
                            : () {
                                // Handle checkout action
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cartProvider.totalItems == 0
                              ? Colors.grey
                              : Colors.pink,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Check Out',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 8),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: Text(
                                '${cartProvider.totalItems}',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
