import 'package:json_annotation/json_annotation.dart';

part 'fairings.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Fairings {
  bool reused;
  bool recoveryAttempt;
  bool recovered;
  List<dynamic> ships;

  Fairings({this.reused, this.recoveryAttempt, this.recovered, this.ships});

  Map<String, dynamic> toJson() => _$FairingsToJson(this);

  factory Fairings.fromJson(Map<String, dynamic> json) =>
      _$FairingsFromJson(json);
}
