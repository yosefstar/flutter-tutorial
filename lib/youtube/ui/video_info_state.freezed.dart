// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<VideoInfo> get videoInfos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoInfoStateCopyWith<VideoInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoInfoStateCopyWith<$Res> {
  factory $VideoInfoStateCopyWith(
          VideoInfoState value, $Res Function(VideoInfoState) then) =
      _$VideoInfoStateCopyWithImpl<$Res, VideoInfoState>;
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<VideoInfo> videoInfos});
}

/// @nodoc
class _$VideoInfoStateCopyWithImpl<$Res, $Val extends VideoInfoState>
    implements $VideoInfoStateCopyWith<$Res> {
  _$VideoInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? videoInfos = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      videoInfos: null == videoInfos
          ? _value.videoInfos
          : videoInfos // ignore: cast_nullable_to_non_nullable
              as List<VideoInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoInfoStateImplCopyWith<$Res>
    implements $VideoInfoStateCopyWith<$Res> {
  factory _$$VideoInfoStateImplCopyWith(_$VideoInfoStateImpl value,
          $Res Function(_$VideoInfoStateImpl) then) =
      __$$VideoInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<VideoInfo> videoInfos});
}

/// @nodoc
class __$$VideoInfoStateImplCopyWithImpl<$Res>
    extends _$VideoInfoStateCopyWithImpl<$Res, _$VideoInfoStateImpl>
    implements _$$VideoInfoStateImplCopyWith<$Res> {
  __$$VideoInfoStateImplCopyWithImpl(
      _$VideoInfoStateImpl _value, $Res Function(_$VideoInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? videoInfos = null,
  }) {
    return _then(_$VideoInfoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      videoInfos: null == videoInfos
          ? _value._videoInfos
          : videoInfos // ignore: cast_nullable_to_non_nullable
              as List<VideoInfo>,
    ));
  }
}

/// @nodoc

class _$VideoInfoStateImpl implements _VideoInfoState {
  const _$VideoInfoStateImpl(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<VideoInfo> videoInfos = const <VideoInfo>[]})
      : _videoInfos = videoInfos;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<VideoInfo> _videoInfos;
  @override
  @JsonKey()
  List<VideoInfo> get videoInfos {
    if (_videoInfos is EqualUnmodifiableListView) return _videoInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoInfos);
  }

  @override
  String toString() {
    return 'VideoInfoState(isLoading: $isLoading, isReadyData: $isReadyData, videoInfos: $videoInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoInfoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReadyData, isReadyData) ||
                other.isReadyData == isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._videoInfos, _videoInfos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isReadyData,
      const DeepCollectionEquality().hash(_videoInfos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoInfoStateImplCopyWith<_$VideoInfoStateImpl> get copyWith =>
      __$$VideoInfoStateImplCopyWithImpl<_$VideoInfoStateImpl>(
          this, _$identity);
}

abstract class _VideoInfoState implements VideoInfoState {
  const factory _VideoInfoState(
      {final bool isLoading,
      final bool isReadyData,
      final List<VideoInfo> videoInfos}) = _$VideoInfoStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<VideoInfo> get videoInfos;
  @override
  @JsonKey(ignore: true)
  _$$VideoInfoStateImplCopyWith<_$VideoInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) {
  return _VideoInfo.fromJson(json);
}

/// @nodoc
mixin _$VideoInfo {
  String get imageUrl => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;
  int get streamNumber => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  String get videoTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoInfoCopyWith<VideoInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoInfoCopyWith<$Res> {
  factory $VideoInfoCopyWith(VideoInfo value, $Res Function(VideoInfo) then) =
      _$VideoInfoCopyWithImpl<$Res, VideoInfo>;
  @useResult
  $Res call(
      {String imageUrl,
      String iconUrl,
      String title,
      String channelName,
      int streamNumber,
      int date,
      String videoTime});
}

/// @nodoc
class _$VideoInfoCopyWithImpl<$Res, $Val extends VideoInfo>
    implements $VideoInfoCopyWith<$Res> {
  _$VideoInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? iconUrl = null,
    Object? title = null,
    Object? channelName = null,
    Object? streamNumber = null,
    Object? date = null,
    Object? videoTime = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      streamNumber: null == streamNumber
          ? _value.streamNumber
          : streamNumber // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      videoTime: null == videoTime
          ? _value.videoTime
          : videoTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoInfoImplCopyWith<$Res>
    implements $VideoInfoCopyWith<$Res> {
  factory _$$VideoInfoImplCopyWith(
          _$VideoInfoImpl value, $Res Function(_$VideoInfoImpl) then) =
      __$$VideoInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imageUrl,
      String iconUrl,
      String title,
      String channelName,
      int streamNumber,
      int date,
      String videoTime});
}

/// @nodoc
class __$$VideoInfoImplCopyWithImpl<$Res>
    extends _$VideoInfoCopyWithImpl<$Res, _$VideoInfoImpl>
    implements _$$VideoInfoImplCopyWith<$Res> {
  __$$VideoInfoImplCopyWithImpl(
      _$VideoInfoImpl _value, $Res Function(_$VideoInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? iconUrl = null,
    Object? title = null,
    Object? channelName = null,
    Object? streamNumber = null,
    Object? date = null,
    Object? videoTime = null,
  }) {
    return _then(_$VideoInfoImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      streamNumber: null == streamNumber
          ? _value.streamNumber
          : streamNumber // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      videoTime: null == videoTime
          ? _value.videoTime
          : videoTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoInfoImpl implements _VideoInfo {
  const _$VideoInfoImpl(
      {this.imageUrl = '',
      this.iconUrl = '',
      this.title = '',
      this.channelName = '',
      this.streamNumber = 0,
      this.date = 0,
      this.videoTime = ''});

  factory _$VideoInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoInfoImplFromJson(json);

  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String iconUrl;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String channelName;
  @override
  @JsonKey()
  final int streamNumber;
  @override
  @JsonKey()
  final int date;
  @override
  @JsonKey()
  final String videoTime;

  @override
  String toString() {
    return 'VideoInfo(imageUrl: $imageUrl, iconUrl: $iconUrl, title: $title, channelName: $channelName, streamNumber: $streamNumber, date: $date, videoTime: $videoTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoInfoImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.streamNumber, streamNumber) ||
                other.streamNumber == streamNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.videoTime, videoTime) ||
                other.videoTime == videoTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, iconUrl, title,
      channelName, streamNumber, date, videoTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoInfoImplCopyWith<_$VideoInfoImpl> get copyWith =>
      __$$VideoInfoImplCopyWithImpl<_$VideoInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoInfoImplToJson(
      this,
    );
  }
}

abstract class _VideoInfo implements VideoInfo {
  const factory _VideoInfo(
      {final String imageUrl,
      final String iconUrl,
      final String title,
      final String channelName,
      final int streamNumber,
      final int date,
      final String videoTime}) = _$VideoInfoImpl;

  factory _VideoInfo.fromJson(Map<String, dynamic> json) =
      _$VideoInfoImpl.fromJson;

  @override
  String get imageUrl;
  @override
  String get iconUrl;
  @override
  String get title;
  @override
  String get channelName;
  @override
  int get streamNumber;
  @override
  int get date;
  @override
  String get videoTime;
  @override
  @JsonKey(ignore: true)
  _$$VideoInfoImplCopyWith<_$VideoInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
