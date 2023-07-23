import 'package:easylearning/screens/add_course.dart';
import 'package:easylearning/screens/add_pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screens/biology.dart';
import '../../screens/chemistry.dart';
import 'card.dart';

class TopBarAdmin extends StatefulWidget {
  const TopBarAdmin({
    Key? key,
    required this.controller,
    required this.expanded,
    required this.onMenuTap,
  }) : super(key: key);

  final TextEditingController controller;
  final bool expanded;
  final onMenuTap;

  @override
  _TopBarAdminState createState() => _TopBarAdminState();
}

class _TopBarAdminState extends State<TopBarAdmin> {
  int tab = 0;
  int current = 0;
  List<String> tabName = [
    "MY TOOLS",
    "MY TASK",
    "MY TOOLS",
    "MY TOOLS",
  ];
  List pages = [
      const AddCoursePage(),
      const AddPdfPage(),
      const Chemistry(),
      const biology(),
    ];
  @override
  Widget build(BuildContext context) {
    return 
      Column(
      mainAxisSize: MainAxisSize.min,
      children:[
      Container(
      color: CupertinoColors.white,
      width: MediaQuery.of(context).size.width,
      child: 
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Hi, Admin",
                    style: TextStyle(
                        color: Color(0xFF343434),
                        fontSize: 24,
                        fontFamily: 'Red Hat Display',
                        fontWeight: material.FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: widget.onMenuTap,
                    child: const material.CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),),
          widget.expanded
              ? 
              SizedBox(
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
                                        ? FontAwesomeIcons.solidFilePdf
                                        : index == 2
                                            ? FontAwesomeIcons.bookMedical
                                            : FontAwesomeIcons.bacteria),
                                            color:index ==0?const Color(0xFF2828FF):
                                            index==1?Colors.red:
                                            index==2? const Color(0xFFFFD700):const Color(0xFF33FF33),),
                                Text(index == 0
                                    ? "Add Course"
                                    : index == 1
                                    ? "Add Quiz":
                                      index==2 ? "View Students" : "View Course Content",
                                        style: GoogleFonts.rubikDirt(
                                        fontSize: 20, 
                                        fontWeight: FontWeight.w500, 
                                        color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                )
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
                Container(
                height: 1024,
                child:
                 pages[current],
                 ),
        ]);
  }
}
