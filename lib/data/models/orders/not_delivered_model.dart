import 'dart:convert';

NotDeliveredModel notDeliveredModelFromJson(String str) =>
    NotDeliveredModel.fromJson(json.decode(str));

String notDeliveredModelToJson(NotDeliveredModel data) =>
    json.encode(data.toJson());

class NotDeliveredModel {
  final int statusCode;
  final bool success;
  final String message;
  final Data? data;
  final dynamic meta;

  NotDeliveredModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory NotDeliveredModel.fromJson(Map<String, dynamic> json) =>
      NotDeliveredModel(
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
  final DateTime rejectedAt;
  final String reason;

  Data({required this.orderId, required this.rejectedAt, required this.reason});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["orderId"] ?? '',
    rejectedAt:
        json["rejectedAt"] != null
            ? DateTime.tryParse(json["rejectedAt"]) ?? DateTime.now()
            : DateTime.now(),
    reason: json["reason"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "rejectedAt": rejectedAt.toIso8601String(),
    "reason": reason,
  };
}
