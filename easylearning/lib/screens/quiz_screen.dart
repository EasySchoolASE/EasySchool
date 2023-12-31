import 'package:easylearning/screens/question.dart';
import 'package:flutter/material.dart';

import 'answer.dart';

class QuizScreen extends StatelessWidget {
final List questions;
final int questionIndex;
final Function answerQuestion;

const QuizScreen({
	Key? key,
	required this.questions,
	required this.answerQuestion,
	required this.questionIndex,
}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Column(
	children: [
		Question(
		questions[questionIndex]['question'].toString(),
		), //Question
		...(questions[questionIndex]['options'] as List)
			.map((answer) {
		return Answer(
			() => answerQuestion(answer['score']), answer['text'].toString());
		}).toList()
	],
	); //Column
}
}
