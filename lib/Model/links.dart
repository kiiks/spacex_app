import 'package:json_annotation/json_annotation.dart';
import 'patch.dart';
import 'reddit.dart';
import 'flickr.dart';

part 'links.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Links {
  Patch patch;
  Reddit reddit;
  Flickr flickr;
  dynamic presskit;
  String webcast;
  String youtubeId;
  String article;
  String wikipedia;

  Links(
      {this.patch,
      this.reddit,
      this.flickr,
      this.presskit,
      this.webcast,
      this.youtubeId,
      this.article,
      this.wikipedia});

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}
