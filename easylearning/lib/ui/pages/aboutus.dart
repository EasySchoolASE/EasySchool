import 'package:easylearning/ui/widgets/largeCard.dart';
import 'package:easylearning/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("About us"),
          centerTitle: true,
        ),
      drawer: const NavBar(),
      body:
      Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            const SizedBox(height: 30,),
            LargeCard(title: const Text("Our Mission and Impact",
             textAlign: TextAlign.center,
             ), 
             subTitle: GradientText("Easy access to high quality education.       ",
             textAlign: TextAlign.center,
             colors: const [Color.fromARGB(255, 222, 226, 227),Color.fromARGB(255, 203, 203, 253)],)),
            const SizedBox(height: 5,),
            LargeCard(title:const Text("Our Vision",textAlign: TextAlign.center,), 
             subTitle: GradientText("To become the largest e-learning ecosystem.            ",
             textAlign: TextAlign.center,
             colors: const [Color.fromARGB(255, 222, 226, 227),Color.fromARGB(255, 203, 203, 253)],)),
            const SizedBox(height: 5,),
            LargeCard(title:const Text("Our Team",textAlign: TextAlign.center,), 
             subTitle: GradientText("To become the largest e-learning ecosystem.",
             textAlign: TextAlign.center,
             colors: const [Color.fromARGB(255, 222, 226, 227),Color.fromARGB(255, 203, 203, 253)],))
            ],
      ));
  }
}