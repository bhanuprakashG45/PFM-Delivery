import 'dart:convert';

InitiateDeliveryModel initiateDeliveryModelFromJson(String str) =>
    InitiateDeliveryModel.fromJson(json.decode(str));

String initiateDeliveryModelToJson(InitiateDeliveryModel data) =>
    json.encode(data.toJson());

class InitiateDeliveryModel {
  final int statusCode;
  final bool success;
  final String message;
  final Data? data;
  final dynamic meta;

  InitiateDeliveryModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory InitiateDeliveryModel.fromJson(Map<String, dynamic> json) =>
      InitiateDeliveryModel(
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
  final DateTime estimatedDeliveryTime;

  Data({
    required this.orderId,
    required this.estimatedDeliveryTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["orderId"] ?? '',
        estimatedDeliveryTime: json["estimatedDeliveryTime"] != null
            ? DateTime.parse(json["estimatedDeliveryTime"])
            : DateTime.now(), // fallback if null or invalid
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "estimatedDeliveryTime": estimatedDeliveryTime.toIso8601String(),
      };
}
