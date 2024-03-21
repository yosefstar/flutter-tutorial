// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'residence_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResidenceDataState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<ResidenceData> get videoInfos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResidenceDataStateCopyWith<ResidenceDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidenceDataStateCopyWith<$Res> {
  factory $ResidenceDataStateCopyWith(
          ResidenceDataState value, $Res Function(ResidenceDataState) then) =
      _$ResidenceDataStateCopyWithImpl<$Res, ResidenceDataState>;
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<ResidenceData> videoInfos});
}

/// @nodoc
class _$ResidenceDataStateCopyWithImpl<$Res, $Val extends ResidenceDataState>
    implements $ResidenceDataStateCopyWith<$Res> {
  _$ResidenceDataStateCopyWithImpl(this._value, this._then);

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
              as List<ResidenceData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResidenceDataStateImplCopyWith<$Res>
    implements $ResidenceDataStateCopyWith<$Res> {
  factory _$$ResidenceDataStateImplCopyWith(_$ResidenceDataStateImpl value,
          $Res Function(_$ResidenceDataStateImpl) then) =
      __$$ResidenceDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<ResidenceData> videoInfos});
}

/// @nodoc
class __$$ResidenceDataStateImplCopyWithImpl<$Res>
    extends _$ResidenceDataStateCopyWithImpl<$Res, _$ResidenceDataStateImpl>
    implements _$$ResidenceDataStateImplCopyWith<$Res> {
  __$$ResidenceDataStateImplCopyWithImpl(_$ResidenceDataStateImpl _value,
      $Res Function(_$ResidenceDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? videoInfos = null,
  }) {
    return _then(_$ResidenceDataStateImpl(
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
              as List<ResidenceData>,
    ));
  }
}

/// @nodoc

class _$ResidenceDataStateImpl implements _ResidenceDataState {
  const _$ResidenceDataStateImpl(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<ResidenceData> videoInfos = const <ResidenceData>[]})
      : _videoInfos = videoInfos;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<ResidenceData> _videoInfos;
  @override
  @JsonKey()
  List<ResidenceData> get videoInfos {
    if (_videoInfos is EqualUnmodifiableListView) return _videoInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoInfos);
  }

  @override
  String toString() {
    return 'ResidenceDataState(isLoading: $isLoading, isReadyData: $isReadyData, videoInfos: $videoInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidenceDataStateImpl &&
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
  _$$ResidenceDataStateImplCopyWith<_$ResidenceDataStateImpl> get copyWith =>
      __$$ResidenceDataStateImplCopyWithImpl<_$ResidenceDataStateImpl>(
          this, _$identity);
}

