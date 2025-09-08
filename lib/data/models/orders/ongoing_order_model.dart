import 'dart:convert';

OnGoingOrderModel onGoingOrderModelFromJson(String str) =>
    OnGoingOrderModel.fromJson(json.decode(str));

String onGoingOrderModelToJson(OnGoingOrderModel data) =>
    json.encode(data.toJson());

class OnGoingOrderModel {
  int statusCode;
  bool success;
  String message;
  List<OnGoingOrderData> data;
  dynamic meta;

  OnGoingOrderModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    this.meta,
  });

  factory OnGoingOrderModel.fromJson(Map<String, dynamic> json) =>
      OnGoingOrderModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data:
            json["data"] != null
                ? List<OnGoingOrderData>.from(
                  json["data"].map((x) => OnGoingOrderData.fromJson(x ?? {})),
                )
                : [],
        meta: json["meta"],
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta,
  };
}

class OnGoingOrderData {
  String id;
  String clientName;
  String location;
  List<OnGoingOrderDetail> orderDetails;
  int amount;
  DateTime createdAt;
  DateTime? estimatedDeliveryTime;

  OnGoingOrderData({
    required this.id,
    required this.clientName,
    required this.location,
    required this.orderDetails,
    required this.amount,
    required this.createdAt,
    this.estimatedDeliveryTime,
  });

  factory OnGoingOrderData.fromJson(Map<String, dynamic> json) => OnGoingOrderData(
    id: json["_id"] ?? '',
    clientName: json["clientName"] ?? '',
    location: json["location"] ?? '',
    orderDetails:
        json["orderDetails"] != null
            ? List<OnGoingOrderDetail>.from(
              json["orderDetails"].map((x) => OnGoingOrderDetail.fromJson(x ?? {})),
            )
            : [],
    amount: json["amount"] ?? 0,
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
    estimatedDeliveryTime:
        json["estimatedDeliveryTime"] != null
            ? DateTime.parse(json["estimatedDeliveryTime"])
            : null,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientName": clientName,
    "location": location,
    "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    "amount": amount,
    "createdAt": createdAt.toIso8601String(),
    "estimatedDeliveryTime": estimatedDeliveryTime?.toIso8601String(),
  };
}

class OnGoingOrderDetail {
  String name;
  int quantity;
  int price;
  String img;
  String orderId;
  String id;

  OnGoingOrderDetail({
    required this.name,
    required this.quantity,
    required this.price,
    required this.img,
    required this.orderId,
    required this.id,
  });

  factory OnGoingOrderDetail.fromJson(Map<String, dynamic> json) => OnGoingOrderDetail(
    name: json["name"] ?? '',
    quantity: json["quantity"] ?? 0,
    price: json["price"] ?? 0,
    img: json["img"] ?? '',
    orderId: json["orderId"] ?? '',
    id: json["_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "price": price,
    "img": img,
    "orderId": orderId,
    "_id": id,
  };
}
