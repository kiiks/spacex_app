import 'package:json_annotation/json_annotation.dart';

part 'reddit.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Reddit {
  dynamic campaign;
  dynamic launch;
  dynamic media;
  dynamic recovery;

  Reddit({this.campaign, this.launch, this.media, this.recovery});

  Map<String, dynamic> toJson() => _$RedditToJson(this);

  factory Reddit.fromJson(Map<String, dynamic> json) => _$RedditFromJson(json);
}
