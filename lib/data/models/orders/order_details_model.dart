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
        message: json["message"] ?? "",
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
  String phone;
  double amount;
  String location;
  String pincode;
  List<Item> items;
  String status;
  Store? store;
  String notes;
  bool isUrgent;
  String recieverName;
  String houseNo;
  String deleveyFor;

  OrderData({
    required this.id,
    required this.orderId,
    required this.phone,
    required this.amount,
    required this.location,
    required this.pincode,
    required this.items,
    required this.status,
    this.store,
    required this.notes,
    required this.isUrgent,
    required this.recieverName,
    required this.houseNo,
    required this.deleveyFor,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    id: json["id"] ?? "",
    orderId: json["orderId"] ?? "",
    phone: json["phone"] ?? "",
    amount: (json["amount"] ?? 0).toDouble(),
    location: json["location"] ?? "",
    pincode: json["pincode"] ?? "",
    items:
        json["items"] != null
            ? List<Item>.from(json["items"].map((x) => Item.fromJson(x)))
            : [],
    status: json["status"] ?? "",
    store: json["store"] != null ? Store.fromJson(json["store"]) : null,
    notes: json["notes"] ?? "",
    isUrgent: json["isUrgent"] ?? false,
    recieverName: json["recieverName"] ?? "",
    houseNo: json["houseNo"] ?? "",
    deleveyFor: json["deleveyFor"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "phone": phone,
    "amount": amount,
    "location": location,
    "pincode": pincode,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "status": status,
    "store": store?.toJson(),
    "notes": notes,
    "isUrgent": isUrgent,
    "recieverName": recieverName,
    "houseNo": houseNo,
    "deleveyFor": deleveyFor,
  };
}

class Item {
  String name;
  int quantity;
  double price;
  String unit;
  String weight;
  String img;
  String orderId;
  String id;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.unit,
    required this.weight,
    required this.img,
    required this.orderId,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"] ?? "",
    quantity: json["quantity"] ?? 0,
    price: (json["price"] ?? 0).toDouble(),
    unit: json["unit"] ?? "",
    weight: json["weight"] ?? "",
    img: json["img"] ?? "",
    orderId: json["orderId"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "price": price,
    "unit": unit,
    "weight": weight,
    "img": img,
    "orderId": orderId,
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
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    location: json["location"] ?? "",
    phone: json["phone"] ?? "",
    lat: (json["lat"] ?? 0).toDouble(),
    long: (json["long"] ?? 0).toDouble(),
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
