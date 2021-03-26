// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return $checkedNew('Launch', json, () {
    final val = Launch(
      fairings: $checkedConvert(
          json,
          'fairings',
          (v) =>
              v == null ? null : Fairings.fromJson(v as Map<String, dynamic>)),
      links: $checkedConvert(json, 'links',
          (v) => v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
      staticFireDateUtc:
          $checkedConvert(json, 'static_fire_date_utc', (v) => v as String),
      staticFireDateUnix:
          $checkedConvert(json, 'static_fire_date_unix', (v) => v as int),
      tbd: $checkedConvert(json, 'tbd', (v) => v as bool),
      net: $checkedConvert(json, 'net', (v) => v as bool),
      window: $checkedConvert(json, 'window', (v) => v as int),
      rocket: $checkedConvert(json, 'rocket', (v) => v as String),
      success: $checkedConvert(json, 'success', (v) => v as bool),
      details: $checkedConvert(json, 'details', (v) => v as String),
      crew: $checkedConvert(json, 'crew', (v) => v as List),
      ships: $checkedConvert(json, 'ships', (v) => v as List),
      capsules: $checkedConvert(json, 'capsules', (v) => v as List),
      payloads: $checkedConvert(json, 'payloads',
          (v) => (v as List)?.map((e) => e as String)?.toList()),
      launchpad: $checkedConvert(json, 'launchpad', (v) => v as String),
      autoUpdate: $checkedConvert(json, 'auto_update', (v) => v as bool),
      launchLibraryId: $checkedConvert(json, 'launch_library_id', (v) => v),
      failures: $checkedConvert(
          json,
          'failures',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Failures.fromJson(e as Map<String, dynamic>))
              ?.toList()),
      flightNumber: $checkedConvert(json, 'flight_number', (v) => v as int),
      name: $checkedConvert(json, 'name', (v) => v as String),
      dateUtc: $checkedConvert(json, 'date_utc', (v) => v as String),
      dateUnix: $checkedConvert(json, 'date_unix', (v) => v as int),
      dateLocal: $checkedConvert(json, 'date_local', (v) => v as String),
      datePrecision:
          $checkedConvert(json, 'date_precision', (v) => v as String),
      upcoming: $checkedConvert(json, 'upcoming', (v) => v as bool),
      cores: $checkedConvert(
          json,
          'cores',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : Cores.fromJson(e as Map<String, dynamic>))
              ?.toList()),
      id: $checkedConvert(json, 'id', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'staticFireDateUtc': 'static_fire_date_utc',
    'staticFireDateUnix': 'static_fire_date_unix',
    'autoUpdate': 'auto_update',
    'launchLibraryId': 'launch_library_id',
    'flightNumber': 'flight_number',
    'dateUtc': 'date_utc',
    'dateUnix': 'date_unix',
    'dateLocal': 'date_local',
    'datePrecision': 'date_precision'
  });
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'fairings': instance.fairings?.toJson(),
      'links': instance.links?.toJson(),
      'static_fire_date_utc': instance.staticFireDateUtc,
      'static_fire_date_unix': instance.staticFireDateUnix,
      'tbd': instance.tbd,
      'net': instance.net,
      'window': instance.window,
      'rocket': instance.rocket,
      'success': instance.success,
      'details': instance.details,
      'crew': instance.crew,
      'ships': instance.ships,
      'capsules': instance.capsules,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'auto_update': instance.autoUpdate,
      'launch_library_id': instance.launchLibraryId,
      'failures': instance.failures?.map((e) => e?.toJson())?.toList(),
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_utc': instance.dateUtc,
      'date_unix': instance.dateUnix,
      'date_local': instance.dateLocal,
      'date_precision': instance.datePrecision,
      'upcoming': instance.upcoming,
      'cores': instance.cores?.map((e) => e?.toJson())?.toList(),
      'id': instance.id,
    };
