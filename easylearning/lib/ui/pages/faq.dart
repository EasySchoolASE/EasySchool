import 'package:easylearning/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: Text("FAQ", style: GoogleFonts.rubikBubbles(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w100),),
          centerTitle: true,
        ),
      drawer: const NavBar(),
      body:
      Container(
        margin: const EdgeInsets.only(left: 10,right: 10),
        child:
      ListView(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[ 
      const SizedBox(height: 20,),
      Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:Padding(padding: 
        const EdgeInsets.all(6),
        child:ExpansionTile(
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // ignore: deprecated_member_use
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: const Icon(FontAwesomeIcons.bookReader, color: Colors.orange,),
          iconColor: const Color.fromRGBO(59, 107, 170, 1),
          collapsedIconColor:  const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("Why do you need it?",
          style: TextStyle(fontSize: 22, 
          fontWeight: FontWeight.w500, 
          color:  Color.fromRGBO(59, 107, 170, 1),
          ),),
          children:const [
            Text("Easy School app is valuable for its accessibility and convenience, offering learners the flexibility to access educational content anytime, anywhere. It empowers students with interactive lessons, quizzes, and personalized learning experiences, fostering self-paced learning and enabling them to acquire knowledge and skills effectively in a digital and engaging environment.",
            style: TextStyle(),),
          ],
        ))),
        const SizedBox(height: 10,),
        Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:Padding(padding: 
        const EdgeInsets.all(6),
        child:ExpansionTile(
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // ignore: deprecated_member_use
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: const Icon(FontAwesomeIcons.bookReader, color: Colors.orange,),
          iconColor: const Color.fromRGBO(59, 107, 170, 1),
          collapsedIconColor:  const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("Can I download content for offline access?",
          style: TextStyle(fontSize: 22, 
          fontWeight: FontWeight.w500, 
          color:  Color.fromRGBO(59, 107, 170, 1),
          ),),
          children:const [
            Text("Yes, Easy school application allow you to download information for offline use, allowing you to study and access resources even when you are not connected to the internet.",
            style: TextStyle(),),
          ],
        ))),
        const SizedBox(height: 10,),
        Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:Padding(padding: 
        const EdgeInsets.all(6),
        child:ExpansionTile(
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // ignore: deprecated_member_use
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: const Icon(FontAwesomeIcons.bookReader, color: Colors.orange,),
          iconColor: const Color.fromRGBO(59, 107, 170, 1),
          collapsedIconColor:  const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("How do I navigate through the app?",
          style: TextStyle(fontSize: 22, 
          fontWeight: FontWeight.w500, 
          color:  Color.fromRGBO(59, 107, 170, 1),
          ),),
          children:const [
            Text("You can browse different areas, courses, or subjects by using the app's menu or navigation bar. Additionally, buttons or icons for certain features or tasks, such as search, settings, or progress tracking are present. ",
            style: TextStyle(),),
          ],
        ))),
         const SizedBox(height: 10,),
        Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:Padding(padding: 
        const EdgeInsets.all(6),
        child:ExpansionTile(
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // ignore: deprecated_member_use
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: const Icon(FontAwesomeIcons.bookReader, color: Colors.orange,),
          iconColor: const Color.fromRGBO(59, 107, 170, 1),
          collapsedIconColor:  const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("How frequently is the content updated or new courses introduced to Easy school?",
          style: TextStyle(fontSize: 22, 
          fontWeight: FontWeight.w500, 
          color:  Color.fromRGBO(59, 107, 170, 1),
          ),),
          children:const [
            Text("We have a dedicated staff that examines and updates our current courses on a regular basis to ensure correctness and integrate the most recent knowledge.",
            style: TextStyle(),),
          ],
        ))),
         const SizedBox(height: 10,),
    ])));
  }
}