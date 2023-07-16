import 'package:flutter/material.dart';

import '../ui/widgets/videoCard.dart';

class Physics extends StatefulWidget {
  const Physics({super.key});

  @override
  State<Physics> createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
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