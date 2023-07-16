import 'package:flutter/material.dart';

void main() {
  runApp(EasySchoolApp());
}

class EasySchoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasySchool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutUsScreen(),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'EasySchool',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'We aim to provide a user-friendly and efficient platform for schools and students.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Contact us:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text('Email: info@easyschool.com'),
              Text('Phone: +1 123-456-7890'),
            ],
          ),
        ),
      ),
    );
  }
}
