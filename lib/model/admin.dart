import 'package:flutter/material.dart';


class Admin {
  String name;
  String email;
  String phoneNumber;
  String password;
  String userId;
  String userType;
  int creditPoints;
  bool isBlocked;
  Admin({
    this.name,
    this.creditPoints,
    this.password,
    this.email,
    this.phoneNumber,
    this.userId,
    this.userType,
    this.isBlocked,
  });
  Admin.fromMap(Map<String, dynamic> map) {
    this.name = map["name"] ?? "";
    this.email = map["email"];
    this.creditPoints = map['creditPoints'] ?? 0;
    this.phoneNumber = map["phoneNumber"];
    this.password = map["password"];
    this.userId = map["userId"] ?? "";
    this.userType = map['userType'];
    this.isBlocked = map['isBlocked'] ?? false;
  }
  toJson(String userId) {
    return {
      "name": this.name,
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "password": this.password,
      "userId": this.userId,
      'userType': this.userType,
      "isBlocked": false,
    };
  }
}
