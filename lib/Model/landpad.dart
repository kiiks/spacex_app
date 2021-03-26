import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Landpad {
  String name;
  String fullName;
  String type;
  String locality;
  String region;
  double latitude;
  double longitude;
  int landingAttempts;
  int landingSuccesses;
  String wikipedia;
  String details;
  List<String> launches;
  String status;
  String id;

  Landpad(
      {this.name,
      this.fullName,
      this.type,
      this.locality,
      this.region,
      this.latitude,
      this.longitude,
      this.landingAttempts,
      this.landingSuccesses,
      this.wikipedia,
      this.details,
      this.launches,
      this.status,
      this.id});

  Landpad.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
    type = json['type'];
    locality = json['locality'];
    region = json['region'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    landingAttempts = json['landing_attempts'];
    landingSuccesses = json['landing_successes'];
    wikipedia = json['wikipedia'];
    details = json['details'];
    launches = json['launches'].cast<String>();
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['type'] = this.type;
    data['locality'] = this.locality;
    data['region'] = this.region;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['landing_attempts'] = this.landingAttempts;
    data['landing_successes'] = this.landingSuccesses;
    data['wikipedia'] = this.wikipedia;
    data['details'] = this.details;
    data['launches'] = this.launches;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
