import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) =>
    ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) =>
    json.encode(data.toJson());

class ProfileDetailsModel {
  int statusCode;
  bool success;
  String message;
  ProfileData data;
  dynamic meta;

  ProfileDetailsModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: ProfileData.fromJson(json["data"] ?? {}),
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

class ProfileData {
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
  OrderStats orderStats;

  ProfileData({
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
    required this.orderStats,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    documentStatus: DocumentStatus.fromJson(json["documentStatus"] ?? {}),
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    phone: json["phone"] ?? "",
    status: json["status"] ?? "",
    store: json["store"] ?? "",
    overallDocumentStatus: json["overallDocumentStatus"] ?? "",
    isActive: json["isActive"] ?? false,
    assignedOrders:
        json["assignedOrders"] != null
            ? List<String>.from(json["assignedOrders"].map((x) => x ?? ""))
            : [],
    totalDeliveries: json["totalDeliveries"] ?? 0,
    totalAccepted: json["totalAccepted"] ?? 0,
    totalRejected: json["totalRejected"] ?? 0,
    rating: json["rating"] ?? 0,
    lastActive:
        DateTime.tryParse(json["lastActive"] ?? "") ??
        DateTime.fromMillisecondsSinceEpoch(0),
    createdAt:
        DateTime.tryParse(json["createdAt"] ?? "") ??
        DateTime.fromMillisecondsSinceEpoch(0),
    updatedAt:
        DateTime.tryParse(json["updatedAt"] ?? "") ??
        DateTime.fromMillisecondsSinceEpoch(0),
    orderStats: OrderStats.fromJson(json["orderStats"] ?? {}),
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
    "orderStats": orderStats.toJson(),
  };
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
}

class OrderStats {
  int total;
  int completed;
  int ongoing;

  OrderStats({
    required this.total,
    required this.completed,
    required this.ongoing,
  });

  factory OrderStats.fromJson(Map<String, dynamic> json) => OrderStats(
    total: json["total"] ?? 0,
    completed: json["completed"] ?? 0,
    ongoing: json["ongoing"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "completed": completed,
    "ongoing": ongoing,
  };
}
