import 'package:flutter/material.dart';

void main() {
  runApp(StudentProgressApp());
}

class StudentProgressApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentProgressScreen(),
    );
  }
}

class StudentProgressScreen extends StatefulWidget {
  @override
  _StudentProgressScreenState createState() => _StudentProgressScreenState();
}

class _StudentProgressScreenState extends State<StudentProgressScreen> {
  Map<String, int> subjectScores = {
    'Biology': 0,
    'Chemistry': 0,
    'Mathematics': 0,
    'Physics': 0,
  };

  // TextEditingController to handle student name input
  TextEditingController studentNameController = TextEditingController();

  void updateScore(String subject, int score) {
    setState(() {
      subjectScores[subject] = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Progress')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Student Name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            // Use TextField with TextEditingController to handle student name input
            TextField(
              controller: studentNameController,
              onChanged: (value) {
                // You can handle student name input here if needed.
              },
              decoration: InputDecoration(
                hintText: 'Enter student name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('Subject Scores',
                style:
                    TextStyle(fontSize: 18)), // Added label for subject scores
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: subjectScores.length,
                itemBuilder: (context, index) {
                  var subject = subjectScores.keys.elementAt(index);
                  return ListTile(
                    title: Text(subject),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Score: ${subjectScores[subject]}'),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () => _showQuizDialog(subject),
                          child: Text('Take Quiz'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuizDialog(String subject) {
    showDialog(
      context: context,
      builder: (context) {
        int score = 0; // Initialize the quiz score here.
        return AlertDialog(
          title: Text('Quiz - $subject'),
          content:
              _buildQuizContent(), // Move quiz dialog content to a separate method
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                updateScore(subject, score);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  // Widget method for quiz dialog content
  Widget _buildQuizContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Implement your quiz questions and options here.
        // Update the 'score' variable based on the user's answers.
        Text('Question 1:'),
        // ...
      ],
    );
  }
}
