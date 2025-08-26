import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int statusCode;
  bool success;
  String message;
  LoginData data;
  dynamic meta;

  LoginModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? '',
    data: json["data"] != null ? LoginData.fromJson(json["data"]) : LoginData(),
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

class LoginData {
  String userId;

  LoginData({this.userId = ''});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      LoginData(userId: json["userId"] ?? '');

  Map<String, dynamic> toJson() => {"userId": userId};
}
