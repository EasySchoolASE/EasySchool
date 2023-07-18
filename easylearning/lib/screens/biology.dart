import 'package:flutter/material.dart';

import '../ui/widgets/videoCard.dart';

class biology extends StatefulWidget {
  const biology({super.key});

  @override
  State<biology> createState() => _biologyState();
}

class _biologyState extends State<biology> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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