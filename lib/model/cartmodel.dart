class CartModel {
  final String image;
  final String name;
  final String brand;
  final double originalPrice;
  final double offerPrice;
  final double discount;
  int quantity;

  CartModel({
    required this.image,
    required this.name,
    required this.brand,
    required this.originalPrice,
    required this.offerPrice,
    required this.discount,
    required this.quantity,
  });

  double get totalPrice => offerPrice * quantity;
}
