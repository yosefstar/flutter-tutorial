// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/animation/animation_page.dart';
import 'package:flutter_tutorial/building/building_layout_page.dart';
import 'package:flutter_tutorial/mercari/mercari_page.dart';
import 'package:flutter_tutorial/residence/residence_page.dart';

// Project imports:
import 'package:flutter_tutorial/youtube/youtube_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  MaterialPageRoute(
                      builder: (context) => const AnimationPage()),
                );
              },
              child: const Text('Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YoutubePage()),
                );
              },
              child: const Text('Youtube'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResidencePage()),
                );
              },
              child: const Text('Residence'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MercariPage()),
                );
              },
              child: const Text('Mercari'),
            ),
          ],
        ),
      ),
    );
  }
}
