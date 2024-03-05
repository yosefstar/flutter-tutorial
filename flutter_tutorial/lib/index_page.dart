// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/residence/residence_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResidencePage()),
            );
          },
          child: const Text('Residence'),
        ),
      ),
    );
  }
}
