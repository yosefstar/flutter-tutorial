import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({super.key});

  @override
  AsyncPageState createState() => AsyncPageState();
}

class AsyncPageState extends State<AsyncPage> {
  final _userInfoStorage = _UserInfoStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, String>>(
        future: _userInfoStorage.loadUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('エラーが発生しました'));
          } else {
            final userInfo = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('名前: ${userInfo['name']}'),
                  Text('年齢: ${userInfo['age']}'),
                  Text('誕生日: ${userInfo['birthday']}'),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _userInfoStorage.loadUserInfo().then((userInfo) {
            _showEditDialog(context, userInfo);
          });
        },
        tooltip: '編集',
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, Map<String, String> userInfo) {
    final nameController = TextEditingController(text: userInfo['name']);
    final ageController = TextEditingController(text: userInfo['age']);
    final birthdayController =
        TextEditingController(text: userInfo['birthday']);

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('登録'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserInfoTextField(
                labelText: '名前',
                controller: nameController,
              ),
              UserInfoTextField(
                labelText: '年齢',
                controller: ageController,
                keyboardType: TextInputType.number,
              ),
              UserInfoTextField(
                labelText: '誕生日',
                controller: birthdayController,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                _userInfoStorage
                    .saveUserInfo(
                  nameController.text,
                  ageController.text,
                  birthdayController.text,
                )
                    .then((_) {
                  Navigator.of(context).pop();
                  setState(() {});
                });
              },
              child: const Text('保存'),
            ),
          ],
        );
      },
    );
  }
}

class UserInfoTextField extends StatelessWidget {
  const UserInfoTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: labelText),
      cursorColor: Colors.blue,
      controller: controller,
      keyboardType: keyboardType,
    );
  }
}

class _UserInfoStorage {
  Future<Map<String, String>> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name') ?? '未設定',
      'age': prefs.getString('age') ?? '未設定',
      'birthday': prefs.getString('birthday') ?? '未設定',
    };
  }

  Future<void> saveUserInfo(String name, String age, String birthday) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('age', age);
    await prefs.setString('birthday', birthday);
  }
}
