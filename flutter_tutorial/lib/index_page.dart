// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/mercari/mercari_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MercariPage()),
            );
          },
          child: const Text('Mercari'),
        ),
      ),
    );
  }
}
