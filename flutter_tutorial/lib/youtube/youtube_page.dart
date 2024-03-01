// Flutter imports:
import 'package:flutter/material.dart';

class YoutubePage extends StatelessWidget {
  const YoutubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

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
