// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDataState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<ProductData> get productInfos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDataStateCopyWith<ProductDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataStateCopyWith<$Res> {
  factory $ProductDataStateCopyWith(
          ProductDataState value, $Res Function(ProductDataState) then) =
      _$ProductDataStateCopyWithImpl<$Res, ProductDataState>;
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<ProductData> productInfos});
}

/// @nodoc
class _$ProductDataStateCopyWithImpl<$Res, $Val extends ProductDataState>
    implements $ProductDataStateCopyWith<$Res> {
  _$ProductDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? productInfos = null,
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
      productInfos: null == productInfos
          ? _value.productInfos
          : productInfos // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDataStateImplCopyWith<$Res>
    implements $ProductDataStateCopyWith<$Res> {
  factory _$$ProductDataStateImplCopyWith(_$ProductDataStateImpl value,
          $Res Function(_$ProductDataStateImpl) then) =
      __$$ProductDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<ProductData> productInfos});
}

/// @nodoc
class __$$ProductDataStateImplCopyWithImpl<$Res>
    extends _$ProductDataStateCopyWithImpl<$Res, _$ProductDataStateImpl>
    implements _$$ProductDataStateImplCopyWith<$Res> {
  __$$ProductDataStateImplCopyWithImpl(_$ProductDataStateImpl _value,
      $Res Function(_$ProductDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? productInfos = null,
  }) {
    return _then(_$ProductDataStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      productInfos: null == productInfos
          ? _value._productInfos
          : productInfos // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$ProductDataStateImpl implements _ProductDataState {
  const _$ProductDataStateImpl(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<ProductData> productInfos = const <ProductData>[]})
      : _productInfos = productInfos;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<ProductData> _productInfos;
  @override
  @JsonKey()
  List<ProductData> get productInfos {
    if (_productInfos is EqualUnmodifiableListView) return _productInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productInfos);
  }

  @override
  String toString() {
    return 'ProductDataState(isLoading: $isLoading, isReadyData: $isReadyData, productInfos: $productInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDataStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReadyData, isReadyData) ||
                other.isReadyData == isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._productInfos, _productInfos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isReadyData,
      const DeepCollectionEquality().hash(_productInfos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDataStateImplCopyWith<_$ProductDataStateImpl> get copyWith =>
      __$$ProductDataStateImplCopyWithImpl<_$ProductDataStateImpl>(
          this, _$identity);
}

abstract class _ProductDataState implements ProductDataState {
  const factory _ProductDataState(
      {final bool isLoading,
      final bool isReadyData,
      final List<ProductData> productInfos}) = _$ProductDataStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<ProductData> get productInfos;
  @override
  @JsonKey(ignore: true)
  _$$ProductDataStateImplCopyWith<_$ProductDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductData _$ProductDataFromJson(Map<String, dynamic> json) {
  return _ProductData.fromJson(json);
}

/// @nodoc
mixin _$ProductData {
  String get productImageUrl1 => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get priceJPY => throw _privateConstructorUsedError;
  int get numberOfSearcher => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDataCopyWith<ProductData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataCopyWith<$Res> {
  factory $ProductDataCopyWith(
          ProductData value, $Res Function(ProductData) then) =
      _$ProductDataCopyWithImpl<$Res, ProductData>;
  @useResult
  $Res call(
      {String productImageUrl1,
      String productName,
      int priceJPY,
      int numberOfSearcher});
}

/// @nodoc
class _$ProductDataCopyWithImpl<$Res, $Val extends ProductData>
    implements $ProductDataCopyWith<$Res> {
  _$ProductDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImageUrl1 = null,
    Object? productName = null,
    Object? priceJPY = null,
    Object? numberOfSearcher = null,
  }) {
    return _then(_value.copyWith(
      productImageUrl1: null == productImageUrl1
          ? _value.productImageUrl1
          : productImageUrl1 // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      priceJPY: null == priceJPY
          ? _value.priceJPY
          : priceJPY // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSearcher: null == numberOfSearcher
          ? _value.numberOfSearcher
          : numberOfSearcher // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDataImplCopyWith<$Res>
    implements $ProductDataCopyWith<$Res> {
  factory _$$ProductDataImplCopyWith(
          _$ProductDataImpl value, $Res Function(_$ProductDataImpl) then) =
      __$$ProductDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productImageUrl1,
      String productName,
      int priceJPY,
      int numberOfSearcher});
}

/// @nodoc
class __$$ProductDataImplCopyWithImpl<$Res>
    extends _$ProductDataCopyWithImpl<$Res, _$ProductDataImpl>
    implements _$$ProductDataImplCopyWith<$Res> {
  __$$ProductDataImplCopyWithImpl(
      _$ProductDataImpl _value, $Res Function(_$ProductDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImageUrl1 = null,
    Object? productName = null,
    Object? priceJPY = null,
    Object? numberOfSearcher = null,
  }) {
    return _then(_$ProductDataImpl(
      productImageUrl1: null == productImageUrl1
          ? _value.productImageUrl1
          : productImageUrl1 // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      priceJPY: null == priceJPY
          ? _value.priceJPY
          : priceJPY // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSearcher: null == numberOfSearcher
          ? _value.numberOfSearcher
          : numberOfSearcher // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDataImpl implements _ProductData {
  const _$ProductDataImpl(
      {this.productImageUrl1 = '',
      this.productName = '',
      this.priceJPY = 0,
      this.numberOfSearcher = 0});

  factory _$ProductDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDataImplFromJson(json);

  @override
  @JsonKey()
  final String productImageUrl1;
  @override
  @JsonKey()
  final String productName;
  @override
  @JsonKey()
  final int priceJPY;
  @override
  @JsonKey()
  final int numberOfSearcher;

  @override
  String toString() {
    return 'ProductData(productImageUrl1: $productImageUrl1, productName: $productName, priceJPY: $priceJPY, numberOfSearcher: $numberOfSearcher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDataImpl &&
            (identical(other.productImageUrl1, productImageUrl1) ||
                other.productImageUrl1 == productImageUrl1) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.priceJPY, priceJPY) ||
                other.priceJPY == priceJPY) &&
            (identical(other.numberOfSearcher, numberOfSearcher) ||
                other.numberOfSearcher == numberOfSearcher));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productImageUrl1, productName, priceJPY, numberOfSearcher);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDataImplCopyWith<_$ProductDataImpl> get copyWith =>
      __$$ProductDataImplCopyWithImpl<_$ProductDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDataImplToJson(
      this,
    );
  }
}

abstract class _ProductData implements ProductData {
  const factory _ProductData(
      {final String productImageUrl1,
      final String productName,
      final int priceJPY,
      final int numberOfSearcher}) = _$ProductDataImpl;

  factory _ProductData.fromJson(Map<String, dynamic> json) =
      _$ProductDataImpl.fromJson;

  @override
  String get productImageUrl1;
  @override
  String get productName;
  @override
  int get priceJPY;
  @override
  int get numberOfSearcher;
  @override
  @JsonKey(ignore: true)
  _$$ProductDataImplCopyWith<_$ProductDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
