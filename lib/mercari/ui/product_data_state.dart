import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data_state.freezed.dart';
part 'product_data_state.g.dart';

@freezed
class ProductDataState with _$ProductDataState {
  const factory ProductDataState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<ProductData>[]) List<ProductData> productInfos,
  }) = _ProductDataState;
}

@freezed
class ProductData with _$ProductData {
  const factory ProductData({
    @Default('') String productImageUrl1,
    @Default('') String productName,
    @Default(0) int priceJPY,
    @Default(0) int numberOfSearcher,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
