import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easylearning/Model/quizModel.dart';
import 'package:easylearning/screens/quiz_screen.dart';
import 'package:easylearning/screens/result.dart';
import 'package:easylearning/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  final String subject;
  const QuizApp({super.key, required this.subject});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  @override
  void initState(){
    getData();
    super.initState();
  }

  List list=[];
  List _questions=[];    
  //function to get data
  void getData() async {
     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection(widget.subject).get();
     for(int i=0;i<snapshot.docs.length;i++){
      print(snapshot.docs[i].data());
      list.add(snapshot.docs[i].data());
     }
     _questions=list;
     print(_questions);
     setState(() {});
  }

//   final _questions = const [
// 	{
// 	'questionText': 'Q1. Who created Flutter?',
// 	'answers': [
// 		{'text': 'Facebook', 'score': -2},
// 		{'text': 'Adobe', 'score': -2},
// 		{'text': 'Google', 'score': 10},
// 		{'text': 'Microsoft', 'score': -2},
// 	],
// 	},
// 	{
// 	'questionText': 'Q2. What is Flutter?',
// 	'answers': [
// 		{'text': 'Android Development Kit', 'score': -2},
// 		{'text': 'IOS Development Kit', 'score': -2},
// 		{'text': 'Web Development Kit', 'score': -2},
// 		{
// 		'text':
// 			'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
// 		'score': 10
// 		},
// 	],
// 	},
// 	{
// 	'questionText': ' Q3. Which programing language is used by Flutter',
// 	'answers': [
// 		{'text': 'Ruby', 'score': -2},
// 		{'text': 'Dart', 'score': 10},
// 		{'text': 'C++', 'score': -2},
// 		{'text': 'Kotlin', 'score': -2},
// 	],
// 	},
// 	{
// 	'questionText': 'Q4. Who created Dart programing language?',
// 	'answers': [
// 		{'text': 'Lars Bak and Kasper Lund', 'score': 10},
// 		{'text': 'Brendan Eich', 'score': -2},
// 		{'text': 'Bjarne Stroustrup', 'score': -2},
// 		{'text': 'Jeremy Ashkenas', 'score': -2},
// 	],
// 	},
// 	{
// 	'questionText':
// 		'Q5. Is Flutter for Web and Desktop available in stable version?',
// 	'answers': [
// 		{
// 		'text': 'Yes',
// 		'score': -2,
// 		},
// 		{'text': 'No', 'score': 10},
// 	],
// 	},
// ];

var _questionIndex = 0;
var _totalScore = 0;

void _resetQuiz() {
	setState(() {
	_questionIndex = 0;
	_totalScore = 0;
	});
}

void _answerQuestion(int score) {
	_totalScore += score;

	setState(() {
	_questionIndex = _questionIndex + 1;
	});
	// ignore: avoid_print
	print(_questionIndex);
	if (_questionIndex < _questions.length) {
	// ignore: avoid_print
	print('We have more questions!');
	} else {
	// ignore: avoid_print
	print('No more questions!');
	}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
		title: Text('${widget.subject} Quiz'),
		),
    drawer: const NavBar(),
		body: Padding(
		padding: const EdgeInsets.all(30.0),
		child: _questionIndex < _questions.length
			? QuizScreen(
				answerQuestion: _answerQuestion,
				questionIndex: _questionIndex,
				questions: _questions,
				) //Quiz
			: Result(_totalScore, _resetQuiz, widget.subject),
		), //Padding
	); //Scaffold;
  }
}