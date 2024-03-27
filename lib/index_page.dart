// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/animation/animation_page.dart';
import 'package:flutter_tutorial/building/building_layout_page.dart';
import 'package:flutter_tutorial/mercari/mercari_page.dart';
import 'package:flutter_tutorial/qiita/ui/qiita_page.dart';
import 'package:flutter_tutorial/residence/residence_page.dart';

// Project imports:
import 'package:flutter_tutorial/youtube/youtube_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

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
                  MaterialPageRoute<BuildingLayoutPage>(
                    builder: (context) => const BuildingLayoutPage(),
                  ),
                );
              },
              child: const Text('BuildingLayout'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<AnimationPage>(
                    builder: (context) => const AnimationPage(),
                  ),
                );
              },
              child: const Text('Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<YoutubePage>(
                    builder: (context) => const YoutubePage(),
                  ),
                );
              },
              child: const Text('Youtube'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<ResidencePage>(
                    builder: (context) => ResidencePage(),
                  ),
                );
              },
              child: const Text('Residence'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<MercariPage>(
                    builder: (context) => MercariPage(),
                  ),
                );
              },
              child: const Text('Residence'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<QiitaPage>(
                    builder: (context) => const QiitaPage(),
                  ),
                );
              },
              child: const Text('Qiita'),
            ),
          ],
        ),
      ),
    );
  }
}
