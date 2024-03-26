// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/mercari/ui/product_data_state.dart';
import 'product_view_model.dart'; // productDataListProviderを含むファイルをインポート

class MercariPage extends ConsumerWidget {
  const MercariPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // productDataListProviderからデータを非同期に取得
    final productListAsyncValue = ref.watch(productDataListProvider);

    return Scaffold(
      body: ColoredBox(
        color: _CustomColors.lightGrey,
        child: productListAsyncValue.when(
          data: (productList) => ListView.builder(
            itemCount: productList.length + 3, // ヘッダー部分を考慮して+3
            itemBuilder: (context, index) {
              if (index == 0) {
                return const _MainPhoto(); // 最初のアイテム
              } else if (index == 1) {
                return const _ShortCutCardList(); // 2番目のアイテム
              } else if (index == 2) {
                return const _PostingDataHeadBar(); // 3番目のアイテム
              } else {
                // productListからデータを取得して表示
                final data = productList[index - 3];
                return _PostingItem(data: data);
              }
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
      bottomNavigationBar: const _CustomBottomNavigationBar(),
    );
  }
}

class _CustomColors {
  static const Color lightRed = Color(0xffff5252);
  static const Color lightBlue = Color(0xff2196f3);
  static const Color lightGrey = Color(0xFFEAEAE9);
}

class PostingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostingAppBar({super.key});

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

class _MainPhoto extends StatelessWidget {
  const _MainPhoto();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Image.asset('images/photo_mercari.png', fit: BoxFit.cover),
    );
  }
}

class _ShortCutCardList extends StatelessWidget {
  const _ShortCutCardList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('出品へのショートカット'),
          SizedBox(height: 4),
          Row(
            children: [
              _ShortCutCard(
                text: '写真を撮る',
                iconData: Icons.camera_alt_outlined,
              ),
              SizedBox(width: 8),
              _ShortCutCard(
                text: 'アルバム',
                iconData: Icons.image,
              ),
              SizedBox(width: 8),
              _ShortCutCard(
                text: 'バーコード',
                text2: '（本・コスメ）',
                iconData: Icons.qr_code,
              ),
              SizedBox(width: 8),
              _ShortCutCard(
                text: '下書き一覧',
                iconData: Icons.content_paste_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShortCutCard extends StatelessWidget {
  const _ShortCutCard({
    required this.text,
    this.text2,
    required this.iconData,
  });
  final String text;
  final String? text2; // オプショナルなパラメータとしてtext2を追加
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    // 画面の幅を取得
    final screenWidth = MediaQuery.sizeOf(context);

    // 画面の幅に基づいてフォントサイズを計算
    var fontSize = 11.0; // デフォルトのフォントサイズ
    if (screenWidth.width > 600) {
      fontSize = 13.0; // より大きなフォントサイズ
    } else if (screenWidth.width > 400) {
      fontSize = 12.0; // 中間のフォントサイズ
    }

    return Expanded(
      child: SizedBox(
        height: 112,
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 34,
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
                if (text2 != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    text2!,
                    style: TextStyle(fontSize: fontSize),
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

class _PostingDataHeadBar extends StatelessWidget {
  const _PostingDataHeadBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: const Row(
        children: [
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '売れやすい持ち物',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '使わないものを出品してみよう！',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          Text(
            'すべてを見る＞',
            style: TextStyle(
              color: _CustomColors.lightBlue,
              fontSize: 14,
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}

class Product {
  Product({
    required this.produceImageUrl1,
    required this.productName,
    required this.priceJPY,
    required this.numberOfSearcher,
  });
  final String produceImageUrl1;
  final String productName;
  final int priceJPY;
  final int numberOfSearcher;
}

class _PostingItem extends StatelessWidget {
  // _Product から ProductData へ変更

  const _PostingItem({required this.data});
  final ProductData data;

  @override
  Widget build(BuildContext context) {
    return _PostingDataListView(
      productImageUrl1: data.productImageUrl1,
      productName: data.productName,
      priceJPY: data.priceJPY,
      numberOfSearcher: data.numberOfSearcher,
    );
  }
}

class _PostingDataListView extends StatelessWidget {
  const _PostingDataListView({
    required this.productImageUrl1,
    required this.productName,
    required this.priceJPY,
    required this.numberOfSearcher,
  });
  final String productImageUrl1;
  final String productName;
  final int priceJPY;
  final int numberOfSearcher;

  @override
  Widget build(BuildContext context) {
    const fontSize = 14.0;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Row(
              children: [
                SizedBox(
                  width: 72,
                  height: 72,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      productImageUrl1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: fontSize,
                      ),
                    ),
                    Text(
                      '¥${priceJPY.toDouble().toStringAsFixed(1)}',
                      style: const TextStyle(
                        fontSize: fontSize,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          color: _CustomColors.lightBlue,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$numberOfSearcher人が探しています',
                          style: const TextStyle(
                            fontSize: fontSize, // fontSize を使用
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const _PostingButton(), // 出品するボタン
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostingButton extends StatelessWidget {
  const _PostingButton();

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: _CustomColors.lightRed, // 赤い背景色を設定
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          '出品する',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PostingFloatingActionButton extends StatelessWidget {
  const PostingFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FloatingActionButton(
        backgroundColor: _CustomColors.lightRed,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_camera_outlined, color: Colors.white, size: 28),
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
    // 画面の幅に基づいてフォントサイズを決定
    final screenSize = MediaQuery.sizeOf(context);
    double fontSize;
    if (screenSize.width > 600) {
      fontSize = 13.0; // 大きな画面の場合は大きなフォントサイズ
    } else if (screenSize.width > 400) {
      fontSize = 12.0; // 中間の画面サイズの場合は中間のフォントサイズ
    } else {
      fontSize = 11.0; // 小さな画面の場合は小さなフォントサイズ
    }

    return BottomNavigationBar(
      items: [
        createBottomNavItem(
          iconData: Icons.home,
          label: 'ホーム',
          stackNumber: 5,
        ),
        createBottomNavItem(
          iconData: Icons.notifications_none_outlined,
          label: 'お知らせ',
        ),
        createBottomNavItem(
          iconData: Icons.photo_camera_outlined,
          label: '出品',
        ),
        createBottomNavItem(
          iconData: Icons.add_comment_outlined,
          label: 'メッセージ',
        ),
        createBottomNavItem(
          iconData: Icons.account_circle,
          label: 'マイページ',
        ),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: _CustomColors.lightBlue,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: fontSize, // レスポンシブなフォントサイズを使用
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: fontSize, // レスポンシブなフォントサイズを使用
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

BottomNavigationBarItem createBottomNavItem({
  required IconData iconData,
  required String label,
  double iconSize = 36.0,
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
        SizedBox(width: 48, height: 48, child: Icon(iconData, size: iconSize)),
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

class _StackNumber extends StatelessWidget {
  const _StackNumber({
    required this.number,
  });
  final String number;

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.red;
    const textColor = Colors.white;

    return Container(
      width: 16,
      height: 16,
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
            fontSize: 16 * 0.75,
          ),
        ),
      ),
    );
  }
}
