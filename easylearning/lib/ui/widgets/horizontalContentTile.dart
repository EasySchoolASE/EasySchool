

import 'package:flutter/material.dart';

import 'imageRender.dart';

class HorizontalContentTile extends StatefulWidget {
  final bool verticalScroll;
  final Function updateContent;

  HorizontalContentTile({required this.verticalScroll, required this.updateContent});

  @override
  State<HorizontalContentTile> createState() => _HorizontalContentTileState();
}

class _HorizontalContentTileState extends State<HorizontalContentTile> {
  String dayTime = 'morning';
  var now = DateTime.now();
  double selfcareItemBorderRadius = 6;

  getTodayTimeString() {
    if (now.hour >= 3 && now.hour < 12) {
      dayTime = 'morning';
    } else if (now.hour >= 12 && now.hour < 17) {
      dayTime = 'afternoon';
    } else if (now.hour >= 17 || now.hour < 3) {
      dayTime = 'evening';
    }
  }

  @override
  void initState() {
    getTodayTimeString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: widget.verticalScroll ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: height * 0.14,
                height: height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(selfcareItemBorderRadius),
                  border: Border.all(color: Colors.indigo, width: 0.8),
                ),
                // margin: EdgeInsets.symmetric(horizontal: 12),
                child: ImageRenderer(
                  imageUrl: "",
                  radius: selfcareItemBorderRadius,
                  fit: BoxFit.cover,
                  fallbackIcon: Icons.file_download_off_rounded,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                  "hello",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                    "text 2",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.72,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                        "text",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
