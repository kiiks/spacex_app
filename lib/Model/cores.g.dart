// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cores _$CoresFromJson(Map<String, dynamic> json) {
  return $checkedNew('Cores', json, () {
    final val = Cores(
      core: $checkedConvert(json, 'core', (v) => v as String),
      flight: $checkedConvert(json, 'flight', (v) => v as int),
      gridfins: $checkedConvert(json, 'gridfins', (v) => v as bool),
      legs: $checkedConvert(json, 'legs', (v) => v as bool),
      reused: $checkedConvert(json, 'reused', (v) => v as bool),
      landingAttempt:
          $checkedConvert(json, 'landing_attempt', (v) => v as bool),
      landingSuccess: $checkedConvert(json, 'landing_success', (v) => v),
      landingType: $checkedConvert(json, 'landing_type', (v) => v),
      landpad: $checkedConvert(json, 'landpad', (v) => v),
    );
    return val;
  }, fieldKeyMap: const {
    'landingAttempt': 'landing_attempt',
    'landingSuccess': 'landing_success',
    'landingType': 'landing_type'
  });
}

Map<String, dynamic> _$CoresToJson(Cores instance) => <String, dynamic>{
      'core': instance.core,
      'flight': instance.flight,
      'gridfins': instance.gridfins,
      'legs': instance.legs,
      'reused': instance.reused,
      'landing_attempt': instance.landingAttempt,
      'landing_success': instance.landingSuccess,
      'landing_type': instance.landingType,
      'landpad': instance.landpad,
    };
