// Flutter imports:
import 'package:flutter/material.dart';

class MercariPage extends StatelessWidget {
  const MercariPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _CustomAppBar(),
      floatingActionButton: const _CustomFloatingActionButton(),
      body: Container(
        color: Color(0xFFEAEAE9), // 背景色を設定
        child: _ResidenceListView(),
      ),
      bottomNavigationBar: const _CustomBottomNavigationBar(),
    );
  }
}

class _CustomColors {
  static const Color lightRed = Color(0xffff5252);
  static const Color lightBlue = Color(0xff2196f3);
}

class _MainPhoto extends StatelessWidget {
  const _MainPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
      child: Image.asset('images/photo_mercari.png', fit: BoxFit.cover),
    );
  }
}

class _ShortCutCardList extends StatelessWidget {
  const _ShortCutCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('出品へのショートカット'),
          SizedBox(height: 4),
          Row(
            children: [
              _ShortCutCard(text: '写真を撮る', iconData: Icons.camera_alt_outlined),
              SizedBox(width: 8),
              _ShortCutCard(text: 'アルバム', iconData: Icons.image),
              SizedBox(width: 8),
              _ShortCutCard(
                  text: 'バーコード', text2: '（本・コスメ）', iconData: Icons.qr_code),
              SizedBox(width: 8),
              _ShortCutCard(
                  text: '下書き一覧', iconData: Icons.content_paste_outlined),
            ],
          ),
        ],
      ), // Column ウィジェットを閉じるカッコ
    ); // Container ウィジェットを閉じるカッコ
  }
}

class _ShortCutCard extends StatelessWidget {
  final String text;
  final IconData iconData;
  final String? text2; // オプショナルなパラメータとしてtext2を追加

