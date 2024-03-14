// Flutter imports:
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResidencePage extends StatelessWidget {
  const ResidencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _CustomAppBar(),
      body: _ResidenceListView(),
      floatingActionButton: const _CustomFloatingActionButton(),
      bottomNavigationBar: const _CustomBottomNavigationBar(),
    );
  }
}

class _CustomColors {
  static const Color green1 = Color(0xff26a69a);
  static const Color primaryColor = green1;
  static const Color grey1 = Color(0xFFBDBBBA);
  static const Color grey2 = Color(0xffefebe9);
  static const Color grey3 = Color(0xffeeeeee);
  static const Color black = Color(0xffeeeeee);
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: _CustomColors.primaryColor,
      ),
      title: const Row(
        children: [
          _CustomCard(text: 'おすすめ'),
          Stack(
            children: [
              _CustomCard(text: 'リフォーム'),
              Positioned(
                right: 0,
                top: 0,
                child: _StackNumber(number: '1'),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.add_circle,
            size: 40.0,
            color: _CustomColors.primaryColor,
          ),
        ],
      ),
      elevation: 2,
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomCard extends StatelessWidget {
  final String text;
  const _CustomCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _CustomColors.grey3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            color: _CustomColors.primaryColor,
          ),
        ),
      ),
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
      decoration: const BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: _CustomColors.black,
            spreadRadius: 0.1,
            blurRadius: 2,
            offset: Offset(2, 2),
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
  final String imageUrl2;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final int number;

  _CustomData({
    required this.imageUrl1,
    required this.imageUrl2,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.number,
  });
}

class _ResidenceListView extends StatelessWidget {
  // テストデータのリストを作成
  final List<_CustomData> dataList = [
    _CustomData(
      imageUrl1:
          'https://thumb.photo-ac.com/e8/e84d3dd4bf93d46b76ee4452e8ab2332_t.jpeg',
      imageUrl2:
          'https://www.homes.co.jp/cont/wp-content/uploads/cont/83258/img/1.png',
      text1: 'Rising place 川崎',
      text2: '京線本線 京急川崎駅 より 徒歩9分',
      text3: '1K / 21.24㎡ 南西向き',
      text4: '2階/15階建 築5年',
      number: 2000,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_174/s512_f_object_174_0bg.png',
      text1: 'Sunny Apartments 渋谷',
      text2: '山手線 渋谷駅 より 徒歩5分',
      text3: '2LDK / 35.75㎡ 南向き',
      text4: '6階/20階建 築3年',
      number: 5000,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'Harmony Tower 新宿',
      text2: '中央線 新宿駅 より 徒歩7分',
      text3: '1LDK / 25.50㎡ 東向き',
      text4: '10階/25階建 築2年',
      number: 4500,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'Green Residence 池袋',
      text2: '有楽町線 池袋駅 より 徒歩10分',
      text3: '1R / 20.10㎡ 西向き',
      text4: '5階/15階建 築1年',
      number: 3000,
    ),
    _CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'Blue Ocean 横浜',
      text2: 'みなとみらい線 横浜駅 より 徒歩8分',
      text3: '3DK / 45.60㎡ 北向き',
      text4: '8階/30階建 築4年',
      number: 6000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length + 1, // SearchFilterBarを含めるために+1します
      itemBuilder: (context, index) {
        if (index == 0) {
          // 最初のアイテムとしてSearchFilterBarを表示
          return const _SearchFilterBar();
        }
        // indexを1減らして、0番目をSearchFilterBarにしたことを調整
        final data = dataList[index - 1];
        return _CustomDataDisplayWidget(
          imageUrl1: data.imageUrl1,
          imageUrl2: data.imageUrl2,
          text1: data.text1,
          text2: data.text2,
          text3: data.text3,
          text4: data.text4,
          number: data.number,
        );
      },
    );
  }
}

class _SearchFilterBar extends StatelessWidget {
  const _SearchFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: _CustomColors.black, // 影の色
            spreadRadius: 0.1, // 影の広がり
            blurRadius: 5, // ぼかしの量
            offset: Offset(0, 1), // 影の方向と距離
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: const Row(
              children: [
                SizedBox(width: 8.0),
                Text(
                  'カウルのおすすめ',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '新着3件',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red,
                  ),
                ),
                Spacer(),
                Text(
                  '編集',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: _CustomColors.primaryColor,
                  ),
                ),
                Icon(Icons.edit, color: _CustomColors.primaryColor, size: 20.0),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: _CustomColors.grey2,
              borderRadius: BorderRadius.circular(8.0), // 角を丸くする
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.train,
                      size: 18.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '東京駅・品川駅・川崎駅・横浜駅・目黒駅',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.monetization_on,
                          size: 18.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '下限なし〜2000万円',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 18.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '東京駅・品川駅・川崎駅・横浜駅・目黒駅',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomDataDisplayWidget extends StatelessWidget {
  final String imageUrl1;
  final String imageUrl2;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final int number;

  const _CustomDataDisplayWidget({
    Key? key,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: _CustomColors.black,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                    ),
                    child: Image.network(
                      imageUrl1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.network(
                      imageUrl2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${NumberFormat("#,###").format(number)}万円',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  _IconWithTextLabel(
                    iconData: Icons.train,
                    text: text2,
                  ),
                  const SizedBox(height: 4),
                  _IconWithTextLabel(
                    iconData: Icons.monetization_on,
                    text: text3,
                  ),
                  const SizedBox(height: 4),
                  _IconWithTextLabel(
                    iconData: Icons.info_outline,
                    text: text4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: _CustomColors.grey1, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: _CustomColors.grey1),
                        SizedBox(width: 8),
                        Text("興味なし"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: _CustomColors.grey1, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border_outlined,
                            color: _CustomColors.grey1),
                        SizedBox(width: 8),
                        Text("お気に入り"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconWithTextLabel extends StatelessWidget {
  final IconData iconData;
  final String text;

  const _IconWithTextLabel({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 18.0;
    const TextStyle textStyle = TextStyle(fontSize: 14.0);

    return Row(
      children: [
        Icon(iconData, size: iconSize),
        const SizedBox(width: 8.0),
        Text(text, style: textStyle),
      ],
    );
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      width: 70.0,
      child: FloatingActionButton(
        backgroundColor: _CustomColors.primaryColor,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, color: Colors.white, size: 32.0),
            Text(
              '物件',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
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
        _BottomNavItemFactory.createItem(iconData: Icons.home, label: 'ホーム'),
        _BottomNavItemFactory.createItem(
            iconData: Icons.favorite_border, label: 'お気に入り'),
        _BottomNavItemFactory.createItem(
            iconData: Icons.message, label: 'メッセージ', stackNumber: 1),
        _BottomNavItemFactory.createItem(
            iconData: Icons.person_outline, label: 'マイページ'),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: _CustomColors.primaryColor,
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

class _BottomNavItemFactory {
  static BottomNavigationBarItem createItem({
    required IconData iconData,
    required String label,
    double iconSize = 30.0,
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
