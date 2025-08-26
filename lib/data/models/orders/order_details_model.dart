import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  int statusCode;
  bool success;
  String message;
  OrderData? data;
  dynamic meta;

  OrderDetailsModel({
    required this.statusCode,
    required this.success,
    required this.message,
    this.data,
    this.meta,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data: json["data"] != null ? OrderData.fromJson(json["data"]) : null,
        meta: json["meta"],
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "meta": meta,
  };
}

class OrderData {
  String id;
  String orderId;
  String clientName;
  String phone;
  int amount;
  String location;
  String pincode;
  List<Item> items;
  String status;
  Store? store;
  String notes;
  bool isUrgent;

  OrderData({
    required this.id,
    required this.orderId,
    required this.clientName,
    required this.phone,
    required this.amount,
    required this.location,
    required this.pincode,
    required this.items,
    required this.status,
    required this.store,
    required this.notes,
    required this.isUrgent,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    id: json["id"] ?? '',
    orderId: json["orderId"] ?? '',
    clientName: json["clientName"] ?? '',
    phone: json["phone"] ?? '',
    amount: json["amount"] ?? 0,
    location: json["location"] ?? '',
    pincode: json["pincode"] ?? '',
    items:
        (json["items"] as List<dynamic>?)
            ?.map((x) => Item.fromJson(x))
            .toList() ??
        [],
    status: json["status"] ?? '',
    store: json["store"] != null ? Store.fromJson(json["store"]) : null,
    notes: json["notes"] ?? '',
    isUrgent: json["isUrgent"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "clientName": clientName,
    "phone": phone,
    "amount": amount,
    "location": location,
    "pincode": pincode,
    "items": items.map((x) => x.toJson()).toList(),
    "status": status,
    "store": store?.toJson(),
    "notes": notes,
    "isUrgent": isUrgent,
  };
}

class Item {
  String name;
  int quantity;
  int price;
  String id;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"] ?? '',
    quantity: json["quantity"] ?? 0,
    price: json["price"] ?? 0,
    id: json["_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "price": price,
    "_id": id,
  };
}

class Store {
  String id;
  String name;
  String location;
  String phone;
  double lat;
  double long;

  Store({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.lat,
    required this.long,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["_id"] ?? '',
    name: json["name"] ?? '',
    location: json["location"] ?? '',
    phone: json["phone"] ?? '',
    lat: (json["lat"] != null) ? json["lat"].toDouble() : 0.0,
    long: (json["long"] != null) ? json["long"].toDouble() : 0.0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "location": location,
    "phone": phone,
    "lat": lat,
    "long": long,
  };
}
