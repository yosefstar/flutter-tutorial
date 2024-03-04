// Flutter imports:
import 'package:flutter/material.dart';

class YoutubePage extends StatelessWidget {
  const YoutubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          _TrendingVideosSection(),
          _TrendingVideosHeader(),
          _VideoListSection(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _TrendingVideosHeader extends StatelessWidget {
  const _TrendingVideosHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(width: 20),
          const Text(
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

class _TrendingVideosSection extends StatelessWidget {
  const _TrendingVideosSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 240.0,
      child: CardGridView(cardItems: cardItems), // cardItemsは外部から渡す必要があります
    );
  }
}

class _VideoListSection extends StatelessWidget {
  const _VideoListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10, // アイテムの数
        itemBuilder: (context, index) => VideoListItem(index: index),
      ),
    );
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Icon(Icons.equalizer, color: Colors.white, size: 24.0),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 1.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      '9:49',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 76,
          color: Colors.grey[900],
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                const ProfileIcon(
                                  url:
                                      'http://flat-icon-design.com/f/f_object_174/s512_f_object_174_0bg.png',
                                ),
                                const SizedBox(width: 12),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VideoTitle(index: index),
                                      const Text(
                                        'ARASHI・127万 回視聴・1日前',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, size: 27),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileIcon extends StatelessWidget {
  final String url;
  const ProfileIcon({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
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

class VideoTitle extends StatelessWidget {
  final int index;
  final List<String> titles = [
    'FlutterとはFlutterとはFlutterとはFlutterとはFlutterとは',
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
  VideoTitle({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              titles[index],
              style: const TextStyle(
                color: Colors.white,
              ),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}

class CardGridView extends StatelessWidget {
  final List<CardItem> cardItems;

  const CardGridView({Key? key, required this.cardItems}) : super(key: key);

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

class CardItem {
  final IconData iconData;
  final String text;
  final Color color;

  CardItem({required this.iconData, required this.text, required this.color});
}

final List<CardItem> cardItems = [
  CardItem(
      iconData: Icons.local_fire_department,
      text: '急上昇',
      color: const Color(0xff851a36)),
  CardItem(
      iconData: Icons.music_note, text: '音楽', color: const Color(0xff319696)),
  CardItem(iconData: Icons.games, text: 'ゲーム', color: const Color(0xff95737f)),
  CardItem(
      iconData: Icons.article, text: 'ニュース', color: const Color(0xff13538f)),
  CardItem(
      iconData: Icons.highlight, text: '学び', color: const Color(0xff167d68)),
  CardItem(
      iconData: Icons.live_tv, text: 'ライブ', color: const Color(0xffca7254)),
  CardItem(
      iconData: Icons.sports, text: 'スポーツ', color: const Color(0xff0c7792)),
];

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

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
        CustomIconButton(iconData: Icons.cast, onPressed: () {}),
        CustomIconButton(iconData: Icons.notifications_none, onPressed: () {}),
        CustomIconButton(iconData: Icons.search, onPressed: () {}),
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

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavItemFactory.createItem(
            iconData: Icons.home_outlined, label: 'ホーム'),
        BottomNavItemFactory.createItem(iconData: Icons.explore, label: '検索'),
        BottomNavItemFactory.createItem(
            iconData: Icons.add_circle_outline, label: '', iconSize: 40),
        BottomNavItemFactory.createItem(
            iconData: Icons.slow_motion_video_outlined, label: '登録チャンネル'),
        BottomNavItemFactory.createItem(
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

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const CustomIconButton({
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

class BottomNavItemFactory {
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
