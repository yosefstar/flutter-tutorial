import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/youtube/ui/video_info_state.dart';

void main() {
  group('VideoInfo.fromJson', () {
    test('正しいJSONデータからVideoInfoオブジェクトが生成される', () {
      // テスト用のJSONデータ
      final json = {
        'imageUrl': 'https://example.com/image.jpg',
        'iconUrl': 'https://example.com/icon.jpg',
        'title': 'テストビデオ',
        'channelName': 'テストチャンネル',
        'streamNumber': 12345,
        'date': 20230101,
        'videoTime': '12:34',
      };

      // VideoInfo.fromJsonを呼び出して結果を検証
      final result = VideoInfo.fromJson(json);
      expect(result.imageUrl, 'https://example.com/image.jpg');
      expect(result.iconUrl, 'https://example.com/icon.jpg');
      expect(result.title, 'テストビデオ');
      expect(result.channelName, 'テストチャンネル');
      expect(result.streamNumber, 12345);
      expect(result.date, 20230101);
      expect(result.videoTime, '12:34');
    });
  });
}
