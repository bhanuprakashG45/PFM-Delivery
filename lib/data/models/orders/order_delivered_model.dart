import 'dart:convert';

OrderDeliveredModel orderDeliveredModelFromJson(String str) =>
    OrderDeliveredModel.fromJson(json.decode(str));

String orderDeliveredModelToJson(OrderDeliveredModel data) =>
    json.encode(data.toJson());

class OrderDeliveredModel {
  final int statusCode;
  final bool success;
  final String message;
  final Data? data;
  final dynamic meta;

  OrderDeliveredModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory OrderDeliveredModel.fromJson(Map<String, dynamic> json) =>
      OrderDeliveredModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
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

class Data {
  final String orderId;
  final DateTime deliveredAt;

  Data({required this.orderId, required this.deliveredAt});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["orderId"] ?? '',
    deliveredAt:
        json["deliveredAt"] != null
            ? DateTime.tryParse(json["deliveredAt"]) ?? DateTime.now()
            : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "deliveredAt": deliveredAt.toIso8601String(),
  };
}
