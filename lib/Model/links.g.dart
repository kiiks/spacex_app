// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) {
  return $checkedNew('Links', json, () {
    final val = Links(
      patch: $checkedConvert(json, 'patch',
          (v) => v == null ? null : Patch.fromJson(v as Map<String, dynamic>)),
      reddit: $checkedConvert(json, 'reddit',
          (v) => v == null ? null : Reddit.fromJson(v as Map<String, dynamic>)),
      flickr: $checkedConvert(json, 'flickr',
          (v) => v == null ? null : Flickr.fromJson(v as Map<String, dynamic>)),
      presskit: $checkedConvert(json, 'presskit', (v) => v),
      webcast: $checkedConvert(json, 'webcast', (v) => v as String),
      youtubeId: $checkedConvert(json, 'youtube_id', (v) => v as String),
      article: $checkedConvert(json, 'article', (v) => v as String),
      wikipedia: $checkedConvert(json, 'wikipedia', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'youtubeId': 'youtube_id'});
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch?.toJson(),
      'reddit': instance.reddit?.toJson(),
      'flickr': instance.flickr?.toJson(),
      'presskit': instance.presskit,
      'webcast': instance.webcast,
      'youtube_id': instance.youtubeId,
      'article': instance.article,
      'wikipedia': instance.wikipedia,
    };
