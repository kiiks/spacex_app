import 'package:json_annotation/json_annotation.dart';

part 'failures.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Failures {
  int time;
  dynamic altitude;
  String reason;

  Failures({this.time, this.altitude, this.reason});

  Map<String, dynamic> toJson() => _$FailuresToJson(this);

  factory Failures.fromJson(Map<String, dynamic> json) =>
      _$FailuresFromJson(json);
}
