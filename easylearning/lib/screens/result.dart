// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:easylearning/screens/quiz_subjects.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Result extends StatelessWidget {
final int resultScore;
final Function resetHandler;
final String subject;

const Result(this.resultScore, this.resetHandler, this.subject,{Key? key})
	: super(key: key);

//Remark Logic
String get resultPhrase {
	String resultText;
	if (resultScore >= 41) {
	resultText = 'You are awesome!';
	print(resultScore);
	} else if (resultScore >= 31) {
	resultText = 'Pretty likeable!';
	print(resultScore);
	} else if (resultScore >= 21) {
	resultText = 'You need to work more!';
	} else if (resultScore >= 1) {
	resultText = 'You need to work hard!';
	} else {
	resultText = 'This is a poor score!';
	print(resultScore);
	}
	return resultText;
}

@override
Widget build(BuildContext context) {
	return Center(
	child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: <Widget>[
    if(resultScore>=41)...{
       const Image(
        image: AssetImage(
            'assets/images/trophy.png'),
        height: 250,
        width: 250,
        )
    },
    if(resultScore>=31 && resultScore<41)...{
       const Image(
        image: AssetImage(
            'assets/images/likable.png'),
        height: 250,
        width: 250,
        )
    },
      if(resultScore>=21 && resultScore<31)...{
       const Image(
        image: AssetImage(
            'assets/images/likable.png'),
        height: 250,
        width: 250,
        )
    },
     if(resultScore>=1 && resultScore<21)...{
       const Image(
        image: AssetImage(
            'assets/images/hard-work.png'),
        height: 250,
        width: 250,
        )
    },
		Text(
			resultPhrase,
			style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
			textAlign: TextAlign.center,
		), //Text
		Text(
			'Score ' '$resultScore',
			style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
			textAlign: TextAlign.center,
		), //Text
    const SizedBox(height: 10,),
		TextButton(
			onPressed:() async{
       await resetHandler();
      },
			child: Container(
			color: const Color.fromRGBO(59, 107, 170, 1),
			padding: const EdgeInsets.all(14),
			child: const Text(
				'Restart Quiz',
				style: TextStyle(color: Colors.white),
			),
			),
		),
    const SizedBox(height: 10,),
    TextButton(
			onPressed:() async {
        final sharedPreferences=await SharedPreferences.getInstance();
        List results=[{
          'score':resultScore,
          'time':DateTime.now().toString(),
          'subject': subject,
        }];
        var data =json.decode(sharedPreferences.get('results').toString());
        if(data!=null){
        data.add(results[0]);
        sharedPreferences.setString('results', json.encode(data));
        var hello=json.decode(sharedPreferences.get('results').toString());
        print("---------------------");
        print(hello);
        }
        else if(data==null){
           sharedPreferences.setString('results', json.encode(results));
        }
      },
			child: Container(
			color: const Color.fromRGBO(59, 107, 170, 1),
			padding: const EdgeInsets.all(14),
			child: const Text(
				'Save Results',
				style: TextStyle(color: Colors.white),
			),
			),
		),
    const SizedBox(height: 10,),
    TextButton(
			onPressed:() async{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QuizSubjects()));
      },
			child: Container(
			color: const Color.fromRGBO(59, 107, 170, 1),
			padding: const EdgeInsets.all(14),
			child: const Text(
				'Quiz Home',
				style: TextStyle(color: Colors.white),
			),
			),
		),
		], //<Widget>[]
	), //Column
	); //Center
}
}
