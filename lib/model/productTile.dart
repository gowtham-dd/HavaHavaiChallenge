import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Map<String, dynamic> product; // Product details passed as a Map
  final VoidCallback
      onAddToCart; // Callback function when "Add to Cart" is clicked

  const ProductTile({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      // Ensures tile height adjusts to content dynamically
      child: Card(
        elevation: 3, // Adds shadow for a lifted effect
        margin: EdgeInsets.symmetric(
            horizontal: 6, vertical: 4), // Minimal spacing between tiles
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)), // Rounded corners
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Prevents extra space
          children: [
            Stack(
              children: [
                // Displays the product image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                  child: Image.network(
                    product['thumbnail'], // Product image URL
                    width: double.infinity,
                    height: 190,
                    fit:
                        BoxFit.cover, // Ensures image covers the space properly
                  ),
                ),
                // "Add to Cart" button positioned at the bottom right of the image
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: OutlinedButton(
                    onPressed: onAddToCart,
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      backgroundColor: Colors.white, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      side: BorderSide(color: Colors.pink), // Border color
                    ),
                    child: Text(
                      'ADD',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Product details section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Product title with bold text
                  Text(
                    product['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow:
                        TextOverflow.ellipsis, // Ensures text doesn't overflow
                  ),
                  SizedBox(height: 2), // Reduced space between elements
                  // Brand name in grey color
                  Text(
                    product['brand'],
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      // Original price with strikethrough effect
                      Text(
                        '₹${product['originalPrice']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 6),
                      // Discounted price in bold
                      Text(
                        '₹${product['offerPrice']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  // Discount percentage in pink color
                  Text(
                    '${product['offerPercentage']}% OFF',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
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
