import 'package:easylearning/screens/home_screen.dart';
import 'package:easylearning/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs=await SharedPreferences.getInstance();
  final isLoggedIn=prefs.getBool('isLoggedIn')??false;
  await Firebase.initializeApp();
  await FlutterDownloader.initialize();
  runApp(MyApp(isLoggedIn:isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy School',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        colorScheme: ColorScheme.fromSwatch().copyWith(
      primary:  const Color.fromRGBO(59,107, 170, 1),
    ),
      ),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn? const HomeScreen():  const LoginScreen(),
    );
  }
}
