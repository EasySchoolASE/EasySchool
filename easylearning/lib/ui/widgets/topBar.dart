import 'package:easylearning/ui/pages/notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/biology.dart';
import '../../screens/chemistry.dart';
import '../../screens/maths.dart';
import '../../screens/physics.dart';
import 'card.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
    required this.controller,
    required this.expanded,
    required this.onMenuTap,
  }) : super(key: key);

  final TextEditingController controller;
  final bool expanded;
  final onMenuTap;

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  String userName="";

  getUserName() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    userName= sharedPreferences.get('userName').toString();
    setState(() {});
  }

  int tab = 0;
  int current = 0;
  List pages = [
      const MathsPage(),
      const Physics(),
      const Chemistry(),
      const biology(),
    ];
  @override
  Widget build(BuildContext context) {
    return 
    userName!="null"? Container(
      color: CupertinoColors.white,
      width: MediaQuery.of(context).size.width,
      height: widget.expanded
          ? MediaQuery.of(context).size.height * 0.80
          : MediaQuery.of(context).size.height * 0.19,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Hi, ${userName.toUpperCase()}",
                    style: GoogleFonts.rubikBubbles(
                        color: const Color.fromRGBO(59, 107, 170, 1),
                        fontSize: 34,
                        fontWeight: material.FontWeight.w100,
                     ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                  Card(
                    elevation: 20,
                    color:  const Color.fromRGBO(59, 107, 170, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: 
                   GestureDetector(
                    onTap: widget.onMenuTap,
                    child: const material.CircleAvatar(
                      backgroundColor: Color.fromRGBO(59, 107, 170, 1),
                      foregroundColor: Color.fromRGBO(59, 107, 170, 1),
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          widget.expanded
              ? 
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 10, 30),
                        child: 
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                        child:
                        CardWidget(
                          height: 120,
                          width: 130,
                          gradient: true,
                          button: true,
                          duration: 200,
                          border: tab == index
                              ? Border(
                                  bottom: BorderSide(
                                      color: tab == 0
                                          ? const Color(0xFF2828FF)
                                          : tab == 1
                                              ? const Color(0xFFFF2E2E)
                                              : tab == 2
                                                  ? const Color(0xFFFFD700)
                                                  : const Color(0xFF33FF33),
                                      width: 5),
                                )
                              : null,
                          child: Center(
                            child: Column(
                              mainAxisAlignment:
                                  material.MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon((index == 0
                                    // ignore: deprecated_member_use
                                    ? FontAwesomeIcons.add
                                    : index == 1
                                        ? FontAwesomeIcons.brain
                                        : index == 2
                                            ? FontAwesomeIcons.bookMedical
                                            : FontAwesomeIcons.bacteria),
                                            color:index ==0?const Color(0xFF2828FF):
                                            index==1?const Color(0xFFFF2E2E):
                                            index==2? const Color(0xFFFFD700):const Color(0xFF33FF33),),
                                 Padding(padding: const EdgeInsets.all(5),
                                 child:
                                 ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                  index==0?'assets/images/math.jpeg'
                                  :index==1?'assets/images/physics.jpeg'
                                  :index==2?'assets/images/chemistry.jpeg':'assets/images/biology.jpeg',
                                  // width: 50,
                                  )
                                ),
                                 ),
                              ],
                            ),
                          ),
                          func: () {
                            current = index;
                            setState(() {
                              tab = index;
                              print(index);
                            });
                          },
                        ),
                        )
                      );
                    },
                  ),
              )
              : Container(),
                // Visibility(
                //       child: Center(
                //         child: pages[current]),
                //     ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Notes",
                          style: TextStyle(
                            color: Color.fromRGBO(59, 107, 170, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const Notes(subject: "Math")));
                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                 ]),
              const SizedBox(height: 20,),
              const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended Lectures",
                          style: TextStyle(
                            color: Color.fromRGBO(59, 107, 170, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                 ]),
                const SizedBox(height: 10,),
                Container(
                  height:  MediaQuery.of(context).size.height * 0.30,
                  key: UniqueKey(),
                  child: pages[current],
                )
        ],
      ),
    ):Container(
      height: MediaQuery.of(context).size.height/1.2,
      color: Colors.white,
      child: Center(child: Text("Loading...",
      style: GoogleFonts.rubikBubbles(fontSize: 34, color:const Color.fromRGBO(59, 107, 170, 1),),)),);
  }
}
