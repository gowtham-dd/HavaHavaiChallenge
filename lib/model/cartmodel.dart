class CartModel {
  final String image; // URL or asset path of the product image
  final String name; // Name of the product
  final String brand; // Brand of the product
  final double originalPrice; // Original price before discount
  final double offerPrice; // Price after applying the discount
  final double discount; // Discount percentage applied
  int quantity; // Quantity of the product in the cart

  CartModel({
    required this.image,
    required this.name,
    required this.brand,
    required this.originalPrice,
    required this.offerPrice,
    required this.discount,
    required this.quantity,
  });

  // Calculates the total price for the selected quantity
  double get totalPrice => offerPrice * quantity;
}
