import 'package:cartproduct/model/cartmodel.dart';
import 'package:flutter/material.dart';

class AddToCartTile extends StatelessWidget {
  final CartModel product;
  final Function(int) onQuantityChanged;

  const AddToCartTile({
    Key? key,
    required this.product,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Image inside a Container
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),

            // Product Details inside a Column
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4),
                    Text(
                      product.brand,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          '₹${product.originalPrice}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '₹${product.offerPrice}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '${product.discount}% OFF',
                          style: TextStyle(
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
            ),

            // Quantity Controls in a Column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () => onQuantityChanged(-1),
                ),
                Text(
                  '${product.quantity}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.green),
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
