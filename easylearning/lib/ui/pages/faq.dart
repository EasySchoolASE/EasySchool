import 'package:easylearning/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

//This is FAQ Page

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 107, 170, 1),
          title: const Text("FAQ"),
          centerTitle: true,
        ),
        //FAQ code is done
        drawer: const NavBar(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // ignore: deprecated_member_use
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        leading: const Icon(
                          FontAwesomeIcons.bookReader,
                          color: Colors.orange,
                        ),
                        iconColor: const Color.fromRGBO(59, 107, 170, 1),
                        collapsedIconColor:
                            const Color.fromRGBO(59, 107, 170, 1),
                        title: const Text(
                          "Why do you need it?",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 107, 170, 1),
                          ),
                        ),
                        children: const [
                          Text(
                            "ABCD EFGH IJKL MNOPQ RSTU VWXYZ",
                            style: TextStyle(),
                          ),
                        ],
                      )))
            ]));
  }
}
