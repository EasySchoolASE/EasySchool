import 'package:easylearning/screens/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Model/UserModel.dart';

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
        // drawer: NavBar(),
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
            if (isPressed) ...{
              const SizedBox(
                height: 10,
              ),
              Table(
                  border: TableBorder.all(
                      color: const Color.fromRGBO(59, 107, 170, 1),
                      style: BorderStyle.solid,
                      width: 2),
                  children: [
                    TableRow(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(59, 107, 170, 1),
                        ),
                        children: [
                          Column(children: const [
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('ID',
                                    style: TextStyle(fontSize: 20.0)))
                          ]),
                          Column(children: const [
                            Text('Key', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: const [
                            Text('Date', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: const [
                            Text('Sold', style: TextStyle(fontSize: 20.0))
                          ]),
                        ]),
                  ]),
            },
             Expanded(child:Container()),
            Align(
              alignment: FractionalOffset.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 5,textStyle: const TextStyle(fontSize: 25)),
                        onPressed: () async {
                          isPressed = true;
                          setState(() {});
                        },
                        child: const Text("Welcome!")),
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(elevation: 5,textStyle: const TextStyle(fontSize: 25)),
                        onPressed: (){
                          logout(context);
                          setState(() {});
                        },
                        child: const Text("Logout"))
                  ]),
            ),
            const SizedBox(height: 100,)])));
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