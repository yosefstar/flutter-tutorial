import 'package:dio/dio.dart';
import 'package:flutter_tutorial/youtube/ui/video_info_state.dart';
import 'package:retrofit/retrofit.dart';

part 'youtube_api.g.dart';

@RestApi(baseUrl: 'https://tutorial7-1.web.app/api/v1/')
abstract class YoutubeApiClient {
  factory YoutubeApiClient(Dio dio, {String baseUrl}) = _YoutubeApiClient;

  @GET('/youtube/index.json')
  Future<List<VideoInfo>> fetchYoutubeItems();
}
