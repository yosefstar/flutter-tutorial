import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({super.key});

  @override
  AsyncPageState createState() => AsyncPageState();
}

class AsyncPageState extends State<AsyncPage> {
  String _name = '未設定';
  String _age = '未設定';
  String _birthday = '未設定';
  final _userInfoStorage = _UserInfoStorage();

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final userInfo = await _userInfoStorage.loadUserInfo();
    setState(() {
      _name = userInfo['name']!;
      _age = userInfo['age']!;
      _birthday = userInfo['birthday']!;
    });
  }

  void _showEditDialog() {
    showEditDialog(context, _name, _age, _birthday, (name, age, birthday) {
      _userInfoStorage
          .saveUserInfo(name, age, birthday)
          .then((_) => _loadUserInfo());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('名前: $_name'),
            Text('年齢: $_age'),
            Text('誕生日: $_birthday'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showEditDialog,
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

void showEditDialog(
  BuildContext context,
  String name,
  String age,
  String birthday,
  void Function(String, String, String) onSave,
) {
  showDialog<void>(
    context: context,
    builder: (context) => _EditDialog(
      name: name,
      age: age,
      birthday: birthday,
      onSave: onSave,
    ),
  );
}

class _EditDialog extends StatelessWidget {
  const _EditDialog({
    required this.name,
    required this.age,
    required this.birthday,
    required this.onSave,
  });
  final String name;
  final String age;
  final String birthday;
  final void Function(String, String, String) onSave;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name);
    final ageController = TextEditingController(text: age);
    final birthdayController = TextEditingController(text: birthday);

    return AlertDialog(
      title: const Text('登録'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: '名前'),
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: '年齢'),
            controller: ageController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: const InputDecoration(labelText: '誕生日'),
            controller: birthdayController,
          ),
        ],
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
            onSave(
              nameController.text,
              ageController.text,
              birthdayController.text,
            );
            Navigator.of(context).pop();
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
  }
}
