import 'dart:convert';

DeleteAccountModel deleteAccountModelFromJson(String str) =>
    DeleteAccountModel.fromJson(json.decode(str));

String deleteAccountModelToJson(DeleteAccountModel data) =>
    json.encode(data.toJson());

class DeleteAccountModel {
  int? statusCode;
  bool? success;
  String? message;
  dynamic data;
  dynamic meta;

  DeleteAccountModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
    this.meta,
  });

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) =>
      DeleteAccountModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: json["data"],
        meta: json["meta"],
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode ?? 0,
    "success": success ?? false,
    "message": message ?? "",
    "data": data,
    "meta": meta,
  };
}
