
import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
