import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easylearning/Model/videosModel.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  final String subject;
  const Notes({super.key, required this.subject});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  List<VideoModel> listSubject=[];

  //function to get data
  void getData() async {
     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('videos').get();
     for(int i=0;i<snapshot.docs.length;i++){
      if(VideoModel.fromMap(snapshot.docs[i].data()).subject=="Physics" ){
      listSubject.add(VideoModel.fromMap(snapshot.docs[i].data()));
      }
     }
     setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: listSubject.length,
            itemBuilder: (context, index) {
              return Card(
                child: ExpansionTile(
                  title: Text("${listSubject[index].title}"),
                  children: [
                    ExpansionTile(
                    title:Text("${listSubject[index].pdfURL}")),
                  ],
                ),
              );
            },
          );
  }
}