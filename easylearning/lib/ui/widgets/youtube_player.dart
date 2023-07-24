import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easylearning/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Model/videosModel.dart';
import '../../screens/home_screen.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String id;
  const YoutubePlayerWidget({super.key, required this.videoUrl, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController _controller;
  
  DocumentSnapshot<Map<String, dynamic>>? snapshot;
  VideoModel? data;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    getData();
  }

    getData() async {
      snapshot = await FirebaseFirestore.instance.collection('videos').doc(widget.id).get();
       print(snapshot!.data());
       data= VideoModel.fromMap(snapshot!.data());
       print(data!.title);
       print("%%%%%%%%%--%%%%%%%%%%%%%%%%%%%%%%");
      setState(() {});
    }

    File? file;
   
   _downloadPdfFile(String fileUrl) async {
    print(data?.title);
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
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: Text("Lecture Video", 
      style: GoogleFonts.rubikDirt(fontSize: 34, color: Colors.white),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        child:const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        )),),
      body:
      Column(children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
          child: 
        Column(children: [
         Card(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:Padding(padding: 
          const EdgeInsets.all(6),
          child:ExpansionTile(
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // ignore: deprecated_member_use
            collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(FontAwesomeIcons.video, color: Colors.orange,),
            trailing: const Text(""),
            iconColor: const Color.fromRGBO(59, 107, 170, 1),
            collapsedIconColor:  const Color.fromRGBO(59, 107, 170, 1),
            title: Text("${data?.title}",
            style: const TextStyle(fontSize: 22, 
            fontWeight: FontWeight.w500, 
            color:  Color.fromRGBO(59, 107, 170, 1),
            ),),
          )
          )
        ),
         Card(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:Padding(padding: 
          const EdgeInsets.all(6),
          child:ExpansionTile(
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // ignore: deprecated_member_use
            collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(FontAwesomeIcons.clock, color: Colors.orange,),
            trailing: const Text(""),
            iconColor: const Color.fromRGBO(59, 107, 170, 1),
            collapsedIconColor:  const Color.fromRGBO(59, 107, 170, 1),
            title: Text("${data?.duration} minutes",
            style: const TextStyle(fontSize: 22, 
            fontWeight: FontWeight.w500, 
            color:  Color.fromRGBO(59, 107, 170, 1),
            ),),
          )
          )
        ),
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
            title: const Text("Content",
            style: TextStyle(fontSize: 22, 
            fontWeight: FontWeight.w500, 
            color:  Color.fromRGBO(59, 107, 170, 1),
            ),),
            children: [
              ListTile(
                leading:const Text("Notes", style:TextStyle(fontSize: 18),),
                trailing:InkWell(
                  onTap: (){
                    _downloadPdfFile("${data?.pdfURL}");
                  },
                  child:const Icon(FontAwesomeIcons.download, color: Color.fromRGBO(59, 107, 170, 1),),)
              ),
                ListTile(
                leading:const Text("Quiz", style:TextStyle(fontSize: 18),),
                trailing:InkWell(
                  onTap: (){
                    _downloadPdfFile("${data?.quizPdfURL}");
                  },
                  child:const Icon(FontAwesomeIcons.download, color: Color.fromRGBO(59, 107, 170, 1),),)
              )
            ],
            )))
        ]))])
        );
  }
}