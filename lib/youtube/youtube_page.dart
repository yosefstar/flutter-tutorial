// Flutter imports:
import 'package:flutter/material.dart';

class YoutubePage extends StatelessWidget {
  const YoutubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.white,
        ),
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      child: const Scaffold(
        appBar: _CustomAppBar(),
        body: _CustomListView(),
        bottomNavigationBar: _CustomBottomNavigationBar(),
      ),
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

class _CustomListView extends StatelessWidget {
  const _CustomListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          12, // _TrendingVideosSection, _TrendingVideosHeader + 10 VideoListItem
      itemBuilder: (context, index) {
        if (index == 0) {
          return const _VideosCardsSection();
        } else if (index == 1) {
          return const _VideosHeader();
        } else {
          return _VideoItemList(index: index - 2);
        }
      },
    );
  }
}

class _VideosCardsSection extends StatelessWidget {
  const _VideosCardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 240.0,
      child: _VideosCardsGridView(cardItems: cardItems),
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

final List<_VideosCardsItem> cardItems = [
  _VideosCardsItem(
      iconData: Icons.local_fire_department,
      text: '急上昇',
      color: const Color(0xff851a36)),
  _VideosCardsItem(
      iconData: Icons.music_note, text: '音楽', color: const Color(0xff319696)),
  _VideosCardsItem(
      iconData: Icons.games, text: 'ゲーム', color: const Color(0xff95737f)),
  _VideosCardsItem(
      iconData: Icons.article, text: 'ニュース', color: const Color(0xff13538f)),
  _VideosCardsItem(
      iconData: Icons.highlight, text: '学び', color: const Color(0xff167d68)),
  _VideosCardsItem(
      iconData: Icons.live_tv, text: 'ライブ', color: const Color(0xffca7254)),
  _VideosCardsItem(
      iconData: Icons.sports, text: 'スポーツ', color: const Color(0xff0c7792)),
];

class _VideosHeader extends StatelessWidget {
  const _VideosHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: Colors.grey[900],
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

class _VideoItemList extends StatelessWidget {
  final int index;
  const _VideoItemList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomLeft, // アイコンとテキストの位置を調整
          children: <Widget>[
            Image.network(
              'https://yososhi.com/wp-content/uploads/2020/03/20200322-2.jpg',
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.equalizer, color: Colors.white, size: 24.0),
                  SizedBox(width: 8.0),
                  _VideoTime(time: '9:49'),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 76,
          color: Colors.grey[900],
          child: Row(
            children: [
              const _VideoProfileIcon(
                url:
                    'http://flat-icon-design.com/f/f_object_174/s512_f_object_174_0bg.png',
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _VideoTitle(index: index),
                    const Row(
                      children: [
                        Text(
                          'ARASHI・',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '127万 回視聴・',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '1日前',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.topCenter, // 上部中央に配置
                child: Icon(Icons.more_vert, size: 25),
              ),
            ],
          ),
        ),
      ],
    );
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

class _VideoTitle extends StatelessWidget {
  final int index;
  final List<String> titles = [
    'FlutterとはFlutterとはFlutterとはFlutterとはFlutterとはFlutterとは',
    '今日の天気',
    'スポーツ情報スポーツ情報スポーツ情報スポーツ情報スポーツ情報',
    '経済の動向',
    '技術の進化技術の進化技術の進化技術の進化技術の進化技術の進化',
    '健康と栄養',
    '旅行のすすめ旅行のすすめ旅行のすすめ旅行のすすめ旅行のすすめ',
    '美術の世界',
    '音楽の魅力音楽の魅力音楽の魅力音楽の魅力音楽の魅力音楽の魅力音楽の魅力',
    '映画レビュー',
  ];
  _VideoTitle({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        children: [
          Text(
            titles[index],
            style: const TextStyle(
              color: Colors.white,
            ),
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar({super.key});

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
