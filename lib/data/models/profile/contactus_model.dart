import 'dart:convert';

ContactusModel contactusModelFromJson(String str) =>
    ContactusModel.fromJson(json.decode(str));

String contactusModelToJson(ContactusModel data) => json.encode(data.toJson());

class ContactusModel {
  int statusCode;
  bool success;
  String message;
  Data data;
  dynamic meta;

  ContactusModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory ContactusModel.fromJson(Map<String, dynamic> json) => ContactusModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: json["data"] != null ? Data.fromJson(json["data"]) : Data(),
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
  Store store;
  Manager manager;

  Data({Store? store, Manager? manager})
    : store = store ?? Store(),
      manager = manager ?? Manager();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    store: json["store"] != null ? Store.fromJson(json["store"]) : Store(),
    manager:
        json["manager"] != null ? Manager.fromJson(json["manager"]) : Manager(),
  );

  Map<String, dynamic> toJson() => {
    "store": store.toJson(),
    "manager": manager.toJson(),
  };
}

class Manager {
  String name;
  String phone;

  Manager({String? name, String? phone})
    : name = name ?? "",
      phone = phone ?? "";

  factory Manager.fromJson(Map<String, dynamic> json) =>
      Manager(name: json["name"] ?? "", phone: json["phone"] ?? "");

  Map<String, dynamic> toJson() => {"name": name, "phone": phone};
}

class Store {
  String name;
  String phone;
  String location;

  Store({String? name, String? phone, String? location})
    : name = name ?? "",
      phone = phone ?? "",
      location = location ?? "";

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    name: json["name"] ?? "",
    phone: json["phone"] ?? "",
    location: json["location"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "location": location,
  };
}
