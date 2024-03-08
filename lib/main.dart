// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_tutorial/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IndexPage(),
    );
  }
}
