import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easylearning/Model/videosModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notes extends StatefulWidget {
  final String subject;
  const Notes({super.key, required this.subject});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  List<VideoModel> listSubject=[];

  @override
  void initState() {
    super.initState();
    getData();
  }
    // ignore: prefer_typing_uninitialized_variables
    File? file;
  _downloadPdfFile(String fileUrl) async {
    try {
    Fluttertoast.showToast(msg: "Downloading...");
    var dir = (await getApplicationDocumentsDirectory()).path;
    var req = await http.Client().get(Uri.parse(fileUrl));
    file = File('$dir/Notes.pdf');
    await file!.writeAsBytes(req.bodyBytes);
    print(file);
    print(dir);
    Fluttertoast.showToast(msg: "Downloaded");
    } catch (e) {
       Fluttertoast.showToast(msg: "Something went wrong");
    }
  //   if (result.isGranted) {
  //     print("granted");
  //      final taskId = await FlutterDownloader.enqueue(
  //       url: fileUrl,
  //       savedDir: '/storage/emulated/0/Android/data/', // Provide the directory path to save the downloaded file
  //       fileName: 'Notes.pdf', // Specify the desired file name
  //       showNotification: true, // Show a notification when the download starts and completes
  //       openFileFromNotification: true, // Open the downloaded file when the download is complete
  //     );
  //     print(taskId);
  // }
  // // final taskId = await FlutterDownloader.enqueue(
  // //   url: fileUrl,
  // //   savedDir: '/storage/emulated/0/Android/data/', // Provide the directory path to save the downloaded file
  // //   fileName: 'Notes.pdf', // Specify the desired file name
  // //   showNotification: true, // Show a notification when the download starts and completes
  // //   openFileFromNotification: true, // Open the downloaded file when the download is complete
  // // );
  // // taskId;
  // You can listen to the download progress using FlutterDownloader callbacks if needed
}

  //function to get data
  void getData() async {
     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('videos').get();
     for(int i=0;i<snapshot.docs.length;i++){
      if(VideoModel.fromMap(snapshot.docs[i].data()).subject==widget.subject ){
      listSubject.add(VideoModel.fromMap(snapshot.docs[i].data()));
      }
     }
     setState(() {});
     print(listSubject);
  }

  @override
  Widget build(BuildContext context) {

    return 
    Scaffold(
      appBar: AppBar(title: const Text("Notes"),),
      body:
    ListView.builder(
            itemCount: listSubject.length,
            itemBuilder: (context, index) {
              return
              Container(
                margin: const EdgeInsets.only(left: 10,right: 10, top: 10),
                child:  
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child:Padding(padding: 
                const EdgeInsets.all(6),
                child:ExpansionTile(
                  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  // ignore: deprecated_member_use
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  leading: const Icon(FontAwesomeIcons.book, color: Colors.orange,),
                  iconColor: const Color.fromRGBO(59, 107, 170, 1),
                  collapsedIconColor:  const Color.fromRGBO(59, 107, 170, 1),
                  title: Text("${listSubject[index].title}",
                  style: const TextStyle(fontSize: 22, 
                  fontWeight: FontWeight.w500, 
                  color:  Color.fromRGBO(59, 107, 170, 1),
                  ),),
                  children: [
                    ListTile(
                      leading:const Text("Notes", style:TextStyle(fontSize: 18),),
                      trailing:InkWell(
                        onTap: (){
                          _downloadPdfFile("${listSubject[index].pdfURL}");
                        },
                        child:const Icon(FontAwesomeIcons.download, color: Color.fromRGBO(59, 107, 170, 1),),)
                    ),
                     ListTile(
                      leading:const Text("Quiz", style:TextStyle(fontSize: 18),),
                      trailing:InkWell(
                        onTap: (){
                          _downloadPdfFile("${listSubject[index].quizPdfURL}");
                        },
                        child:const Icon(FontAwesomeIcons.download, color: Color.fromRGBO(59, 107, 170, 1),),)
                    )
                  ],
                  ))));
            },
    ));
  }
}