  const _ShortCutCard({
    Key? key,
    required this.text,
    required this.iconData,
    this.text2, // コンストラクタに追加
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 112.0,
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 34.0,
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  style: const TextStyle(fontSize: 11.0),
                  textAlign: TextAlign.center,
                ),
                if (text2 != null) ...[
                  // text2がある場合のみ表示
                  const SizedBox(height: 4),
                  Text(
                    text2!,
                    style: const TextStyle(fontSize: 11.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostingListBar extends StatelessWidget {
  const _PostingListBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 12),
          Column(
            // Column ウィジェットを追加
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '売れやすい持ち物',
                style: TextStyle(fontWeight: FontWeight.bold), // テキストを太字に設定
              ),
              Text(
                '使わないものを出品してみよう！',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          const Text(
            'すべてを見る＞',
            style: TextStyle(
              color: _CustomColors.lightBlue,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

class DataListDisplay<T> extends StatelessWidget {
  final List<T> dataList;
  final Widget Function(T) itemBuilder;

  const DataListDisplay({
    Key? key,
    required this.dataList,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return itemBuilder(dataList[index]);
      },
    );
  }
}

class _CustomData {
  final String imageUrl1;
  final String text1;
  final int number1;
  final int number2;

  _CustomData({
    required this.imageUrl1,
    required this.text1,
    required this.number1,
    required this.number2,
  });
}

class _ResidenceListView extends StatelessWidget {
  // テストデータのリストを作成
  final List<_CustomData> dataList = [
    _CustomData(
      imageUrl1:
          'https://thumb.photo-ac.com/e8/e84d3dd4bf93d46b76ee4452e8ab2332_t.jpeg',
      text1: 'sony a7iii',
      number1: 2000,
      number2: 200,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'panasonic b6ttt',
      number1: 1500,
      number2: 80,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'sharp u2hhh',
      number1: 5500,
      number2: 850,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'intel core i9',
      number1: 800,
      number2: 15,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'sony b9uuu',
      number1: 2200,
      number2: 150,
    ),
    _CustomData(
      imageUrl1:
          'https://thumb.photo-ac.com/e8/e84d3dd4bf93d46b76ee4452e8ab2332_t.jpeg',
      text1: 'sony a7iii',
      number1: 2000,
      number2: 200,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'panasonic b6ttt',
      number1: 1500,
      number2: 80,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'sharp u2hhh',
      number1: 5500,
      number2: 850,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'intel core i9',
      number1: 800,
      number2: 15,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'sony b9uuu',
      number1: 2200,
      number2: 150,
    ),
  ];

  _ResidenceListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length +
          3, // _MainPhoto, _ShortCutCardList, と _PostingListBar を含むため +3
      itemBuilder: (context, index) {
        if (index == 0) {
          return const _MainPhoto(); // 最初のアイテム
        } else if (index == 1) {
          return const _ShortCutCardList(); // 2番目のアイテム
        } else if (index == 2) {
          return const _PostingListBar(); // 3番目のアイテム
        }
        final data = dataList[index - 3]; // dataList のインデックスを調整
        return _CustomDataDisplayWidget(
          imageUrl1: data.imageUrl1,
          text1: data.text1,
          number1: data.number1,
          number2: data.number2,
        );
      },
    );
  }
}

class _CustomDataDisplayWidget extends StatelessWidget {
  final String imageUrl1;
  final String text1;
  final int number1;
  final int number2;

  const _CustomDataDisplayWidget({
    Key? key,
    required this.imageUrl1,
    required this.text1,
    required this.number1,
    required this.number2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 72.0, // 幅を24に設定
                  height: 72.0, // 高さを24に設定
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      imageUrl1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      '¥${number1}',
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department, // 炎のアイコン
                          color: _CustomColors.lightBlue, // アイコンの色を赤に設定
                          size: 16.0, // アイコンのサイズを設定
                        ),
                        SizedBox(width: 4.0), // アイコンとテキストの間にスペースを追加
                        Text(
                          '${number2}人が探しています',
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                _PostingCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostingCard extends StatelessWidget {
  const _PostingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _CustomColors.lightRed, // 赤い背景色を設定
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          '出品する',
          style: TextStyle(
            color: Colors.white, // テキストの色を白に設定
            fontSize: 14.0, // テキストのサイズを設定
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        '出品',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevation: 2,
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FloatingActionButton(
        backgroundColor: _CustomColors.lightRed,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_camera_outlined, color: Colors.white, size: 28.0),
          ],
        ),
      ),
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
            iconData: Icons.home, label: 'ホーム', stackNumber: 5),
        _BottomNavItemFactory.createItem(
            iconData: Icons.notifications_none_outlined, label: 'お知らせ'),
        _BottomNavItemFactory.createItem(
            iconData: Icons.photo_camera_outlined, label: 'メッセージ'),
        _BottomNavItemFactory.createItem(
            iconData: Icons.add_comment_outlined, label: 'マイページ'),
        _BottomNavItemFactory.createItem(
            iconData: Icons.account_circle, label: 'マイページ'),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: _CustomColors.lightBlue,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _BottomNavItemFactory {
  static BottomNavigationBarItem createItem({
    required IconData iconData,
    required String label,
    double iconSize = 36.0,
    int? stackNumber,
  }) {
    Widget icon = SizedBox(
      width: 48.0,
      height: 48.0,
      child: Align(
        alignment: Alignment.center,
        child: Icon(iconData, size: iconSize),
      ),
    );
    if (stackNumber != null && stackNumber != 0) {
      icon = Stack(
        children: [
          SizedBox(
              width: 48.0, height: 48.0, child: Icon(iconData, size: iconSize)),
          Positioned(
            right: 0,
            top: 5,
            child: _StackNumber(number: "$stackNumber"),
          ),
        ],
      );
    }
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}

class _StackNumber extends StatelessWidget {
  final String number;

  const _StackNumber({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 16.0;
    const Color color = Colors.red;
    const Color textColor = Colors.white;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            color: textColor,
            fontSize: size * 0.75,
          ),
        ),
      ),
    );
  }
}
