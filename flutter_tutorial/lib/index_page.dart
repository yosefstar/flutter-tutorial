// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/building/building_layout_page.dart';
import 'package:flutter_tutorial/residence/residence_page.dart';
import 'package:flutter_tutorial/youtube/youtube_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BuildingLayoutPage()),
                );
              },
              child: const Text('BuildingLayout'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const YoutubePage()),
                );
              },
              child: const Text('Youtube'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResidencePage()),
                );
              },
              child: const Text('Residence'),
            ),
          ],
        ),
      ),
    );
  }
}
