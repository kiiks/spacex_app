// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reddit _$RedditFromJson(Map<String, dynamic> json) {
  return $checkedNew('Reddit', json, () {
    final val = Reddit(
      campaign: $checkedConvert(json, 'campaign', (v) => v),
      launch: $checkedConvert(json, 'launch', (v) => v),
      media: $checkedConvert(json, 'media', (v) => v),
      recovery: $checkedConvert(json, 'recovery', (v) => v),
    );
    return val;
  });
}

Map<String, dynamic> _$RedditToJson(Reddit instance) => <String, dynamic>{
      'campaign': instance.campaign,
      'launch': instance.launch,
      'media': instance.media,
      'recovery': instance.recovery,
    };
