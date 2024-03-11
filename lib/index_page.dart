// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_tutorial/youtube/youtube_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
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
      ),
    );
  }
}
