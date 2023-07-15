import 'package:flutter/material.dart';

import '../ui/widgets/videoCard.dart';

class Chemistry extends StatefulWidget {
  const Chemistry({super.key});

  @override
  State<Chemistry> createState() => _ChemistryState();
}

class _ChemistryState extends State<Chemistry> {
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