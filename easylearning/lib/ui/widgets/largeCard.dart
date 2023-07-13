import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LargeCard extends StatelessWidget {
  final Text title;
  final GradientText subTitle;
  const LargeCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 20,
        child: Container(
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color.fromARGB(255, 9, 43, 87), Color.fromARGB(255, 80, 159, 223)]),
          ),
          child: ListTile(
            title: title,
            subtitle: subTitle,
            titleTextStyle: GoogleFonts.rubikDirt(
            fontSize: 30, 
            fontWeight: FontWeight.w500, 
            color: Colors.white,
            ),
            subtitleTextStyle: const TextStyle(fontSize: 22, 
            fontWeight: FontWeight.w500, 
            color: Colors.white,
            ),
          ),
        )
      );
  }
}