abstract class _ResidenceDataState implements ResidenceDataState {
  const factory _ResidenceDataState(
      {final bool isLoading,
      final bool isReadyData,
      final List<ResidenceData> videoInfos}) = _$ResidenceDataStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<ResidenceData> get videoInfos;
  @override
  @JsonKey(ignore: true)
  _$$ResidenceDataStateImplCopyWith<_$ResidenceDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResidenceData _$ResidenceDataFromJson(Map<String, dynamic> json) {
  return _ResidenceData.fromJson(json);
}

/// @nodoc
mixin _$ResidenceData {
  String get imageUrl1 => throw _privateConstructorUsedError;
  String get imageUrl2 => throw _privateConstructorUsedError;
  String get text1 => throw _privateConstructorUsedError;
  String get text2 => throw _privateConstructorUsedError;
  String get text3 => throw _privateConstructorUsedError;
  String get text4 => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResidenceDataCopyWith<ResidenceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidenceDataCopyWith<$Res> {
  factory $ResidenceDataCopyWith(
          ResidenceData value, $Res Function(ResidenceData) then) =
      _$ResidenceDataCopyWithImpl<$Res, ResidenceData>;
  @useResult
  $Res call(
      {String imageUrl1,
      String imageUrl2,
      String text1,
      String text2,
      String text3,
      String text4,
      int number});
}

/// @nodoc
class _$ResidenceDataCopyWithImpl<$Res, $Val extends ResidenceData>
    implements $ResidenceDataCopyWith<$Res> {
  _$ResidenceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl1 = null,
    Object? imageUrl2 = null,
    Object? text1 = null,
    Object? text2 = null,
    Object? text3 = null,
    Object? text4 = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      imageUrl1: null == imageUrl1
          ? _value.imageUrl1
          : imageUrl1 // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl2: null == imageUrl2
          ? _value.imageUrl2
          : imageUrl2 // ignore: cast_nullable_to_non_nullable
              as String,
      text1: null == text1
          ? _value.text1
          : text1 // ignore: cast_nullable_to_non_nullable
              as String,
      text2: null == text2
          ? _value.text2
          : text2 // ignore: cast_nullable_to_non_nullable
              as String,
      text3: null == text3
          ? _value.text3
          : text3 // ignore: cast_nullable_to_non_nullable
              as String,
      text4: null == text4
          ? _value.text4
          : text4 // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResidenceDataImplCopyWith<$Res>
    implements $ResidenceDataCopyWith<$Res> {
  factory _$$ResidenceDataImplCopyWith(
          _$ResidenceDataImpl value, $Res Function(_$ResidenceDataImpl) then) =
      __$$ResidenceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imageUrl1,
      String imageUrl2,
      String text1,
      String text2,
      String text3,
      String text4,
      int number});
}

/// @nodoc
class __$$ResidenceDataImplCopyWithImpl<$Res>
    extends _$ResidenceDataCopyWithImpl<$Res, _$ResidenceDataImpl>
    implements _$$ResidenceDataImplCopyWith<$Res> {
  __$$ResidenceDataImplCopyWithImpl(
      _$ResidenceDataImpl _value, $Res Function(_$ResidenceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl1 = null,
    Object? imageUrl2 = null,
    Object? text1 = null,
    Object? text2 = null,
    Object? text3 = null,
    Object? text4 = null,
    Object? number = null,
  }) {
    return _then(_$ResidenceDataImpl(
      imageUrl1: null == imageUrl1
          ? _value.imageUrl1
          : imageUrl1 // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl2: null == imageUrl2
          ? _value.imageUrl2
          : imageUrl2 // ignore: cast_nullable_to_non_nullable
              as String,
      text1: null == text1
          ? _value.text1
          : text1 // ignore: cast_nullable_to_non_nullable
              as String,
      text2: null == text2
          ? _value.text2
          : text2 // ignore: cast_nullable_to_non_nullable
              as String,
      text3: null == text3
          ? _value.text3
          : text3 // ignore: cast_nullable_to_non_nullable
              as String,
      text4: null == text4
          ? _value.text4
          : text4 // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResidenceDataImpl implements _ResidenceData {
  const _$ResidenceDataImpl(
      {this.imageUrl1 = '',
      this.imageUrl2 = '',
      this.text1 = '',
      this.text2 = '',
      this.text3 = '',
      this.text4 = '',
      this.number = 0});

  factory _$ResidenceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidenceDataImplFromJson(json);

  @override
  @JsonKey()
  final String imageUrl1;
  @override
  @JsonKey()
  final String imageUrl2;
  @override
  @JsonKey()
  final String text1;
  @override
  @JsonKey()
  final String text2;
  @override
  @JsonKey()
  final String text3;
  @override
  @JsonKey()
  final String text4;
  @override
  @JsonKey()
  final int number;

  @override
  String toString() {
    return 'ResidenceData(imageUrl1: $imageUrl1, imageUrl2: $imageUrl2, text1: $text1, text2: $text2, text3: $text3, text4: $text4, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidenceDataImpl &&
            (identical(other.imageUrl1, imageUrl1) ||
                other.imageUrl1 == imageUrl1) &&
            (identical(other.imageUrl2, imageUrl2) ||
                other.imageUrl2 == imageUrl2) &&
            (identical(other.text1, text1) || other.text1 == text1) &&
            (identical(other.text2, text2) || other.text2 == text2) &&
            (identical(other.text3, text3) || other.text3 == text3) &&
            (identical(other.text4, text4) || other.text4 == text4) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, imageUrl1, imageUrl2, text1, text2, text3, text4, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidenceDataImplCopyWith<_$ResidenceDataImpl> get copyWith =>
      __$$ResidenceDataImplCopyWithImpl<_$ResidenceDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidenceDataImplToJson(
      this,
    );
  }
}

abstract class _ResidenceData implements ResidenceData {
  const factory _ResidenceData(
      {final String imageUrl1,
      final String imageUrl2,
      final String text1,
      final String text2,
      final String text3,
      final String text4,
      final int number}) = _$ResidenceDataImpl;

  factory _ResidenceData.fromJson(Map<String, dynamic> json) =
      _$ResidenceDataImpl.fromJson;

  @override
  String get imageUrl1;
  @override
  String get imageUrl2;
  @override
  String get text1;
  @override
  String get text2;
  @override
  String get text3;
  @override
  String get text4;
  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$ResidenceDataImplCopyWith<_$ResidenceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
