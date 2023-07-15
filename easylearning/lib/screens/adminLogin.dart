import 'package:easylearning/screens/home_screen_admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'login_screens.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color:const Color.fromRGBO(59, 107, 170, 1),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            final prefs=await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            prefs.setBool('adminLoggedIn', true);
            if(emailController.text=="admin@gmail.com" && passwordController.text=="easylearning"){
                Fluttertoast.showToast(msg: "Login Successful");
                 // ignore: use_build_context_synchronously
                 Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomeScreenAdmin()));
            }else{
             Fluttertoast.showToast(msg: "Access Denied");
            }
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
      body: Center(
        child: SingleChildScrollView(
          child: 
          SafeArea(
            maintainBottomViewPadding: true,
            child:
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  GradientText(
                    'Easy School',
                    style: GoogleFonts.rubikDirt(
                                        fontSize: 60, 
                                        fontWeight: FontWeight.w500, 
                                        color: Colors.white,
                                  ),
                    textAlign: TextAlign.center,
                    colors: const [
                      Colors.blue,
                      Colors.indigo,
                    ]),
                    // const SizedBox(height: 25,),
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        )),
                    // const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 35),
                    loginButton,
                    const SizedBox(height: 20),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Are you a Student?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const LoginScreen()));
                            },
                            child: const Text(
                              " Login",
                              style: TextStyle(
                                  color:Color.fromRGBO(59, 107, 170, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
          )
        ),
      ),
    );
  }
}