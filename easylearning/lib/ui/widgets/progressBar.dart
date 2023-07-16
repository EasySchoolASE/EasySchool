import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double downloadProgress;
  final Color color;

  ProgressBar({required this.downloadProgress, this.color = Colors.redAccent});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: downloadProgress,
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(
          color,
        ),
      ),
    );
  }
}
