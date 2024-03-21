// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/residence/ui/residence_data_state.dart';
import 'package:flutter_tutorial/residence/ui/residence_view_model.dart';
import 'package:intl/intl.dart';

class ResidencePage extends ConsumerWidget {
  // ConsumerWidgetに変更
  const ResidencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchを使用してresidenceDataListProviderをリッスン
    final residenceDataListAsyncValue = ref.watch(residenceDataListProvider);

    return Scaffold(
      appBar: const _CustomAppBar(),
      body: residenceDataListAsyncValue.when(
        data: (residenceDataList) => ListView.builder(
          itemCount: residenceDataList.length + 1, // SearchFilterBarのために調整
          itemBuilder: (context, index) {
            if (index == 0) {
              return const _SearchFilterBar();
            } else {
              final residenceData = residenceDataList[index - 1];
              return _ResidenceDataDisplay(
                residenceData: residenceData,
              );
            }
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: const _SearchFloatingActionButton(),
      bottomNavigationBar: const _CustomBottomNavigationBar(),
    );
  }
}

class _CustomColors {
  static const Color deepGreen = Color(0xff26a69a);
  static const Color lightBeige = Color(0xFFBDBBBA);
  static const Color lightGrey = Color(0xffefebe9);
  static const Color lighterGrey = Color(0xffeeeeee);
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: _CustomColors.deepGreen,
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
            size: 40,
            color: _CustomColors.deepGreen,
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
  const _CustomCard({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _CustomColors.lighterGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          text,
          style: const TextStyle(
            color: _CustomColors.deepGreen,
          ),
        ),
      ),
    );
  }
}

class _StackNumber extends StatelessWidget {
  const _StackNumber({
    required this.number,
  });
  final String number;

  @override
  Widget build(BuildContext context) {
    const size = 16.0;
    const Color color = Colors.red;
    const textColor = Colors.white;

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

class _SearchFilterBar extends StatelessWidget {
  const _SearchFilterBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // 影の色
            spreadRadius: 0.1, // 影の広がり
            blurRadius: 5, // ぼかしの量
            offset: const Offset(0, 1), // 影の方向と距離
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: const Row(
              children: [
                SizedBox(width: 8),
                Text(
                  'カウルのおすすめ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '新着3件',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                Spacer(),
                Text(
                  '編集',
                  style: TextStyle(
                    fontSize: 14,
                    color: _CustomColors.deepGreen,
                  ),
                ),
                Icon(Icons.edit, color: _CustomColors.deepGreen, size: 20),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: _CustomColors.lightGrey,
              borderRadius: BorderRadius.circular(8), // 角を丸くする
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.train,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '東京駅・品川駅・川崎駅・横浜駅・目黒駅',
                      style: TextStyle(
                        fontSize: 14,
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
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '下限なし〜2000万円',
                          style: TextStyle(
                            fontSize: 14,
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
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '東京駅・品川駅・川崎駅・横浜駅・目黒駅',
                          style: TextStyle(
                            fontSize: 14,
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

class _ResidenceDataDisplay extends StatelessWidget {
  const _ResidenceDataDisplay({
    required this.residenceData,
  });
  final ResidenceData residenceData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
            children: [
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                    ),
                    child: Image.network(
                      residenceData.imageUrl1, // ここを修正
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
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      residenceData.imageUrl2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    residenceData.text1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${NumberFormat("#,###").format(residenceData.number)}万円',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  _IconTextRow(
                    iconData: Icons.train,
                    text: residenceData.text2,
                  ),
                  const SizedBox(height: 4),
                  _IconTextRow(
                    iconData: Icons.monetization_on,
                    text: residenceData.text3,
                  ),
                  const SizedBox(height: 4),
                  _IconTextRow(
                    iconData: Icons.info_outline,
                    text: residenceData.text4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _CustomColors.lightBeige,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: _CustomColors.lightBeige),
                        SizedBox(width: 8),
                        Text('興味なし'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _CustomColors.lightBeige,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: _CustomColors.lightBeige,
                        ),
                        SizedBox(width: 8),
                        Text('お気に入り'),
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

class _IconTextRow extends StatelessWidget {
  const _IconTextRow({
    required this.iconData,
    required this.text,
  });
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    const iconSize = 18.0;
    const textStyle = TextStyle(fontSize: 14);

    return Row(
      children: [
        Icon(iconData, size: iconSize),
        const SizedBox(width: 8),
        Text(text, style: textStyle),
      ],
    );
  }
}

class _SearchFloatingActionButton extends StatelessWidget {
  const _SearchFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        backgroundColor: _CustomColors.deepGreen,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, color: Colors.white, size: 32),
            Text(
              '物件',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
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
        createBottomNavItem(
          iconData: Icons.home,
          label: 'ホーム',
        ),
        createBottomNavItem(
          iconData: Icons.favorite_border,
          label: 'お気に入り',
        ),
        createBottomNavItem(
          iconData: Icons.message,
          label: 'メッセージ',
          stackNumber: 1,
        ),
        createBottomNavItem(
          iconData: Icons.person_outline,
          label: 'マイページ',
        ),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: _CustomColors.deepGreen,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

BottomNavigationBarItem createBottomNavItem({
  required IconData iconData,
  required String label,
  double iconSize = 30.0,
  int? stackNumber,
}) {
  Widget icon = SizedBox(
    width: 48,
    height: 48,
    child: Align(
      child: Icon(iconData, size: iconSize),
    ),
  );
  if (stackNumber != null && stackNumber > 0) {
    icon = Stack(
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: Align(
            child: Icon(iconData, size: iconSize),
          ),
        ),
        Positioned(
          right: 0,
          top: 5,
          child: _StackNumber(number: '$stackNumber'),
        ),
      ],
    );
  }
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
  );
}
