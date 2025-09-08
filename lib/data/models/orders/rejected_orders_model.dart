import 'dart:convert';

RejectedOrderModel rejectedOrderModelFromJson(String str) =>
    RejectedOrderModel.fromJson(json.decode(str));

String rejectedOrderModelToJson(RejectedOrderModel data) =>
    json.encode(data.toJson());

class RejectedOrderModel {
  int statusCode;
  bool success;
  String message;
  RejectedOrder data;
  dynamic meta;

  RejectedOrderModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory RejectedOrderModel.fromJson(Map<String, dynamic> json) =>
      RejectedOrderModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data:
            json["data"] != null
                ? RejectedOrder.fromJson(json["data"])
                : RejectedOrder(
                  orders: [],
                  pagination: RejectedOrderPagination.empty(),
                ),
        meta: json["meta"] ?? {},
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
    "meta": meta,
  };
}

class RejectedOrder {
  List<RejectedOrderDetails> orders;
  RejectedOrderPagination pagination;

  RejectedOrder({required this.orders, required this.pagination});

  factory RejectedOrder.fromJson(Map<String, dynamic> json) => RejectedOrder(
    orders:
        json["orders"] != null
            ? List<RejectedOrderDetails>.from(
              json["orders"].map((x) => RejectedOrderDetails.fromJson(x)),
            )
            : [],
    pagination:
        json["pagination"] != null
            ? RejectedOrderPagination.fromJson(json["pagination"])
            : RejectedOrderPagination.empty(),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class RejectedOrderDetails {
  String id;
  String status;
  int amount;
  String location;
  String clientName;
  DateTime createdAt;
  String store;
  String customer;
  String deliveryStatus;
  String deliveryRejectionReason;
  String deliveryRejectionNotes;
  DateTime loggedAt;

  RejectedOrderDetails({
    required this.id,
    required this.status,
    required this.amount,
    required this.location,
    required this.clientName,
    required this.createdAt,
    required this.store,
    required this.customer,
    required this.deliveryStatus,
    required this.deliveryRejectionReason,
    required this.deliveryRejectionNotes,
    required this.loggedAt,
  });

  factory RejectedOrderDetails.fromJson(Map<String, dynamic> json) =>
      RejectedOrderDetails(
        id: json["_id"] ?? "",
        status: json["status"] ?? "",
        amount: json["amount"] ?? 0,
        location: json["location"] ?? "",
        clientName: json["clientName"] ?? "",
        createdAt: DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime(1970),
        store: json["store"] ?? "",
        customer: json["customer"] ?? "",
        deliveryStatus: json["deliveryStatus"] ?? "",
        deliveryRejectionReason: json["deliveryRejectionReason"] ?? "",
        deliveryRejectionNotes: json["deliveryRejectionNotes"] ?? "",
        loggedAt: DateTime.tryParse(json["loggedAt"] ?? "") ?? DateTime(1970),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "status": status,
    "amount": amount,
    "location": location,
    "clientName": clientName,
    "createdAt": createdAt.toIso8601String(),
    "store": store,
    "customer": customer,
    "deliveryStatus": deliveryStatus,
    "deliveryRejectionReason": deliveryRejectionReason,
    "deliveryRejectionNotes": deliveryRejectionNotes,
    "loggedAt": loggedAt.toIso8601String(),
  };
}

class RejectedOrderPagination {
  int currentPage;
  int totalPages;
  int totalOrders;
  bool hasNext;
  bool hasPrev;

  RejectedOrderPagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalOrders,
    required this.hasNext,
    required this.hasPrev,
  });

  factory RejectedOrderPagination.fromJson(Map<String, dynamic> json) =>
      RejectedOrderPagination(
        currentPage: json["currentPage"] ?? 0,
        totalPages: json["totalPages"] ?? 0,
        totalOrders: json["totalOrders"] ?? 0,
        hasNext: json["hasNext"] ?? false,
        hasPrev: json["hasPrev"] ?? false,
      );

  factory RejectedOrderPagination.empty() => RejectedOrderPagination(
    currentPage: 0,
    totalPages: 0,
    totalOrders: 0,
    hasNext: false,
    hasPrev: false,
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "totalPages": totalPages,
    "totalOrders": totalOrders,
    "hasNext": hasNext,
    "hasPrev": hasPrev,
  };
}
