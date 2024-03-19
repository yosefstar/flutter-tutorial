import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/youtube/api/youtube_api.dart';
import 'package:flutter_tutorial/youtube/ui/video_info_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((_) {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger());
  return dio;
});

final youtubeApiClientProvider = Provider<YoutubeApiClient>((ref) {
  final dio = ref.read(dioProvider);
  return YoutubeApiClient(dio);
});

final videoInfoRepositoryProvider = Provider<VideoInfoRepository>((ref) {
  return VideoInfoRepository(ref);
});

class VideoInfoRepository {
  VideoInfoRepository(this._ref);

  final Ref _ref;

  Future<List<VideoInfo>> fetchYoutubeVideos() async {
    final apiClient = _ref.read(youtubeApiClientProvider);
    return apiClient.fetchYoutubeItems();
  }
}
