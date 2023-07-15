import 'package:easylearning/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("Contact us"),
          centerTitle: true,
        ),
      drawer: const NavBar(),
      body:
       Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              GradientText(
                    'Easy School Team',
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    colors: const [
                      Colors.blue,
                      Colors.indigo,
                    ]),
              const SizedBox(height: 20),
               Card(
                shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(80.0), //<-- SEE HERE
              ),
              elevation: 20,  
              child:
              const CircleAvatar(
                  radius:80, backgroundImage: AssetImage('assets/images/logo.png'),
                  foregroundColor:   Colors.blue,
                  backgroundColor:   Colors.blue,),
              ),
              const SizedBox(height: 20),
               GradientText(
                    'Reach out to us!',
                    style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    colors: const [
                      Colors.blue,
                      Colors.indigo,
                    ]),
              const SizedBox(
               height: 20,
                width: 150,
                child: Divider(
                 color: Colors.indigo,
                ),
              ),
              MaterialButton(
                elevation: 0,
                splashColor: Colors.transparent,
                onPressed: ()async{
                 String url = "tel:2269618557";   
                  launchUrl(Uri.parse(url));  
              }, child: 
              const Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                  Icons.phone,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    '+1 (226) 961-8557',
                    style: TextStyle(
                        fontFamily: 'Red Hat Display',
                        color:   Colors.blue,
                        fontSize: 20,
                    ),
                  ),
                ),

              ),
              ),
              MaterialButton(
                elevation: 0,
                splashColor: Colors.transparent,
                onPressed: ()async{
                 String url = "mailto:avinoor@uwindsor.ca";   
                  launchUrl(Uri.parse(url));  
              }, child: 
              const Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 2,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color:  Colors.indigo,
                  ),
                  title: Text(
                    'avinoor@uwindsor.ca',
                    style: TextStyle(
                      fontFamily: 'Red Hat Display',
                      color:   Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
              ),
            ],
        ));
  }
}