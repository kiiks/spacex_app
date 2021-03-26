// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failures _$FailuresFromJson(Map<String, dynamic> json) {
  return $checkedNew('Failures', json, () {
    final val = Failures(
      time: $checkedConvert(json, 'time', (v) => v as int),
      altitude: $checkedConvert(json, 'altitude', (v) => v),
      reason: $checkedConvert(json, 'reason', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$FailuresToJson(Failures instance) => <String, dynamic>{
      'time': instance.time,
      'altitude': instance.altitude,
      'reason': instance.reason,
    };
