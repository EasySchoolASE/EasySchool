import 'package:easylearning/screens/quiz.dart';
import 'package:easylearning/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSubjects extends StatefulWidget {
  const QuizSubjects({super.key});

  @override
  State<QuizSubjects> createState() => _QuizSubjectsState();
}

class _QuizSubjectsState extends State<QuizSubjects> {

  List<String> subjects=["Maths","Physics","Chemsitry","Biology"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Select Subject"),
      ),
      drawer: const NavBar(),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder:(BuildContext context, int index){
          return 
          Container(
            margin: const EdgeInsets.all(10),
            child: 
          ElevatedButton(onPressed: (){
             Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => QuizApp(subject:index==0?"Math":index==1?"Physics":index==2?"Chemistry":"Biology")));
          }, child: Text(subjects[index],
          style: GoogleFonts.rubikDirt(
          fontSize: 40, 
          fontWeight: FontWeight.w500, 
          color: Colors.white,
          ),
          )));
        } ),
    );
  }
}