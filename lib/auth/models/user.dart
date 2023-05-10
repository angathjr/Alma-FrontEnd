import 'dart:convert';

UserModel userModelFromJson(Map<String, dynamic> str) =>
    UserModel.fromJson(str);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {this.firstName,
      this.lastName,
      this.isVerified,
      this.isSuperuser,
      this.email,
      this.userType,
      this.username,
      this.phoneNumber,
      this.data,
      this.imageUrl});

  final String? firstName;
  final String? lastName;
  final bool? isVerified;
  final bool? isSuperuser;
  final String? email;
  final String? userType;
  final String? username;
  final String? phoneNumber;
  final List<UserData>? data;
  final String? imageUrl;

  UserModel copyWith({
    String? firstName,
    String? lastName,
    bool? isVerified,
    bool? isSuperuser,
    String? email,
    String? userType,
    String? username,
    String? phoneNumber,
    String? imageUrl,
    List<UserData>? data,
  }) =>
      UserModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        isVerified: isVerified ?? this.isVerified,
        isSuperuser: isSuperuser ?? this.isSuperuser,
        email: email ?? this.email,
        userType: userType ?? this.userType,
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        imageUrl: imageUrl ?? this.imageUrl,
        data: data ?? this.data,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        isVerified: json["is_verified"] ?? false,
        isSuperuser: json["is_superuser"] ?? false,
        email: json["email"] ?? '',
        userType: json["user_type"] ?? '',
        username: json["username"] ?? '',
        imageUrl: json["img_url"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        data: json["data"] == null
            ? []
            : List<UserData>.from(
                json["data"]!.map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName ?? '',
        "last_name": lastName ?? '',
        "is_verified": isVerified ?? false,
        "is_superuser": isSuperuser ?? false,
        "email": email ?? '',
        "user_type": userType ?? '',
        "username": username ?? '',
        "phone_number": phoneNumber ?? '',
        "img_url": imageUrl ?? '',
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserData {
  UserData({
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

  UserData copyWith({
    String? tkmMail,
    int? department,
    String? designation,
    int? joinedYear,
    int? yearOfGraduate,
    String? currentCompany,
    String? previousCompanies,
    int? academicYearFrom,
    int? academicYearTo,
  }) =>
      UserData(
        tkmMail: tkmMail ?? this.tkmMail,
        department: department ?? this.department,
        designation: designation ?? this.designation,
        joinedYear: joinedYear ?? this.joinedYear,
        yearOfGraduate: yearOfGraduate ?? this.yearOfGraduate,
        currentCompany: currentCompany ?? this.currentCompany,
        previousCompanies: previousCompanies ?? this.previousCompanies,
        academicYearFrom: academicYearFrom ?? this.academicYearFrom,
        academicYearTo: academicYearTo ?? this.academicYearTo,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        tkmMail: json["tkm_mail"] ?? '',
        department: json["department"] ?? 0,
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
