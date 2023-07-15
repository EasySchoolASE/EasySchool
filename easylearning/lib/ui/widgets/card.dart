import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class CardWidget extends StatelessWidget {
  final bool gradient;
  final bool button;
  final Color? color;
  final double? width;
  final double? height;
  final Widget child;
  final int? duration;
  final Border? border;
  // ignore: prefer_typing_uninitialized_variables
  final func;
  const CardWidget({super.key, 
    required this.gradient,
    required this.button,
    this.color,
    this.width,
    this.height,
    required this.child,
    this.duration,
    this.func,
    this.border,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const material.BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            offset: Offset(0, 10),
            color: Color(0x1A636363),
          ),
        ],
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: material.AnimatedContainer(
          duration: Duration(milliseconds: duration ?? 500),
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: border ??
                Border.all(
                  color: material.Colors.white,
                  width: 0,
                ),
            // borderRadius: BorderRadius.circular(10),
            color: color,
            gradient: gradient
                ? const LinearGradient(
                    colors: [Color.fromARGB(255, 56, 128, 222),Color.fromARGB(255, 80, 159, 223),Color.fromARGB(255, 80, 159, 223),Color.fromARGB(255, 116, 173, 222)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  )
                : const LinearGradient(colors: [
                      material.Colors.blue,
                      material.Colors.indigo,
                  ]),
          ),
          child: button
              ? ClipRRect(
                  borderRadius: material.BorderRadius.circular(10),
                  child: material.MaterialButton(
                    padding: material.EdgeInsets.zero,
                    elevation: 0,
                    onPressed: func,
                    child: child,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}