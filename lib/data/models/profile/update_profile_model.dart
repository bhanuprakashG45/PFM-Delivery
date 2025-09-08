// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) =>
    UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) =>
    json.encode(data.toJson());

class UpdateProfileModel {
  int statusCode;
  bool success;
  String message;
  Data data;
  dynamic meta;

  UpdateProfileModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: json["data"] != null ? Data.fromJson(json["data"]) : Data.empty(),
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

class Data {
  DocumentStatus documentStatus;
  String id;
  String name;
  String phone;
  String status;
  String store;
  String overallDocumentStatus;
  bool isActive;
  List<String> assignedOrders;
  int totalDeliveries;
  int totalAccepted;
  int totalRejected;
  int rating;
  DateTime lastActive;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.documentStatus,
    required this.id,
    required this.name,
    required this.phone,
    required this.status,
    required this.store,
    required this.overallDocumentStatus,
    required this.isActive,
    required this.assignedOrders,
    required this.totalDeliveries,
    required this.totalAccepted,
    required this.totalRejected,
    required this.rating,
    required this.lastActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    documentStatus:
        json["documentStatus"] != null
            ? DocumentStatus.fromJson(json["documentStatus"])
            : DocumentStatus.empty(),
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    phone: json["phone"] ?? "",
    status: json["status"] ?? "",
    store: json["store"] ?? "",
    overallDocumentStatus: json["overallDocumentStatus"] ?? "",
    isActive: json["isActive"] ?? false,
    assignedOrders:
        json["assignedOrders"] != null
            ? List<String>.from(json["assignedOrders"].map((x) => x))
            : [],
    totalDeliveries: json["totalDeliveries"] ?? 0,
    totalAccepted: json["totalAccepted"] ?? 0,
    totalRejected: json["totalRejected"] ?? 0,
    rating: json["rating"] ?? 0,
    lastActive:
        json["lastActive"] != null
            ? DateTime.parse(json["lastActive"])
            : DateTime.now(),
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "documentStatus": documentStatus.toJson(),
    "_id": id,
    "name": name,
    "phone": phone,
    "status": status,
    "store": store,
    "overallDocumentStatus": overallDocumentStatus,
    "isActive": isActive,
    "assignedOrders": List<dynamic>.from(assignedOrders.map((x) => x)),
    "totalDeliveries": totalDeliveries,
    "totalAccepted": totalAccepted,
    "totalRejected": totalRejected,
    "rating": rating,
    "lastActive": lastActive.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  // Empty default object
  factory Data.empty() => Data(
    documentStatus: DocumentStatus.empty(),
    id: "",
    name: "",
    phone: "",
    status: "",
    store: "",
    overallDocumentStatus: "",
    isActive: false,
    assignedOrders: [],
    totalDeliveries: 0,
    totalAccepted: 0,
    totalRejected: 0,
    rating: 0,
    lastActive: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

class DocumentStatus {
  String idProof;
  String addressProof;
  String vehicleDocuments;
  String drivingLicense;
  String insuranceDocuments;

  DocumentStatus({
    required this.idProof,
    required this.addressProof,
    required this.vehicleDocuments,
    required this.drivingLicense,
    required this.insuranceDocuments,
  });

  factory DocumentStatus.fromJson(Map<String, dynamic> json) => DocumentStatus(
    idProof: json["idProof"] ?? "",
    addressProof: json["addressProof"] ?? "",
    vehicleDocuments: json["vehicleDocuments"] ?? "",
    drivingLicense: json["drivingLicense"] ?? "",
    insuranceDocuments: json["insuranceDocuments"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "idProof": idProof,
    "addressProof": addressProof,
    "vehicleDocuments": vehicleDocuments,
    "drivingLicense": drivingLicense,
    "insuranceDocuments": insuranceDocuments,
  };

  // Empty default object
  factory DocumentStatus.empty() => DocumentStatus(
    idProof: "",
    addressProof: "",
    vehicleDocuments: "",
    drivingLicense: "",
    insuranceDocuments: "",
  );
}
