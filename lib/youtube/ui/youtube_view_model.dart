import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/youtube/repository/video_info_repository.dart';
import 'package:flutter_tutorial/youtube/ui/video_info_state.dart';

final videoInfoProvider =
    FutureProvider.autoDispose<List<VideoInfo>>((ref) async {
  final repository = ref.read(videoInfoRepositoryProvider);
  return repository.fetchYoutubeVideos();
});
