import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_info_state.freezed.dart';
part 'video_info_state.g.dart';

@freezed
class VideoInfoState with _$VideoInfoState {
  const factory VideoInfoState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<VideoInfo>[]) List<VideoInfo> videoInfos,
  }) = _VideoInfoState;
}

@freezed
class VideoInfo with _$VideoInfo {
  const factory VideoInfo({
    @Default('') String imageUrl,
    @Default('') String iconUrl,
    @Default('') String title,
    @Default('') String channelName,
    @Default(0) int streamNumber,
    @Default(0) int date,
    @Default('') String videoTime,
  }) = _VideoInfo;

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);
}
