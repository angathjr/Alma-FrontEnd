import 'dart:convert';

List<AlumniModel> alumniModelFromJson(List<dynamic> str) =>
    List<AlumniModel>.from(str.map((x) => AlumniModel.fromJson(x)));

String alumniModelToJson(List<AlumniModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlumniModel {
  final int? id;
  final User? user;
  final dynamic yearOfGraduate;
  final String? currentCompany;
  final dynamic previousCompanies;
  final int? academicYearFrom;
  final int? academicYearTo;
  final int? department;

  AlumniModel({
    this.id,
    this.user,
    this.yearOfGraduate,
    this.currentCompany,
    this.previousCompanies,
    this.academicYearFrom,
    this.academicYearTo,
    this.department,
  });

  AlumniModel copyWith({
    int? id,
    User? user,
    dynamic yearOfGraduate,
    String? currentCompany,
    dynamic previousCompanies,
    int? academicYearFrom,
    int? academicYearTo,
    int? department,
  }) =>
      AlumniModel(
        id: id ?? this.id,
        user: user ?? this.user,
        yearOfGraduate: yearOfGraduate ?? this.yearOfGraduate,
        currentCompany: currentCompany ?? this.currentCompany,
        previousCompanies: previousCompanies ?? this.previousCompanies,
        academicYearFrom: academicYearFrom ?? this.academicYearFrom,
        academicYearTo: academicYearTo ?? this.academicYearTo,
        department: department ?? this.department,
      );

  factory AlumniModel.fromJson(Map<String, dynamic> json) => AlumniModel(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        yearOfGraduate: json["year_of_graduate"] ?? 0,
        currentCompany: json["current_company"] ?? '',
        previousCompanies: json["previous_companies"] ?? '',
        academicYearFrom: json["academic_year_from"],
        academicYearTo: json["academic_year_to"],
        department: json["department"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "year_of_graduate": yearOfGraduate,
        "current_company": currentCompany,
        "previous_companies": previousCompanies,
        "academic_year_from": academicYearFrom,
        "academic_year_to": academicYearTo,
        "department": department,
      };
}

class User {
  final String? firstName;
  final String? lastName;
  final bool? isVerified;
  final String? email;
  final String? userType;
  final String? username;
  final String? phoneNumber;
  final String? imgUrl;
  final String? bio;
  final List<String>? areaOfInterest;

  User({
    this.firstName,
    this.lastName,
    this.isVerified,
    this.email,
    this.userType,
    this.username,
    this.phoneNumber,
    this.imgUrl,
    this.bio,
    this.areaOfInterest,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    bool? isVerified,
    String? email,
    String? userType,
    String? username,
    String? phoneNumber,
    String? imgUrl,
    String? bio,
    List<String>? areaOfInterest,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        isVerified: isVerified ?? this.isVerified,
        email: email ?? this.email,
        userType: userType ?? this.userType,
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        imgUrl: imgUrl ?? this.imgUrl,
        bio: bio ?? this.bio,
        areaOfInterest: areaOfInterest ?? this.areaOfInterest,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        isVerified: json["is_verified"] ?? false,
        email: json["email"] ?? '',
        userType: json["user_type"],
        username: json["username"],
        phoneNumber: json["phone_number"] ?? 0,
        imgUrl: json["img_url"] ?? '',
        bio: json["bio"] ?? '',
        areaOfInterest: json["area_of_interest"] == null
            ? []
            : List<String>.from(json["area_of_interest"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "is_verified": isVerified,
        "email": email,
        "user_type": userType,
        "username": username,
        "phone_number": phoneNumber,
        "img_url": imgUrl,
        "bio": bio,
        "area_of_interest": areaOfInterest == null
            ? []
            : List<dynamic>.from(areaOfInterest!.map((x) => x)),
      };
}
