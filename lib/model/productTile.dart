import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onAddToCart;

  const ProductTile({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      // Ensures tile height matches content
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(
            horizontal: 6, vertical: 4), // Less space between tiles
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Important: Prevents extra space
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                  child: Image.network(
                    product['thumbnail'],
                    width: double.infinity,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: OutlinedButton(
                    onPressed: onAddToCart,
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      side: BorderSide(color: Colors.pink),
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4), // Reduced padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.min, // Ensures content defines height
                children: [
                  Text(
                    product['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2), // Reduced space
                  Text(
                    product['brand'],
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4), // Reduced space
                  Row(
                    children: [
                      Text(
                        '₹${product['originalPrice']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 6),
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
                  SizedBox(height: 2), // Reduced space
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
