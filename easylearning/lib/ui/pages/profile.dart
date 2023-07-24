import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easylearning/screens/view_results.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool iconPressed = false;
  final fullNameController = TextEditingController();
  final emergencyContactPersonController = TextEditingController();
  final emergencyContactMobileNumberController = TextEditingController();
  final emergencyAlternateMobileNumberController = TextEditingController();

  File? image;
  CroppedFile? croppedFile;
  DocumentSnapshot<Map<String, dynamic>>? snapshot;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      croppedFile = await ImageCropper().cropImage(
        sourcePath: image!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Edit Image',
              toolbarColor: Colors.white,
              toolbarWidgetColor:const Color.fromRGBO(59, 107, 170, 1),
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Edit Image',
          ),
          // ignore: use_build_context_synchronously
          WebUiSettings(
            context: context,
          ),
        ],
      );
      var imageTemp = File(croppedFile!.path);
      setState(() => this.image = imageTemp);
    } catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  @override
  void initState() {
    getProfileData();
    super.initState();
  }

  String? lastSignInTime;
  String? createdAt;
  getProfileData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String userID = sharedPreferences.get('userID').toString();
    createdAt=DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(sharedPreferences.get('createdAt').toString()));
    lastSignInTime=DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(sharedPreferences.get('lastSigned').toString()));
    snapshot = await FirebaseFirestore.instance.collection('users').doc(userID).get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: Text("Profile", style: GoogleFonts.rubikBubbles(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w100),),
          centerTitle: true,
        ),
        drawer:const NavBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if(snapshot!=null && snapshot!.data()!=null)...{
            Container(
              width: mediaQuery.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color.fromRGBO(59, 107, 170, 1),Color.fromARGB(255, 181, 205, 235),],
                          ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child:Card(
                      color: Colors.greenAccent,
                      elevation: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Container(
                      width: mediaQuery.width * 0.32,
                      height: mediaQuery.width * 0.32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF3C9FD7), Color(0xFF02396B)],
                          ),
                      ),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                          // width: 80,
                        ),
                      ),
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ("${snapshot!.data()!=null?snapshot!.data()!['firstName']:""}").trim().toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color:Colors.white,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),])),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: 
                  Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const Text("First Name :  ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis),),
                    Text("${snapshot!.data()!=null?snapshot!.data()!['firstName']:""}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis))
                  ],),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const Text("Second Name : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis)),
                    Text("${snapshot!.data()!=null?snapshot!.data()!['secondName']:""}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis))
                  ],),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const Text("Email : ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis)),
                    Text("${snapshot!.data()!=null?snapshot!.data()!['email']:""}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis))
                  ],),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const Text("Last Signed In :  ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis)),
                    Text("${snapshot!.data()!=null?lastSignInTime:""}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis))
                  ],),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const Text("Profile Created At :  ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis)),
                    Text("${snapshot!.data()!=null?createdAt:""}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 107, 170, 1),overflow: TextOverflow.ellipsis))
                  ],),
                  const SizedBox(height: 20,),
                  TextButton(
                      onPressed:() async{
                       Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const ViewResults()));
                      },
                      child: Container(
                      color: const Color.fromRGBO(59, 107, 170, 1),
                      padding: const EdgeInsets.all(14),
                      child: const Text(
                        'View Quiz Results',
                        style: TextStyle(color: Colors.white),
                      ),
                      ),
                    ),
                  ]),),
            } else...{
              Container(
                height: MediaQuery.of(context).size.height/1.2,
                color: Colors.white,
                child: Center(child: Text("Loading...",
                style: GoogleFonts.rubikBubbles(fontSize: 34, color:const Color.fromRGBO(59, 107, 170, 1),),)),)
            }
            ]));
  }
}