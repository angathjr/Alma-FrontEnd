// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

List<Staff> staffFromJson(String str) => List<Staff>.from(json.decode(str).map((x) => Staff.fromJson(x)));

String staffToJson(List<Staff> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Staff {
  Staff({
    this.firstName,
    this.lastName,
    this.isVerified,
    this.isSuperuser,
    this.email,
    this.userType,
    this.username,
    this.phoneNumber,
    this.data,
  });

  final String? firstName;
  final String? lastName;
  final bool? isVerified;
  final bool? isSuperuser;
  final String? email;
  final String? userType;
  final String? username;
  final String? phoneNumber;
  final List<Datum>? data;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    firstName: json["first_name"],
    lastName: json["last_name"],
    isVerified: json["is_verified"],
    isSuperuser: json["is_superuser"],
    email: json["email"],
    userType: json["user_type"],
    username: json["username"],
    phoneNumber: json["phone_number"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "is_verified": isVerified,
    "is_superuser": isSuperuser,
    "email": email,
    "user_type": userType,
    "username": username,
    "phone_number": phoneNumber,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.tkmMail,
    this.department,
    this.designation,
    this.joinedYear,
  });

  final String? tkmMail;
  final int? department;
  final String? designation;
  final int? joinedYear;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    tkmMail: json["tkm_mail"],
    department: json["department"],
    designation: json["designation"],
    joinedYear: json["joined_year"],
  );

  Map<String, dynamic> toJson() => {
    "tkm_mail": tkmMail,
    "department": department,
    "designation": designation,
    "joined_year": joinedYear,
  };
}
