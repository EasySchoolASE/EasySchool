import 'package:easylearning/ui/widgets/topBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Model/UserModel.dart';
import '../ui/widgets/navbar.dart';

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
  TextEditingController controller = TextEditingController();
 void onMenuTap() {
    setState(() {
    }
  );}

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
        drawer:const NavBar(),
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
            TopBar(controller: controller, expanded: true, onMenuTap:(){
              // setState(() {
              
              // });
            }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recommendations",
                          style: TextStyle(
                            color: Color.fromRGBO(59, 107, 170, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
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
            ]
            )
          )
        );
  }
}

// class HomePage extends StatelessWidget {
//   final onMenuTap;
//   HomePage({
//     Key? key,
//     required this.onMenuTap,
//   }) : super(key: key);

//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       backgroundColor: Colors.grey,
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           SafeArea(
//             child: CustomScrollView(
//               slivers: <Widget>[
//                 SliverFixedExtentList(
//                     delegate: SliverChildListDelegate.fixed([Container()]),
//                     itemExtent: MediaQuery.of(context).size.height * 0.32),
//                 SliverToBoxAdapter(
//                   child: SectionHeader(
//                     text: 'Recommended Lectures',
//                     onPressed: () {},
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 245,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 4,
//                       itemBuilder: (context, index) {
//                         return const VideoCard(long: false);
//                       },
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: SectionHeader(
//                     text: 'Revision Lectures',
//                     onPressed: () {},
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 245,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 4,
//                       itemBuilder: (context, index) {
//                         return const VideoCard(long: false);
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 0,
//             child: TopBar(
//               controller: controller,
//               expanded: true,
//               onMenuTap: onMenuTap,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }