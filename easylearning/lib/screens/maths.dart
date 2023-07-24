import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easylearning/ui/widgets/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Model/videosModel.dart';
import '../ui/widgets/card.dart';

class MathsPage extends StatefulWidget {
  const MathsPage({super.key});

  @override
  State<MathsPage> createState() => _MathsPageState();
}

class _MathsPageState extends State<MathsPage> {

  @override 
  void initState(){
    super.initState();
    getData();
  }

  List<VideoModel> list=[];
  List<String> ids=[];

//function to get data
  void getData() async{
     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('videos').get();
     for(int i=0;i<snapshot.docs.length;i++){
      if(VideoModel.fromMap(snapshot.docs[i].data()).subject=="Math" ){
      list.add(VideoModel.fromMap(snapshot.docs[i].data()));
      ids.add(snapshot.docs[i].id.toString());
      }
     }
     setState(() {});
     print(snapshot.docs.length);
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
            height: 200,
            child:
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => YoutubePlayerWidget(
                          videoUrl: list[index].videoLink.toString(),
                          id: ids[index].toString())));
                      },
                    child:
                   CardWidget( 
                    gradient: true,
                    button: true,
                    width:  180,
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('${list[index].photoLink}'),
                                fit: BoxFit.cover),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: const Text(""),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${list[index].title}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Red Hat Display',
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:10.0 ),
                          child: Row(
                            children: <Widget>[
                              const Icon(FontAwesomeIcons.chartBar, size: 16,color: Colors.white,),
                              const Text(
                                "Beginner",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 10),
                              ),
                              const Spacer(),
                              Text(
                                "${list[index].duration} minutes  ",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 10),
                              ),
                              const Icon(FontAwesomeIcons.clock, size: 16,color: Colors.white,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              // decoration: BoxDecoration(gradient: Colors.),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.play,
                                      color: Colors.white),
                                  Text(
                                    "Watch Lecture",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                );
                },
              ),
            ),
          );
  }
}