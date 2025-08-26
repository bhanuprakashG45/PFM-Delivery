import 'dart:convert';

OrderAcceptModel orderAcceptModelFromJson(String str) =>
    OrderAcceptModel.fromJson(json.decode(str));

String orderAcceptModelToJson(OrderAcceptModel data) =>
    json.encode(data.toJson());

class OrderAcceptModel {
  int statusCode;
  bool success;
  String message;
  Data data;
  dynamic meta;

  OrderAcceptModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory OrderAcceptModel.fromJson(Map<String, dynamic> json) =>
      OrderAcceptModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: Data.fromJson(json["data"] ?? {}),
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

class Data {
  bool accepted;
  CustomerOrder order;
  String message;

  Data({required this.accepted, required this.order, required this.message});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accepted: json["accepted"] ?? false,
    order: CustomerOrder.fromJson(json["order"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "accepted": accepted,
    "order": order.toJson(),
    "message": message,
  };
}

class CustomerOrder {
  GeoLocation geoLocation;
  String id;
  String customer;
  String clientName;
  String location;
  String pincode;
  List<OrderDetail> orderDetails;
  String phone;
  int amount;
  String status;
  String store;
  String manager;
  String notes;
  bool isUrgent;
  String deliveryStatus;
  dynamic deliveryRejectionReason;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String pickedUpBy;
  String deliveryPartner;
  DateTime pickedUpAt;

  CustomerOrder({
    required this.geoLocation,
    required this.id,
    required this.customer,
    required this.clientName,
    required this.location,
    required this.pincode,
    required this.orderDetails,
    required this.phone,
    required this.amount,
    required this.status,
    required this.store,
    required this.manager,
    required this.notes,
    required this.isUrgent,
    required this.deliveryStatus,
    required this.deliveryRejectionReason,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.pickedUpBy,
    required this.deliveryPartner,
    required this.pickedUpAt,
  });

  factory CustomerOrder.fromJson(Map<String, dynamic> json) => CustomerOrder(
    geoLocation: GeoLocation.fromJson(json["geoLocation"] ?? {}),
    id: json["_id"] ?? "",
    customer: json["customer"] ?? "",
    clientName: json["clientName"] ?? "",
    location: json["location"] ?? "",
    pincode: json["pincode"] ?? "",
    orderDetails:
        (json["orderDetails"] as List? ?? [])
            .map((x) => OrderDetail.fromJson(x ?? {}))
            .toList(),
    phone: json["phone"] ?? "",
    amount: json["amount"] ?? 0,
    status: json["status"] ?? "",
    store: json["store"] ?? "",
    manager: json["manager"] ?? "",
    notes: json["notes"] ?? "",
    isUrgent: json["isUrgent"] ?? false,
    deliveryStatus: json["deliveryStatus"] ?? "",
    deliveryRejectionReason: json["deliveryRejectionReason"],
    createdAt: DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime.now(),
    updatedAt: DateTime.tryParse(json["updatedAt"] ?? "") ?? DateTime.now(),
    v: json["__v"] ?? 0,
    pickedUpBy: json["pickedUpBy"] ?? "",
    deliveryPartner: json["deliveryPartner"] ?? "",
    pickedUpAt: DateTime.tryParse(json["pickedUpAt"] ?? "") ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "geoLocation": geoLocation.toJson(),
    "_id": id,
    "customer": customer,
    "clientName": clientName,
    "location": location,
    "pincode": pincode,
    "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    "phone": phone,
    "amount": amount,
    "status": status,
    "store": store,
    "manager": manager,
    "notes": notes,
    "isUrgent": isUrgent,
    "deliveryStatus": deliveryStatus,
    "deliveryRejectionReason": deliveryRejectionReason,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "pickedUpBy": pickedUpBy,
    "deliveryPartner": deliveryPartner,
    "pickedUpAt": pickedUpAt.toIso8601String(),
  };
}

class GeoLocation {
  String type;
  List<double> coordinates;

  GeoLocation({required this.type, required this.coordinates});

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
    type: json["type"] ?? "",
    coordinates: List<double>.from(
      (json["coordinates"] ?? []).map((x) => x?.toDouble() ?? 0.0),
    ),
  );

  Map<String, dynamic> toJson() => {"type": type, "coordinates": coordinates};
}

class OrderDetail {
  String name;
  int quantity;
  int price;
  String id;

  OrderDetail({
    required this.name,
    required this.quantity,
    required this.price,
    required this.id,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    name: json["name"] ?? "",
    quantity: json["quantity"] ?? 0,
    price: json["price"] ?? 0,
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "price": price,
    "_id": id,
  };
}
