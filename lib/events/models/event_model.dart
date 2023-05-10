import 'dart:convert';

import 'package:alma/auth/models/user.dart';

List<EventModel> eventModelFromJson(List<dynamic> str) =>
    List<EventModel>.from((str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  final int? id;
  final String? eventType;
  final String? eventName;
  final DateTime? eventDate;
  final String? eventDescription;
  final String? role;
  final String? description;
  final DateTime? endDate;
  final String? companyName;
  final DateTime? lastDateToApply;
  final String? institutionName;
  final List<SkillsRequired>? skillsRequired;
  final UserModel? user;

  EventModel({
    this.id,
    this.eventType,
    this.eventName,
    this.eventDate,
    this.eventDescription,
    this.role,
    this.description,
    this.endDate,
    this.companyName,
    this.lastDateToApply,
    this.institutionName,
    this.skillsRequired,
    this.user,
  });

  EventModel copyWith({
    int? id,
    String? eventType,
    String? eventName,
    DateTime? eventDate,
    String? eventDescription,
    String? role,
    String? description,
    DateTime? endDate,
    String? companyName,
    DateTime? lastDateToApply,
    String? institutionName,
    List<SkillsRequired>? skillsRequired,
    UserModel? user,
  }) =>
      EventModel(
        id: id ?? this.id,
        eventType: eventType ?? this.eventType,
        eventName: eventName ?? this.eventName,
        eventDate: eventDate ?? this.eventDate,
        eventDescription: eventDescription ?? this.eventDescription,
        role: role ?? this.role,
        description: description ?? this.description,
        endDate: endDate ?? this.endDate,
        companyName: companyName ?? this.companyName,
        lastDateToApply: lastDateToApply ?? this.lastDateToApply,
        institutionName: institutionName ?? this.institutionName,
        skillsRequired: skillsRequired ?? this.skillsRequired,
        user: user ?? this.user,
      );

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        eventType: json["event_type"] ?? '',
        eventName: json["event_name"] ?? '',
        eventDate: json["event_date"] == null
            ? null
            : DateTime.parse(json["event_date"]),
        eventDescription: json["event_description"] ?? '',
        role: json["role"] ?? '',
        description: json["description"] ?? '',
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        companyName: json["company_name"] ?? '',
        lastDateToApply: json["last_date_to_apply"] == null
            ? null
            : DateTime.parse(json["last_date_to_apply"]),
        institutionName: json["institution_name"] ?? '',
        skillsRequired: json["skills_required"] == null
            ? []
            : List<SkillsRequired>.from(json["skills_required"]!
                .map((x) => SkillsRequired.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_type": eventType,
        "event_name": eventName,
        "event_date":
            "${eventDate!.year.toString().padLeft(4, '0')}-${eventDate!.month.toString().padLeft(2, '0')}-${eventDate!.day.toString().padLeft(2, '0')}",
        "event_description": eventDescription,
        "role": role,
        "description": description,
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "company_name": companyName,
        "last_date_to_apply":
            "${lastDateToApply!.year.toString().padLeft(4, '0')}-${lastDateToApply!.month.toString().padLeft(2, '0')}-${lastDateToApply!.day.toString().padLeft(2, '0')}",
        "institution_name": institutionName,
        "skills_required": skillsRequired == null
            ? []
            : List<dynamic>.from(skillsRequired!.map((x) => x.toJson())),
        "user": user!.toJson(),
      };
}

class SkillsRequired {
  final String? name;

  SkillsRequired({
    this.name,
  });

  SkillsRequired copyWith({
    String? name,
  }) =>
      SkillsRequired(
        name: name ?? this.name,
      );

  factory SkillsRequired.fromJson(Map<String, dynamic> json) => SkillsRequired(
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
