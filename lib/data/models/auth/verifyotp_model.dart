import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) =>
    VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  int statusCode;
  bool success;
  String message;
  UserData data;
  dynamic meta;

  VerifyOtpModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? '',
    data: json["data"] != null ? UserData.fromJson(json["data"]) : UserData(),
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

class UserData {
  User user;
  String accessToken;
  String refreshToken;

  UserData({User? user, this.accessToken = '', this.refreshToken = ''})
    : user = user ?? User();

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    user: json["user"] != null ? User.fromJson(json["user"]) : User(),
    accessToken: json["accessToken"] ?? '',
    refreshToken: json["refreshToken"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class User {
  String id;
  String phone;
  String role;

  User({this.id = '', this.phone = '', this.role = ''});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? '',
    phone: json["phone"] ?? '',
    role: json["role"] ?? '',
  );

  Map<String, dynamic> toJson() => {"id": id, "phone": phone, "role": role};
}
