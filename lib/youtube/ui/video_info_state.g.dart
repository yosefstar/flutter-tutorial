// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoInfoImpl _$$VideoInfoImplFromJson(Map<String, dynamic> json) =>
    _$VideoInfoImpl(
      imageUrl: json['imageUrl'] as String?,
      iconUrl: json['iconUrl'] as String?,
      title: json['title'] as String?,
      channelName: json['channelName'] as String?,
      streamNumber: json['streamNumber'] as int?,
      date: json['date'] as int?,
      videoTime: json['videoTime'] as String?,
    );

Map<String, dynamic> _$$VideoInfoImplToJson(_$VideoInfoImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'iconUrl': instance.iconUrl,
      'title': instance.title,
      'channelName': instance.channelName,
      'streamNumber': instance.streamNumber,
      'date': instance.date,
      'videoTime': instance.videoTime,
    };
