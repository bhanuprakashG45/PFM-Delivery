import 'dart:convert';

CompletedOrderModel completedOrderModelFromJson(String str) =>
    CompletedOrderModel.fromJson(json.decode(str));

String completedOrderModelToJson(CompletedOrderModel data) =>
    json.encode(data.toJson());

class CompletedOrderModel {
  int statusCode;
  bool success;
  String message;
  List<CompletedOrder> data;
  dynamic meta;

  CompletedOrderModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    this.meta,
  });

  factory CompletedOrderModel.fromJson(Map<String, dynamic> json) =>
      CompletedOrderModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data:
            json["data"] != null
                ? List<CompletedOrder>.from(
                  json["data"].map((x) => CompletedOrder.fromJson(x ?? {})),
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

class CompletedOrder {
  String id;
  String clientName;
  String location;
  List<CompletedOrderDetail> orderDetails;
  int amount;
  DateTime actualDeliveryTime;

  CompletedOrder({
    required this.id,
    required this.clientName,
    required this.location,
    required this.orderDetails,
    required this.amount,
    required this.actualDeliveryTime,
  });

  factory CompletedOrder.fromJson(Map<String, dynamic> json) => CompletedOrder(
    id: json["_id"] ?? '',
    clientName: json["clientName"] ?? '',
    location: json["location"] ?? '',
    orderDetails:
        json["orderDetails"] != null
            ? List<CompletedOrderDetail>.from(
              json["orderDetails"].map(
                (x) => CompletedOrderDetail.fromJson(x ?? {}),
              ),
            )
            : [],
    amount: json["amount"] ?? 0,
    actualDeliveryTime:
        json["actualDeliveryTime"] != null
            ? DateTime.parse(json["actualDeliveryTime"])
            : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientName": clientName,
    "location": location,
    "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    "amount": amount,
    "actualDeliveryTime": actualDeliveryTime.toIso8601String(),
  };
}

class CompletedOrderDetail {
  String name;
  int quantity;
  int price;
  String img;
  String orderId;
  String id;

  CompletedOrderDetail({
    required this.name,
    required this.quantity,
    required this.price,
    required this.img,
    required this.orderId,
    required this.id,
  });

  factory CompletedOrderDetail.fromJson(Map<String, dynamic> json) =>
      CompletedOrderDetail(
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
