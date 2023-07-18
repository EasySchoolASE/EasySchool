import 'package:easylearning/ui/widgets/card.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoCard extends material.StatelessWidget {
  final bool long;
  const VideoCard({
    required this.long,
    material.Key? key,
  }) : super(key: key);
  
  //video card added
  @override
  material.Widget build(material.BuildContext context) {
    return material.Padding(
      padding: const material.EdgeInsets.all(10.0),
      child: CardWidget(
        gradient: true,
        button: true,
        width:  180,
        height: 200,
        child: Column(
          mainAxisAlignment: material.MainAxisAlignment.start,
          children: <material.Widget>[
            material.Container(
              width: 180,
              height: 100,
              decoration: const material.BoxDecoration(
                image: material.DecorationImage(
                    image: material.AssetImage('assets/images/logo.png'),
                    fit: material.BoxFit.cover),
                borderRadius: material.BorderRadius.only(
                  topLeft: material.Radius.circular(10),
                  topRight: material.Radius.circular(10),
                ),
              ),
              child: const material.Text(""),
            ),
            const material.Padding(
              padding: material.EdgeInsets.all(8.0),
              child: material.Text(
                "Stars - What are they made up of ?",
                overflow: material.TextOverflow.ellipsis,
                maxLines: 2,
                style: material.TextStyle(
                    color: Colors.white,
                    fontFamily: 'Red Hat Display',
                    fontSize: 16),
              ),
            ),
            const material.Padding(
              padding: material.EdgeInsets.symmetric(horizontal: 8.0),
              child: material.Row(
                children: <material.Widget>[
                  material.Icon(FontAwesomeIcons.chartBar, size: 16,color: Colors.white,),
                  material.Text(
                    "Beginner",
                    style: material.TextStyle(
                        color: Colors.white,
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  material.Spacer(),
                  material.Text(
                    "12 mins  ",
                    style: material.TextStyle(
                        color: Colors.white,
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  material.Icon(FontAwesomeIcons.clock, size: 16,color: Colors.white,),
                ],
              ),
            ),
            material.Padding(
              padding: const material.EdgeInsets.only(top: 0),
              child: material.GestureDetector(
                child: material.Container(
                  padding: const material.EdgeInsets.fromLTRB(0, 14, 0, 14),
                  // decoration: material.BoxDecoration(gradient: Colors.),
                  child: const material.Row(
                    mainAxisAlignment: material.MainAxisAlignment.spaceEvenly,
                    children: <material.Widget>[
                      material.Icon(FontAwesomeIcons.play,
                          color: material.Colors.white),
                      material.Text(
                        "Watch Lecture",
                        style: material.TextStyle(
                            color: material.Colors.white,
                            fontFamily: 'Red Hat Display',
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => VideoPage(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
