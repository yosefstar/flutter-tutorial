// Flutter imports:
import 'package:flutter/material.dart';

class ResidencePage extends StatelessWidget {
  const ResidencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ResidenceListView(),
      floatingActionButton: CustomFloatingActionButton(),
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

class CustomData {
  final String imageUrl1;
  final String imageUrl2;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final int number;

  CustomData({
    required this.imageUrl1,
    required this.imageUrl2,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.number,
  });
}

class ResidenceListView extends StatelessWidget {
  // テストデータのリストを作成
  final List<CustomData> dataList = [
    CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'テキスト1',
      text2: 'テキスト2',
      text3: 'テキスト3',
      text4: 'テキスト4',
      number: 5,
    ),
    // 以下、同様にデータを4つ追加して合計5つのデータを用意
    // 例:
    CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'テキスト5',
      text2: 'テキスト6',
      text3: 'テキスト7',
      text4: 'テキスト8',
      number: 10,
    ),
    CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'テキスト5',
      text2: 'テキスト6',
      text3: 'テキスト7',
      text4: 'テキスト8',
      number: 10,
    ),
    CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'テキスト5',
      text2: 'テキスト6',
      text3: 'テキスト7',
      text4: 'テキスト8',
      number: 10,
    ),
    CustomData(
      imageUrl1:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      imageUrl2:
          'http://flat-icon-design.com/f/f_object_164/s512_f_object_164_0bg.png',
      text1: 'テキスト5',
      text2: 'テキスト6',
      text3: 'テキスト7',
      text4: 'テキスト8',
      number: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length + 1, // SearchFilterBarを含めるために+1します
      itemBuilder: (context, index) {
        if (index == 0) {
          // 最初のアイテムとしてSearchFilterBarを表示
          return const SearchFilterBar();
        }
        // indexを1減らして、0番目をSearchFilterBarにしたことを調整
        final data = dataList[index - 1];
        return CustomDataDisplayWidget(
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

class CustomDataDisplayWidget extends StatelessWidget {
  final String imageUrl1;
  final String imageUrl2;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final int number;

  const CustomDataDisplayWidget({
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(imageUrl1, width: 100, height: 100),
              Image.network(imageUrl2, width: 100, height: 100),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1),
                Text(text2),
                Text(text3),
                Text(text4),
                Text('Number: $number'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Containerの背景色
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // 影の色
            spreadRadius: 0.1, // 影の広がり
            blurRadius: 5, // ぼかしの量
            offset: Offset(0, 1), // 影の方向と距離
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'テスト',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'テスト',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'テスト',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffefebe9),
                borderRadius: BorderRadius.circular(8.0), // 角を丸くする
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'テスト',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'テスト',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'テスト',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'テスト',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'テスト',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'テスト',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: CustomColors.deepGreen,
      ),
      title: const Row(
        children: [
          CustomCard(text: 'おすすめ'),
          Stack(
            children: [
              CustomCard(text: 'リフォーム'),
              Positioned(
                right: 0,
                top: 0,
                child: StackNumber(number: '1'),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.add_circle,
            size: 40.0,
            color: CustomColors.deepGreen,
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

class CustomColors {
  static const Color deepGreen = Color(0xff26a69a);
}

class CustomCard extends StatelessWidget {
  final String text;
  const CustomCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffeeeeee),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            color: CustomColors.deepGreen,
          ),
        ),
      ),
    );
  }
}

class StackNumber extends StatelessWidget {
  final String number;

  const StackNumber({
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

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavItemFactory.createItem(iconData: Icons.home, label: 'ホーム'),
        BottomNavItemFactory.createItem(
            iconData: Icons.favorite_border, label: 'お気に入り'),
        BottomNavItemFactory.createItem(
            iconData: Icons.message, label: 'メッセージ', stackNumber: 1),
        BottomNavItemFactory.createItem(
            iconData: Icons.person_outline, label: 'マイページ'),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: CustomColors.deepGreen,
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
            child: StackNumber(number: "$stackNumber"),
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

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      width: 70.0,
      child: FloatingActionButton(
        backgroundColor: CustomColors.deepGreen,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, color: Colors.white, size: 32.0),
            Text('物件',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
