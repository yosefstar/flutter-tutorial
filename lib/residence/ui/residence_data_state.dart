import 'package:freezed_annotation/freezed_annotation.dart';

part 'residence_data_state.freezed.dart';
part 'residence_data_state.g.dart';

@freezed
class ResidenceDataState with _$ResidenceDataState {
  const factory ResidenceDataState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<ResidenceData>[]) List<ResidenceData> videoInfos,
  }) = _ResidenceDataState;
}

@freezed
class ResidenceData with _$ResidenceData {
  const factory ResidenceData({
    @Default('') String imageUrl1,
    @Default('') String imageUrl2,
    @Default('') String text1,
    @Default('') String text2,
    @Default('') String text3,
    @Default('') String text4,
    @Default(0) int number,
  }) = _ResidenceData;

  factory ResidenceData.fromJson(Map<String, dynamic> json) =>
      _$ResidenceDataFromJson(json);
}
