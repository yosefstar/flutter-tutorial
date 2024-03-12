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
    final formKey = GlobalKey<FormState>();

    final nameController = TextEditingController(text: userInfo['name']);
    final ageController = TextEditingController(text: userInfo['age']);
    final birthdayController =
        TextEditingController(text: userInfo['birthday']);

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('登録'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _UserInfoTextField(
                  labelText: '名前',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '名前は必須です';
                    }
                    return null;
                  },
                ),
                _UserInfoTextField(
                  labelText: '年齢',
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '年齢は必須です';
                    }
                    if (int.tryParse(value) == null) {
                      return '年齢は数値である必要があります';
                    }
                    return null;
                  },
                ),
                _UserInfoTextField(
                  labelText: '誕生日',
                  controller: birthdayController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '誕生日は必須です';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // バリデーションが成功した場合のみ保存処理を実行
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
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: const Text('保存'),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
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

class _UserInfoTextField extends StatefulWidget {
  const _UserInfoTextField({
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  _UserInfoTextFieldState createState() => _UserInfoTextFieldState();
}

class _UserInfoTextFieldState extends State<_UserInfoTextField> {
  late FocusNode _focusNode;
  Color _labelColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _labelColor = _focusNode.hasFocus ? Colors.blue : Colors.grey;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: _labelColor),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      cursorColor: Colors.blue,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
    );
  }
}
