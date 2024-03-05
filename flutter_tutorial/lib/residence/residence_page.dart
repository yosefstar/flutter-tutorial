// Flutter imports:
import 'package:flutter/material.dart';

class ResidencePage extends StatelessWidget {
  const ResidencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: SizedBox(
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
        color: CustomColors.deepGreen, // 戻るボタンの色をカスタムカラーに設定
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
        borderRadius: BorderRadius.circular(25.0), // 角の丸みを調整
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            color: CustomColors.deepGreen, // テキストの色をカスタムカラーに設定
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
            color: Colors.black.withOpacity(0.2), // 影の色
            spreadRadius: 0.1, // 影の範囲
            blurRadius: 2, // ぼかしの量
            offset: const Offset(2, 2), // 影の位置
          ),
        ],
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            color: textColor,
            fontSize: size * 0.75, // Adjust font size based on container size
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
      width: 48.0, // アイコンよりも大きい幅
      height: 48.0, // アイコンよりも大きい高さ
      child: Align(
        alignment: Alignment.center,
        child: Icon(iconData, size: iconSize), // アイコンを中央に配置
      ),
    );
    if (stackNumber != null && stackNumber != 0) {
      icon = Stack(
        children: [
          SizedBox(
              width: 48.0, // アイコンよりも大きい幅
              height: 48.0,
              child: Icon(iconData, size: iconSize)),
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
