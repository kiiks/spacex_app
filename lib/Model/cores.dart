import 'package:json_annotation/json_annotation.dart';

part 'cores.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Cores {
  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  dynamic landingSuccess;
  dynamic landingType;
  dynamic landpad;

  Cores(
      {this.core,
      this.flight,
      this.gridfins,
      this.legs,
      this.reused,
      this.landingAttempt,
      this.landingSuccess,
      this.landingType,
      this.landpad});

  Map<String, dynamic> toJson() => _$CoresToJson(this);

  factory Cores.fromJson(Map<String, dynamic> json) => _$CoresFromJson(json);
}
