import 'package:easylearning/ui/widgets/topBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(user!.uid)
    //     .get()
    //     .then((value) {
    //   loggedInUser = UserModel.fromMap(value.data());
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer:const NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: Text("Welcome", style: GoogleFonts.rubikBubbles(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w100),),
          centerTitle: true,
        ),
        body: 
        Container(
        margin: const EdgeInsets.all(10),
        child:
        Column(
          children: [
            TopBar(controller: controller, expanded: true, onMenuTap:(){
            }),
            ]
            )
          )
        );
  }
}