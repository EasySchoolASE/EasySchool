import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  int tab = 0;
  int current = 0;
  List<String> tabName = [
    "MY TOOLS",
    "MY TASK",
    "MY TOOLS",
    "MY TOOLS",
  ];
  List pages = [
      const MathsPage(),
      const Physics(),
      const Chemistry(),
      const biology(),
    ];
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: CupertinoColors.white,
      width: MediaQuery.of(context).size.width,
      height: widget.expanded
          ? MediaQuery.of(context).size.height * 0.70
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Hi, User",
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
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CupertinoTextField(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: material.Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 25,
                      offset: Offset(0, 10),
                      color: Color(0x1A636363),
                    ),
                  ]),
              padding: const EdgeInsets.all(10),
              style: const TextStyle(
                  color: Color(0xFF343434),
                  fontSize: 18,
                  fontFamily: 'Red Hat Display'),
              enableInteractiveSelection: true,
              controller: widget.controller,
              expands: false,
              keyboardType: TextInputType.text,
              suffix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Color(0xFFADADAD),
                ),
              ),
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.words,
              placeholder: "Search",
              placeholderStyle: const TextStyle(
                  color: Color(0xFFADADAD),
                  fontSize: 18,
                  fontFamily: 'Red Hat Display'),
            ),
          ),
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
                                Text(index == 0
                                    ? "Maths"
                                    : index == 1
                                        ? "Physics"
                                        : index == 2 ? "Chemistry" : "Biology",
                                        style: GoogleFonts.rubikDirt(
                                        fontSize: 20, 
                                        fontWeight: FontWeight.w500, 
                                        color: Colors.white,
                                  ),
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
                // Visibility(
                //       child: Center(
                //         child: pages[current]),
                //     ),
                Container(
                  height:  MediaQuery.of(context).size.height * 0.30,
                  key: UniqueKey(),
                  child: pages[current],
                )
        ],
      ),
    );
  }
}
