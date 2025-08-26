class OrderItem {
  final String id;
  final String name;
  final int quantity;
  final int price;

  OrderItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'quantity': quantity,
        'price': price,
      };
}
