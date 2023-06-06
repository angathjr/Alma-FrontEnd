import 'dart:convert';

List<EventModel> eventModelFromJson(List<dynamic> str) =>
    List<EventModel>.from((str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  final String? eventType;
  final String? eventName;
  final DateTime? eventDate;
  final String? eventDescription;
  final String? role;
  final List<String>? skillsRequired;
  final String? description;
  final DateTime? endDate;
  final String? companyName;
  final String? venue;
  final DateTime? lastDateToApply;
  final String? institutionName;
  final dynamic imgUrl;
  final PostedBy? postedBy;
  final String? duration;
  final String? eventLink;

  EventModel(
      {this.eventType,
      this.eventName,
      this.eventDate,
      this.eventDescription,
      this.role,
      this.skillsRequired,
      this.description,
      this.endDate,
      this.companyName,
      this.lastDateToApply,
      this.institutionName,
      this.imgUrl,
      this.postedBy,
      this.duration,
      this.eventLink,
      this.venue});

  EventModel copyWith(
          {String? eventType,
          String? eventName,
          DateTime? eventDate,
          String? eventDescription,
          String? role,
          List<String>? skillsRequired,
          String? description,
          DateTime? endDate,
          String? companyName,
          DateTime? lastDateToApply,
          String? institutionName,
          dynamic imgUrl,
          PostedBy? postedBy,
          String? duration,
          String? eventLink,
          String? venue}) =>
      EventModel(
          eventType: eventType ?? this.eventType,
          eventName: eventName ?? this.eventName,
          eventDate: eventDate ?? this.eventDate,
          duration: duration ?? this.duration,
          eventLink: eventLink ?? this.eventLink,
          eventDescription: eventDescription ?? this.eventDescription,
          role: role ?? this.role,
          skillsRequired: skillsRequired ?? this.skillsRequired,
          description: description ?? this.description,
          endDate: endDate ?? this.endDate,
          companyName: companyName ?? this.companyName,
          lastDateToApply: lastDateToApply ?? this.lastDateToApply,
          institutionName: institutionName ?? this.institutionName,
          imgUrl: imgUrl ?? this.imgUrl,
          postedBy: postedBy ?? this.postedBy,
          venue: venue ?? this.venue);

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
      eventType: json["event_type"],
      eventName: json["event_name"] ?? '',
      eventDate: json["event_date"] == null
          ? null
          : DateTime.parse(json["event_date"]),
      eventDescription: json["event_description"] ?? ' ',
      role: json["role"] ?? '',
      skillsRequired: json["skills_required"] == null
          ? []
          : List<String>.from(json["skills_required"]!.map((x) => x)),
      description: json["description"] ?? '',
      endDate:
          json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
      companyName: json["company_name"] ?? '',
      lastDateToApply: json["last_date_to_apply"] == null
          ? null
          : DateTime.parse(json["last_date_to_apply"]),
      institutionName: json["institution_name"] ?? '',
      imgUrl: json["img_url"] ?? '',
      postedBy: json["posted_by"] == null
          ? null
          : PostedBy.fromJson(json["posted_by"]),
      venue: json["venue"] ?? '',
      duration: json["duration"] ?? '',
      eventLink: json["event_link"] ?? '');

  Map<String, dynamic> toJson() => {
        "event_type": eventType ?? 'J',
        "event_name": eventName ?? '',
        "duration": duration ?? "",
        "event_date":
            "${eventDate!.year.toString().padLeft(4, '0')}-${eventDate!.month.toString().padLeft(2, '0')}-${eventDate!.day.toString().padLeft(2, '0')}",
        "event_description": eventDescription ?? '',
        "role": role ?? '',
        "skills_required": skillsRequired == null
            ? []
            : List<dynamic>.from(skillsRequired!.map((x) => x)),
        "description": description ?? "",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "company_name": companyName,
        "last_date_to_apply":
            "${lastDateToApply!.year.toString().padLeft(4, '0')}-${lastDateToApply!.month.toString().padLeft(2, '0')}-${lastDateToApply!.day.toString().padLeft(2, '0')}",
        "institution_name": institutionName,
        "img_url": imgUrl,
        "posted_by": postedBy?.toJson(),
        "venue": venue ?? '',
        "event_link": eventLink ?? ''
      };
}

class PostedBy {
  final int? id;
  final String? firstName;
  final dynamic? lastName;
  final dynamic? imgUrl;

  PostedBy({
    this.id,
    this.firstName,
    this.lastName,
    this.imgUrl,
  });

  PostedBy copyWith({
    int? id,
    String? firstName,
    dynamic? lastName,
    dynamic? imgUrl,
  }) =>
      PostedBy(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        imgUrl: imgUrl ?? this.imgUrl,
      );

  factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["id"],
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        imgUrl: json["img_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName ?? '',
        "last_name": lastName ?? '',
        "img_url": imgUrl ?? '',
      };
}
