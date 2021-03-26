import 'package:json_annotation/json_annotation.dart';

part 'flickr.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Flickr {
  List<dynamic> small;
  List<dynamic> original;

  Flickr({this.small, this.original});

  Map<String, dynamic> toJson() => _$FlickrToJson(this);

  factory Flickr.fromJson(Map<String, dynamic> json) => _$FlickrFromJson(json);
}
