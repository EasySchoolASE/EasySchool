import 'package:flutter/material.dart';

import '../ui/widgets/videoCard.dart';

class MathsPage extends StatefulWidget {
  const MathsPage({super.key});

  @override
  State<MathsPage> createState() => _MathsPageState();
}

class _MathsPageState extends State<MathsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const VideoCard(long: false);
                },
              ),
            ),
          );
  }
}