import 'package:easylearning/ui/widgets/topBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Model/UserModel.dart';
import '../ui/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool isPressed = false;
  TextEditingController controller = TextEditingController();
 void onMenuTap() {
    setState(() {
    }
  );}

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer:const NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("Welcome"),
          centerTitle: true,
        ),
        body: 
        Container(
        margin: const EdgeInsets.all(10),
        child:
        Column(
          children: [
            TopBar(controller: controller, expanded: true, onMenuTap:(){
              // setState(() {
              
              // });
            }),
            ]
            )
          )
        );
  }
}
