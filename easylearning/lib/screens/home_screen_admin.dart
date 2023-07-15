import 'package:easylearning/ui/widgets/navbar_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Model/UserModel.dart';
import '../ui/widgets/topBarAdmin.dart';

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  HomeScreenAdminState createState() => HomeScreenAdminState();
}

class HomeScreenAdminState extends State<HomeScreenAdmin> {
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
        drawer:const NavBarAdmin(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("Welcome"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Center(
          child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
        Container(
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.all(10),
        child:
        Column(
          children: [
            TopBarAdmin(controller: controller, expanded: true, onMenuTap:(){
            }),
            ]
            )
          )
              ])))
              )
        );
  }
}