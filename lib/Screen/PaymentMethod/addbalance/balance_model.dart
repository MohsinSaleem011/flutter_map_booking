// To parse this JSON data, do
//
//     final providerid = provideridFromJson(jsonString);

import 'dart:convert';

Providerid provideridFromJson(String str) => Providerid.fromJson(json.decode(str));

String provideridToJson(Providerid data) => json.encode(data.toJson());

class Providerid {
    Providerid({
        this.status,
        this.data,
    });

    String? status;
    List<Datum>? data;

    factory Providerid.fromJson(Map<String, dynamic> json) => Providerid(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.providerId,
        this.code,
        this.value,
        this.dateCreated,
        this.dateUpdated,
    });

    int? id;
    int? providerId;
    String? code;
    String? value;
    DateTime? dateCreated;
    DateTime? dateUpdated;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        providerId: json["provider_id"],
        code: json["code"],
        value: json["value"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateUpdated: DateTime.parse(json["date_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "provider_id": providerId,
        "code": code,
        "value": value,
        "date_created": dateCreated!.toIso8601String(),
        "date_updated": dateUpdated!.toIso8601String(),
    };
}
