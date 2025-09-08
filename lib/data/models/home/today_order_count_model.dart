import 'dart:convert';

TodayOrderCountModel todayOrderCountModelFromJson(String str) =>
    TodayOrderCountModel.fromJson(json.decode(str));

String todayOrderCountModelToJson(TodayOrderCountModel data) =>
    json.encode(data.toJson());

class TodayOrderCountModel {
  int statusCode;
  bool success;
  String message;
  OrdersCount? data;
  dynamic meta;

  TodayOrderCountModel({
    required this.statusCode,
    required this.success,
    required this.message,
    this.data,
    this.meta,
  });

  factory TodayOrderCountModel.fromJson(Map<String, dynamic> json) =>
      TodayOrderCountModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: json["data"] != null ? OrdersCount.fromJson(json["data"]) : null,
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

class OrdersCount {
  int totalOrders;
  int accepted;
  int rejected;
  int ongoing;
  int completed;
  DateTime? lastUpdated;

  OrdersCount({
    required this.totalOrders,
    required this.accepted,
    required this.rejected,
    required this.ongoing,
    required this.completed,
    this.lastUpdated,
  });

  factory OrdersCount.fromJson(Map<String, dynamic> json) => OrdersCount(
    totalOrders: json["totalOrders"] ?? 0,
    accepted: json["accepted"] ?? 0,
    rejected: json["rejectedByPartner"] ?? 0,
    ongoing: json["ongoing"] ?? 0,
    completed: json["completed"] ?? 0,
    lastUpdated:
        json["lastUpdated"] != null
            ? DateTime.tryParse(json["lastUpdated"])
            : null,
  );

  Map<String, dynamic> toJson() => {
    "totalOrders": totalOrders,
    "accepted": accepted,
    "rejectedByPartner": rejected,
    "ongoing": ongoing,
    "completed": completed,
    "lastUpdated": lastUpdated?.toIso8601String(),
  };
}
