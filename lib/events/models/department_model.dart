import 'dart:convert';

List<DepartmentModel> departmentModelFromJson(List<dynamic> str) =>
    List<DepartmentModel>.from((str).map((x) => DepartmentModel.fromJson(x)));

String departmentModelToJson(List<DepartmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentModel {
  final int id;
  final String depName;
  final String shortForm;

  DepartmentModel({
    required this.id,
    required this.depName,
    required this.shortForm,
  });

  DepartmentModel copyWith({
    int? id,
    String? depName,
    String? shortForm,
  }) =>
      DepartmentModel(
        id: id ?? this.id,
        depName: depName ?? this.depName,
        shortForm: shortForm ?? this.shortForm,
      );

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
        id: json["id"] ?? 0,
        depName: json["dep_name"] ?? '',
        shortForm: json["short_form"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dep_name": depName,
        "short_form": shortForm,
      };
}
