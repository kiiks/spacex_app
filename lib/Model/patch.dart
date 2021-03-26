import 'package:json_annotation/json_annotation.dart';

part 'patch.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Patch {
  String small;
  String large;

  Patch({this.small, this.large});

  Map<String, dynamic> toJson() => _$PatchToJson(this);

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);
}
