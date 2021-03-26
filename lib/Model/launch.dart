import 'package:json_annotation/json_annotation.dart';
import 'fairings.dart';
import 'failures.dart';
import 'cores.dart';
import 'links.dart';

part 'launch.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launch {
  Fairings fairings;
  Links links;
  String staticFireDateUtc;
  int staticFireDateUnix;
  bool tbd;
  bool net;
  int window;
  String rocket;
  bool success;
  String details;
  List<dynamic> crew;
  List<dynamic> ships;
  List<dynamic> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  dynamic launchLibraryId;
  List<Failures> failures;
  int flightNumber;
  String name;
  String dateUtc;
  int dateUnix;
  String dateLocal;
  String datePrecision;
  bool upcoming;
  List<Cores> cores;
  String id;

  Launch(
      {this.fairings,
      this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.tbd,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.details,
      this.crew,
      this.ships,
      this.capsules,
      this.payloads,
      this.launchpad,
      this.autoUpdate,
      this.launchLibraryId,
      this.failures,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.id});

  Map<String, dynamic> toJson() => _$LaunchToJson(this);

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
}
