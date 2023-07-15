import 'package:easylearning/screens/home_screen_admin.dart';
import 'package:easylearning/screens/login_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBarAdmin extends StatefulWidget {
  const NavBarAdmin({super.key});

  @override
  State<NavBarAdmin> createState() => _NavBarState();
}

class _NavBarState extends State<NavBarAdmin> {
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
              child: Text('Hi, Admin', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
            ),
            ListTile(
              title: const Text('Home'),
              // selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(0);
                // Then close the drawer
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreenAdmin()));
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
    prefs.setBool('adminLoggedIn', false);
    // ignore: use_build_context_synchronously
    await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }