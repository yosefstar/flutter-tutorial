// Flutter imports:
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YoutubePage extends StatelessWidget {
  YoutubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildThemeData(),
      child: Scaffold(
        appBar: const _CustomAppBar(),
        body: ListView.builder(
          // _dummyVideoDataの中に、_VideosCardsSectionと_VideosHeaderがあるものとして、＋2する。
          itemCount: _dummyVideoData.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const _VideosCardsSection();
            } else if (index == 1) {
              return const _VideosHeader();
            } else {
              // _dummyVideoDataの中に、_VideosCardsSectionと_VideosHeaderがあるものとしたので、indexを-2する。
              return _VideoList(videoInfo: _dummyVideoData[index - 2]);
            }
          },
        ),
        bottomNavigationBar: const _CustomBottomNavigationBar(),
      ),
    );
  }

  final List<_VideoInfo> _dummyVideoData = [
    _VideoInfo(
      imageUrl: 'https://yososhi.com/wp-content/uploads/2020/03/20200322-2.jpg',
      iconUrl:
          'http://flat-icon-design.com/f/f_object_174/s512_f_object_174_0bg.png',
      title: 'デザイナーが教える!サムネイル作成、3つのコツ',
      channelName: 'ARASHI',
      streamNumber: 1276543,
      date: 1,
      videoTime: '12:34',
    ),
    _VideoInfo(
      imageUrl: 'https://yososhi.com/wp-content/uploads/2020/03/20200322-2.jpg',
      iconUrl:
          'http://flat-icon-design.com/f/f_object_174/s512_f_object_174_0bg.png',
      title: 'Flutterについて。Flutterについて。Flutterについて。Flutterについて。Flutterについて。',
      channelName: 'チャンネル2',
      streamNumber: 2000,
      date: 3,
      videoTime: '5:27',
    ),
    _VideoInfo(
      imageUrl: 'https://yososhi.com/wp-content/uploads/2020/03/20200322-2.jpg',
      iconUrl:
          'http://flat-icon-design.com/f/f_object_174/s512_f_object_174_0bg.png',
      title: 'ビデオタイトル3',
      channelName: 'チャンネル3',
      streamNumber: 157832,
      date: 2,
      videoTime: '1:47',
    ),
    _VideoInfo(
      imageUrl: 'https://yososhi.com/wp-content/uploads/2020/03/20200322-2.jpg',
      iconUrl:
          'http://flat-icon-design.com/f/f_object_174/s512_f_object_174_0bg.png',
      title: 'ビデオタイトル4',
      channelName: 'チャンネル4',
      streamNumber: 20,
      date: 1,
      videoTime: '3:57',
    ),
  ];

  ThemeData _buildThemeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: _CustomColors.darkGrey,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _CustomColors.darkGrey,
        selectedItemColor: Colors.white,
      ),
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Youtube';
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('images/icon_youtube.png', width: 30, height: 30),
          const Text(appTitle),
        ],
      ),
      actions: <Widget>[
        _CustomIconButton(iconData: Icons.cast, onPressed: () {}),
        _CustomIconButton(iconData: Icons.notifications_none, onPressed: () {}),
        _CustomIconButton(iconData: Icons.search, onPressed: () {}),
        ClipOval(
            child: Image.asset('images/icon_user.png',
                width: 30, height: 30, fit: BoxFit.cover)),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _VideosCardsSection extends StatelessWidget {
  const _VideosCardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 240.0,
      child: _VideosCardsGridView(cardItems: _cardItems),
    );
  }
}

class _VideosCardsGridView extends StatelessWidget {
  final List<_VideosCardsItem> cardItems;

  const _VideosCardsGridView({Key? key, required this.cardItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 横に2つのカード
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
      childAspectRatio: 4 / 1,
      children: List.generate(cardItems.length, (index) {
        return Center(
          child: Card(
            color: cardItems[index].color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0), // 角の丸みを設定
            ),
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 8),
                    Icon(cardItems[index].iconData, size: 25),
                    const SizedBox(width: 8),
                    Text(
                      cardItems[index].text,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _VideosCardsItem {
  final IconData iconData;
  final String text;
  final Color color;

  _VideosCardsItem(
      {required this.iconData, required this.text, required this.color});
}

class _CustomColors {
  static const Color trending = Color(0xff851a36);
  static const Color music = Color(0xff319696);
  static const Color games = Color(0xff95737f);
  static const Color news = Color(0xff13538f);
  static const Color learning = Color(0xff167d68);
  static const Color live = Color(0xffca7254);
  static const Color sports = Color(0xff0c7792);
  static const Color darkGrey = Color(0xFF212121);
}

final List<_VideosCardsItem> _cardItems = [
  _VideosCardsItem(
      iconData: Icons.local_fire_department,
      text: '急上昇',
      color: _CustomColors.trending),
  _VideosCardsItem(
      iconData: Icons.music_note, text: '音楽', color: _CustomColors.music),
  _VideosCardsItem(
      iconData: Icons.games, text: 'ゲーム', color: _CustomColors.games),
  _VideosCardsItem(
      iconData: Icons.article, text: 'ニュース', color: _CustomColors.news),
  _VideosCardsItem(
      iconData: Icons.highlight, text: '学び', color: _CustomColors.learning),
  _VideosCardsItem(
      iconData: Icons.live_tv, text: 'ライブ', color: _CustomColors.live),
  _VideosCardsItem(
      iconData: Icons.sports, text: 'スポーツ', color: _CustomColors.sports),
];

class _VideosHeader extends StatelessWidget {
  const _VideosHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: _CustomColors.darkGrey,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20),
          Text(
            '急上昇動画',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoInfo {
  final String imageUrl;
  final String iconUrl;
  final String title;
  final String channelName;
  final int streamNumber;
  final int date;
  final String videoTime;

  _VideoInfo({
    required this.imageUrl,
    required this.iconUrl,
    required this.title,
    required this.channelName,
    required this.streamNumber,
    required this.date,
    required this.videoTime,
  });
}

class _VideoList extends StatelessWidget {
  final _VideoInfo videoInfo;
  const _VideoList({Key? key, required this.videoInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedViewCount =
        _ViewCountFormatter.format(videoInfo.streamNumber);

    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomLeft, // アイコンとテキストの位置を調整
          children: <Widget>[
            Image.network(
              videoInfo.imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Icon(Icons.equalizer, color: Colors.white, size: 24.0),
                  const SizedBox(width: 8.0),
                  _VideoTime(time: videoInfo.videoTime),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 76,
          color: _CustomColors.darkGrey,
          child: Row(
            children: [
              _VideoProfileIcon(
                url: videoInfo.iconUrl,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Text(videoInfo.title),
                    ),
                    Row(
                      children: [
                        Text(
                          '${videoInfo.channelName}・',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '$formattedViewCount 回視聴・', // フォーマットされた再生回数を表示
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${videoInfo.date}日前',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Icon(Icons.more_vert, size: 25),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ViewCountFormatter {
  static String format(int viewCount) {
    if (viewCount < 10000) {
      // 1万未満の場合はそのまま表示
      return NumberFormat("#,###").format(viewCount);
    } else if (viewCount < 100000) {
      // 1万以上10万未満の場合は、小数点第一位までの万単位で表示
      double inTenThousands = viewCount / 10000;
      return '${inTenThousands.toStringAsFixed(1)}万';
    } else {
      // 10万以上の場合は、整数の万単位で表示
      int inTenThousands = (viewCount / 10000).floor();
      return '$inTenThousands万';
    }
  }
}

class _VideoTime extends StatelessWidget {
  final String time;

  const _VideoTime({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        time,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class _VideoProfileIcon extends StatelessWidget {
  final String url;
  const _VideoProfileIcon({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            url,
            width: 36,
            height: 36,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _BottomNavItemFactory.createItem(
            iconData: Icons.home_outlined, label: 'ホーム'),
        _BottomNavItemFactory.createItem(iconData: Icons.explore, label: '検索'),
        _BottomNavItemFactory.createItem(
            iconData: Icons.add_circle_outline, label: '', iconSize: 40),
        _BottomNavItemFactory.createItem(
            iconData: Icons.slow_motion_video_outlined, label: '登録チャンネル'),
        _BottomNavItemFactory.createItem(
            iconData: Icons.smart_display_outlined, label: 'ライブラリ'),
      ],
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const _CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }
}

class _BottomNavItemFactory {
  static BottomNavigationBarItem createItem({
    required IconData iconData,
    required String label,
    double iconSize = 24.0,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(iconData, size: iconSize),
      label: label,
    );
  }
}
