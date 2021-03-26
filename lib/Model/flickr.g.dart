// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flickr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flickr _$FlickrFromJson(Map<String, dynamic> json) {
  return $checkedNew('Flickr', json, () {
    final val = Flickr(
      small: $checkedConvert(json, 'small', (v) => v as List),
      original: $checkedConvert(json, 'original', (v) => v as List),
    );
    return val;
  });
}

Map<String, dynamic> _$FlickrToJson(Flickr instance) => <String, dynamic>{
      'small': instance.small,
      'original': instance.original,
    };
