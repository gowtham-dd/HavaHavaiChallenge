import 'package:cartproduct/model/cartmodel.dart';
import 'package:flutter/material.dart';

class AddToCartTile extends StatelessWidget {
  final CartModel product; // Product data model
  final Function(int)
      onQuantityChanged; // Callback function for quantity changes

  const AddToCartTile({
    Key? key,
    required this.product,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Slight shadow for better UI depth
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Image inside a Container
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover, // Ensures the image covers the container
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Product Details inside a Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1, // Prevents overflow for long names
                  ),
                  const SizedBox(height: 2),

                  // Product Brand
                  Text(
                    product.brand,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 6),

                  // Price & Discount Row
                  Row(
                    children: [
                      // Original Price (Strikethrough)
                      Text(
                        '₹${product.originalPrice}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 6),

                      // Offer Price
                      Text(
                        '₹${product.offerPrice}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 6),

                      // Discount Percentage
                      Text(
                        '${product.discount}% OFF',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Quantity Controls in a Column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrease Quantity Button (Disabled if quantity is 1)
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: product.quantity > 1
                      ? () => onQuantityChanged(-1)
                      : null, // Disables button if quantity is 1
                ),

                // Quantity Display
                Text(
                  '${product.quantity}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),

                // Increase Quantity Button
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                  onPressed: () => onQuantityChanged(1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
