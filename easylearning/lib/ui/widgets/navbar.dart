import 'package:easylearning/screens/home_screen.dart';
import 'package:easylearning/screens/login_screens.dart';
import 'package:easylearning/screens/quiz_subjects.dart';
import 'package:easylearning/screens/view_results.dart';
import 'package:easylearning/ui/pages/aboutus.dart';
import 'package:easylearning/ui/pages/contactus.dart';
import 'package:easylearning/ui/pages/faq.dart';
import 'package:easylearning/ui/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(child: 
    Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer.png"),
                     fit: BoxFit.cover)
              ),
              child: Text('Hi, User', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
            ),
            ListTile(
              title: const Text('Home'),
              // selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(0);
                // Then close the drawer
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              title: const Text('Profile'),
              // selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ),
            ListTile(
              title: const Text('Quiz'),
              // selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const QuizSubjects()));
              },
            ),
            ListTile(
              title: const Text('Results'),
              // selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ViewResults()));
              },
            ),
            ListTile(
              title: const Text('About us'),
              // selected: _selectedIndex == 2,
              onTap: () async {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            ), 
            ListTile(
              title: const Text('FAQ'),
              // selected: _selectedIndex == 2,
              onTap: () async{
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const FAQPage()));
              },
            ),
             ListTile(
              title: const Text('Contact us'),
              // selected: _selectedIndex == 2,
              onTap: () async {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ContactUs()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              // selected: _selectedIndex == 2,
              onTap: () async{
                Navigator.pop(context);
                await logout(context);
              },
            ),
          ],
        )));
  }
}

Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    final prefs=await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    // ignore: use_build_context_synchronously
    await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }