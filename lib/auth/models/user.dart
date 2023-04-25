
import 'dart:convert';

UserModel userModelFromJson(Map<String,dynamic> str) =>UserModel.fromJson(str);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    firstName: json["first_name"] ?? '',
    lastName: json["last_name"] ?? '',
    isVerified: json["is_verified"] ?? false,
    isSuperuser: json["is_superuser"] ??false,
    email: json["email"] ?? '',
    userType: json["user_type"] ?? '',
    username: json["username"] ?? '',
    phoneNumber: json["phone_number"] ?? '',
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
    this.yearOfGraduate,
    this.currentCompany,
    this.previousCompanies,
    this.academicYearFrom,
    this.academicYearTo,
  });

  final String? tkmMail;
  final int? department;
  final String? designation;
  final int? joinedYear;
  final int? yearOfGraduate;
  final String? currentCompany;
  final String? previousCompanies;
  final int? academicYearFrom;
  final int? academicYearTo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    tkmMail: json["tkm_mail"] ?? '',
    department: json["department"] ?? -1,
    designation: json["designation"] ?? '',
    joinedYear: json["joined_year"] ?? 0,
    yearOfGraduate: json["year_of_graduate"] ?? 0,
    currentCompany: json["current_company"] ?? '',
    previousCompanies: json["previous_companies"] ?? '',
    academicYearFrom: json["academic_year_from"] ?? 0,
    academicYearTo: json["academic_year_to"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "tkm_mail": tkmMail,
    "department": department,
    "designation": designation,
    "joined_year": joinedYear,
    "year_of_graduate": yearOfGraduate,
    "current_company": currentCompany,
    "previous_companies": previousCompanies,
    "academic_year_from": academicYearFrom,
    "academic_year_to": academicYearTo,
  };
}
