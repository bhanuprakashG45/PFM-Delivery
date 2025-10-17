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
        data:
            json["data"] != null
                ? Data.fromJson(json["data"])
                : Data(
                  accepted: false,
                  order: CustomerOrder.empty(),
                  message: "",
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

class Data {
  bool accepted;
  CustomerOrder order;
  String message;

  Data({required this.accepted, required this.order, required this.message});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accepted: json["accepted"] ?? false,
    order:
        json["order"] != null
            ? CustomerOrder.fromJson(json["order"])
            : CustomerOrder.empty(),
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
  String deleveyFor;
  String houseNo;
  String recieverName;
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
  String reason;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String deliveryPartner;
  DateTime pickedUpAt;
  String pickedUpBy;

  CustomerOrder({
    required this.geoLocation,
    required this.id,
    required this.customer,
    required this.deleveyFor,
    required this.houseNo,
    required this.recieverName,
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
    required this.reason,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.deliveryPartner,
    required this.pickedUpAt,
    required this.pickedUpBy,
  });

  factory CustomerOrder.fromJson(Map<String, dynamic> json) => CustomerOrder(
    geoLocation:
        json["geoLocation"] != null
            ? GeoLocation.fromJson(json["geoLocation"])
            : GeoLocation(type: "", coordinates: []),
    id: json["_id"] ?? "",
    customer: json["customer"] ?? "",
    deleveyFor: json["deleveyFor"] ?? "",
    houseNo: json["houseNo"] ?? "",
    recieverName: json["recieverName"] ?? "",
    location: json["location"] ?? "",
    pincode: json["pincode"] ?? "",
    orderDetails:
        json["orderDetails"] == null
            ? []
            : List<OrderDetail>.from(
              json["orderDetails"].map((x) => OrderDetail.fromJson(x)),
            ),
    phone: json["phone"] ?? "",
    amount: json["amount"] ?? 0,
    status: json["status"] ?? "",
    store: json["store"] ?? "",
    manager: json["manager"] ?? "",
    notes: json["notes"] ?? "",
    isUrgent: json["isUrgent"] ?? false,
    deliveryStatus: json["deliveryStatus"] ?? "",
    deliveryRejectionReason: json["deliveryRejectionReason"],
    reason: json["reason"] ?? "",
    createdAt:
        json["createdAt"] != null
            ? DateTime.tryParse(json["createdAt"]) ?? DateTime.now()
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.tryParse(json["updatedAt"]) ?? DateTime.now()
            : DateTime.now(),
    v: json["__v"] ?? 0,
    deliveryPartner: json["deliveryPartner"] ?? "",
    pickedUpAt:
        json["pickedUpAt"] != null
            ? DateTime.tryParse(json["pickedUpAt"]) ?? DateTime.now()
            : DateTime.now(),
    pickedUpBy: json["pickedUpBy"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "geoLocation": geoLocation.toJson(),
    "_id": id,
    "customer": customer,
    "deleveyFor": deleveyFor,
    "houseNo": houseNo,
    "recieverName": recieverName,
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
    "reason": reason,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "deliveryPartner": deliveryPartner,
    "pickedUpAt": pickedUpAt.toIso8601String(),
    "pickedUpBy": pickedUpBy,
  };

  /// Helper empty object to avoid null crashes
  factory CustomerOrder.empty() => CustomerOrder(
    geoLocation: GeoLocation(type: "", coordinates: []),
    id: "",
    customer: "",
    deleveyFor: "",
    houseNo: "",
    recieverName: "",
    location: "",
    pincode: "",
    orderDetails: [],
    phone: "",
    amount: 0,
    status: "",
    store: "",
    manager: "",
    notes: "",
    isUrgent: false,
    deliveryStatus: "",
    deliveryRejectionReason: null,
    reason: "",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    v: 0,
    deliveryPartner: "",
    pickedUpAt: DateTime.now(),
    pickedUpBy: "",
  );
}

class GeoLocation {
  String type;
  List<double> coordinates;

  GeoLocation({required this.type, required this.coordinates});

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
    type: json["type"] ?? "",
    coordinates:
        json["coordinates"] == null
            ? []
            : List<double>.from(
              json["coordinates"].map((x) => (x ?? 0).toDouble()),
            ),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class OrderDetail {
  String name;
  int quantity;
  int price;
  String unit;
  String weight;
  String img;
  String orderId;
  String id;

  OrderDetail({
    required this.name,
    required this.quantity,
    required this.price,
    required this.unit,
    required this.weight,
    required this.img,
    required this.orderId,
    required this.id,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    name: json["name"] ?? "",
    quantity: json["quantity"] ?? 0,
    price: json["price"] ?? 0,
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
