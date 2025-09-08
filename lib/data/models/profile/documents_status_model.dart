import 'dart:convert';

DocumentStatusModel documentStatusModelFromJson(String str) =>
    DocumentStatusModel.fromJson(json.decode(str));

String documentStatusModelToJson(DocumentStatusModel data) =>
    json.encode(data.toJson());

class DocumentStatusModel {
  int statusCode;
  bool success;
  String message;
  DocumentData data;
  dynamic meta;

  DocumentStatusModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    this.meta,
  });

  factory DocumentStatusModel.fromJson(Map<String, dynamic> json) =>
      DocumentStatusModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data:
            json["data"] != null
                ? DocumentData.fromJson(json["data"])
                : DocumentData.empty(),
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

class DocumentData {
  DocumentStatusData documentStatus;
  String overallDocumentStatus;
  VerificationNotesData verificationNotes;
  String status;

  DocumentData({
    required this.documentStatus,
    required this.overallDocumentStatus,
    required this.verificationNotes,
    required this.status,
  });

  factory DocumentData.fromJson(Map<String, dynamic> json) => DocumentData(
    documentStatus:
        json["documentStatus"] != null
            ? DocumentStatusData.fromJson(json["documentStatus"])
            : DocumentStatusData.empty(),
    overallDocumentStatus: json["overallDocumentStatus"] ?? "",
    verificationNotes:
        json["verificationNotes"] != null
            ? VerificationNotesData.fromJson(json["verificationNotes"])
            : VerificationNotesData.empty(),
    status: json["status"] ?? "",
  );

  factory DocumentData.empty() => DocumentData(
    documentStatus: DocumentStatusData.empty(),
    overallDocumentStatus: "",
    verificationNotes: VerificationNotesData.empty(),
    status: "",
  );

  Map<String, dynamic> toJson() => {
    "documentStatus": documentStatus.toJson(),
    "overallDocumentStatus": overallDocumentStatus,
    "verificationNotes": verificationNotes.toJson(),
    "status": status,
  };
}

class DocumentStatusData {
  String idProof;
  String addressProof;
  String vehicleDocuments;
  String drivingLicense;
  String insuranceDocuments;

  DocumentStatusData({
    required this.idProof,
    required this.addressProof,
    required this.vehicleDocuments,
    required this.drivingLicense,
    required this.insuranceDocuments,
  });

  factory DocumentStatusData.fromJson(Map<String, dynamic> json) =>
      DocumentStatusData(
        idProof: json["idProof"] ?? "",
        addressProof: json["addressProof"] ?? "",
        vehicleDocuments: json["vehicleDocuments"] ?? "",
        drivingLicense: json["drivingLicense"] ?? "",
        insuranceDocuments: json["insuranceDocuments"] ?? "",
      );

  factory DocumentStatusData.empty() => DocumentStatusData(
    idProof: "",
    addressProof: "",
    vehicleDocuments: "",
    drivingLicense: "",
    insuranceDocuments: "",
  );

  Map<String, dynamic> toJson() => {
    "idProof": idProof,
    "addressProof": addressProof,
    "vehicleDocuments": vehicleDocuments,
    "drivingLicense": drivingLicense,
    "insuranceDocuments": insuranceDocuments,
  };
}

class VerificationNotesData {
  VerificationNotesData();

  factory VerificationNotesData.fromJson(Map<String, dynamic> json) =>
      VerificationNotesData();

  factory VerificationNotesData.empty() => VerificationNotesData();

  Map<String, dynamic> toJson() => {};
}
