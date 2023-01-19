// To parse this JSON data, do
//
//     final usernotifications = usernotificationsFromJson(jsonString);

import 'dart:convert';

List<Usernotifications> usernotificationsFromJson(String str) => List<Usernotifications>.from(json.decode(str).map((x) => Usernotifications.fromJson(x)));

String usernotificationsToJson(List<Usernotifications> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usernotifications {
    Usernotifications({
        this.id,
        this.notifyType,
        this.image,
        this.description,
        this.expiryDate,
        this.status,
    });

    int? id;
    String? notifyType;
    String? image;
    String? description;
    DateTime? expiryDate;
    String? status;

    factory Usernotifications.fromJson(Map<String, dynamic> json) => Usernotifications(
        id: json["id"],
        notifyType: json["notify_type"],
        image: json["image"],
        description: json["description"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "notify_type": notifyType,
        "image": image,
        "description": description,
        "expiry_date": expiryDate!.toIso8601String(),
        "status": status,
    };
}
