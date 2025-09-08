import 'dart:convert';

AcceptedOrderModel acceptedOrderModelFromJson(String str) =>
    AcceptedOrderModel.fromJson(json.decode(str));

String acceptedOrderModelToJson(AcceptedOrderModel data) =>
    json.encode(data.toJson());

class AcceptedOrderModel {
  int statusCode;
  bool success;
  String message;
  AcceptedOrder data;
  dynamic meta;

  AcceptedOrderModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    this.meta,
  });

  factory AcceptedOrderModel.fromJson(Map<String, dynamic> json) =>
      AcceptedOrderModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data:
            json["data"] != null
                ? AcceptedOrder.fromJson(json["data"])
                : AcceptedOrder(
                  orders: [],
                  pagination: AcceptedOrderPagination(),
                ),
        meta: json["meta"],
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
    "meta": meta,
  };
}

class AcceptedOrder {
  List<AcceptedOrderData> orders;
  AcceptedOrderPagination pagination;

  AcceptedOrder({required this.orders, required this.pagination});

  factory AcceptedOrder.fromJson(Map<String, dynamic> json) => AcceptedOrder(
    orders:
        json["orders"] != null
            ? List<AcceptedOrderData>.from(
              json["orders"].map((x) => AcceptedOrderData.fromJson(x)),
            )
            : [],
    pagination:
        json["pagination"] != null
            ? AcceptedOrderPagination.fromJson(json["pagination"])
            : AcceptedOrderPagination(),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class AcceptedOrderData {
  String id;
  Customer customer;
  String clientName;
  String location;
  int amount;
  String status;
  Customer store;
  String deliveryStatus;
  DateTime createdAt;
  DateTime? estimatedDeliveryTime;
  DateTime? actualDeliveryTime;

  AcceptedOrderData({
    required this.id,
    required this.customer,
    required this.clientName,
    required this.location,
    required this.amount,
    required this.status,
    required this.store,
    required this.deliveryStatus,
    required this.createdAt,
    this.estimatedDeliveryTime,
    this.actualDeliveryTime,
  });

  factory AcceptedOrderData.fromJson(Map<String, dynamic> json) =>
      AcceptedOrderData(
        id: json["_id"] ?? '',
        customer:
            json["customer"] != null
                ? Customer.fromJson(json["customer"])
                : Customer(id: '', name: '', phone: ''),
        clientName: json["clientName"] ?? '',
        location: json["location"] ?? '',
        amount: json["amount"] ?? 0,
        status: json["status"] ?? '',
        store:
            json["store"] != null
                ? Customer.fromJson(json["store"])
                : Customer(id: '', name: '', phone: ''),
        deliveryStatus: json["deliveryStatus"] ?? '',
        createdAt:
            json["createdAt"] != null
                ? DateTime.parse(json["createdAt"])
                : DateTime.now(),
        estimatedDeliveryTime:
            json["estimatedDeliveryTime"] != null
                ? DateTime.parse(json["estimatedDeliveryTime"])
                : null,
        actualDeliveryTime:
            json["actualDeliveryTime"] != null
                ? DateTime.parse(json["actualDeliveryTime"])
                : null,
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "customer": customer.toJson(),
    "clientName": clientName,
    "location": location,
    "amount": amount,
    "status": status,
    "store": store.toJson(),
    "deliveryStatus": deliveryStatus,
    "createdAt": createdAt.toIso8601String(),
    "estimatedDeliveryTime": estimatedDeliveryTime?.toIso8601String(),
    "actualDeliveryTime": actualDeliveryTime?.toIso8601String(),
  };
}

class Customer {
  String id;
  String name;
  String phone;
  String? location;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
    this.location,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["_id"] ?? '',
    name: json["name"] ?? '',
    phone: json["phone"] ?? '',
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "phone": phone,
    "location": location,
  };
}

class AcceptedOrderPagination {
  int currentPage;
  int totalPages;
  int totalOrders;
  bool hasNext;
  bool hasPrev;

  AcceptedOrderPagination({
    this.currentPage = 1,
    this.totalPages = 1,
    this.totalOrders = 0,
    this.hasNext = false,
    this.hasPrev = false,
  });

  factory AcceptedOrderPagination.fromJson(Map<String, dynamic> json) =>
      AcceptedOrderPagination(
        currentPage: json["currentPage"] ?? 1,
        totalPages: json["totalPages"] ?? 1,
        totalOrders: json["totalOrders"] ?? 0,
        hasNext: json["hasNext"] ?? false,
        hasPrev: json["hasPrev"] ?? false,
      );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "totalPages": totalPages,
    "totalOrders": totalOrders,
    "hasNext": hasNext,
    "hasPrev": hasPrev,
  };
}
