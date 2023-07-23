import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {

  File?  _selectedImage;
  final descriptionController=TextEditingController();
  final durationController=TextEditingController();
  final videoController=TextEditingController();
  final titleController=TextEditingController();
  late String subV="";
  late String subSubV="";
  final subjectController=TextEditingController();
  final locationController = TextEditingController();
  final subLocationController = TextEditingController();
  final subSubLocationController = TextEditingController();
  final locationId=TextEditingController();
  final subSubLocationId = TextEditingController();
  final subLocationId = TextEditingController();
  final projectId=TextEditingController();
  final clientId = TextEditingController();
  FilePickerResult? file;
  String? fileName;
  String pdfURL="";
  List<String> subjectList=["Math","Physics","Chemistry","Biology"];
  TextStyle textStyleBodyText1 =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.3, color: Color.fromRGBO(59, 107, 170, 1),);
  String imageUrl = '';
  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    setState(() {
      _selectedImage =File(image!.path);
    });
  }
  
  final mainReference = FirebaseStorage.instance.ref().child('pdfs');
  Future getPdfAndUpload()  async{
  var rng = Random();
  String randomName="";
  for (var i = 0; i < 20; i++) {
    print(rng.nextInt(100));
    randomName += rng.nextInt(100).toString();
  }
  file = await FilePicker.platform.pickFiles(withData: true,type: FileType.custom, allowedExtensions: ['pdf']);
  fileName = '$randomName.pdf';
  }
 
  
  late List<bool> isSelected;
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: 
       Container(
          // height: MediaQuery.of(context).size.height * 0.8,
          color: CupertinoColors.white,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 20,),
           CustomContainer2(
            child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("Select Subject",style: textStyleBodyText1,),
                Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
              ],),),
          const SizedBox(height: 10,),
          Container(
           margin: const EdgeInsets.only(left:20,right:20,),
           padding: const EdgeInsets.only(bottom: 20,),
            child: 
           DropdownButtonFormField(
              value: subjectList[0],
             icon: const Padding( 
              padding: EdgeInsets.only(left:20),
              child:Icon(Icons.arrow_drop_down_outlined,size: 30)
             ), 
            iconEnabledColor: Colors.grey,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14
            ), 
          dropdownColor: Colors.white,
          decoration: const InputDecoration(enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
          isExpanded: true,
          items: subjectList.map((String items){
              return
                DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) async{
                subjectController.text=newValue!;
              },
            ),
            ),]),),
            CustomContainer2(
            child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("Duration (in minutes)",style:textStyleBodyText1 ,),
                Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
              ],),),
               const SizedBox(height: 10,),
               CustomTextField3(enabled: true, controller: durationController, hintText: "Type here",keyboardType: TextInputType.number,)
          ])
            ),
             CustomContainer2(
            child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("Video Link",style:textStyleBodyText1 ,),
                Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
              ],),),
               const SizedBox(height: 10,),
               CustomTextField3(enabled: true,controller: videoController,hintText: "Type here",)
          ])
            ),
            // const SizedBox(height: 10,),
             CustomContainer2(child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("Title",style: textStyleBodyText1,),
                Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
              ],),),
               const SizedBox(height: 10,),
               CustomTextFieldArea(enabled: true,controller: titleController,hintText: "Type here",)
          ])
            ),
          CustomContainer2(
            child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("ATTACH COVER PHOTO",style: textStyleBodyText1,),
                Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
              ],),),
               const SizedBox(height: 10,),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.grey[300]),
                 onPressed: () {
                   showDialog(
                   context: context,
                   builder: (BuildContext context) {
                     return SimpleDialog(
                       children: <Widget>[
                         SimpleDialogOption(
                            child: Row(
                                children: <Widget>[
                                  const SizedBox(width: 10),
                                  Text("Choose from Library",style: textStyleBodyText1,),
                                ],
                              ),
                             onPressed: () {
                               // Call the _pickImage function with the gallery source
                               _pickImage(ImageSource.gallery);
                               // Close the modal pop-up
                               Navigator.pop(context);
                             },
                           ),
                          SimpleDialogOption(
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 10),
                                Text("Take Photo",style:textStyleBodyText1,),
                              ],
                            ),
                             onPressed: () {
                               // Call the _pickImage function with the camera source
                               _pickImage(ImageSource.camera);
                               // Close the modal pop-up
                               Navigator.pop(context);
                             },
                           ),
                           SimpleDialogOption(
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 10),
                                Text("Cancel",style:textStyleBodyText1,),
                              ],
                            ),
                             onPressed: () {
                               Navigator.pop(context);
                             },
                           ),
                         ],
                       );
                     },
                   );
                 },
                 child: _selectedImage == null
                     ? const Icon(Icons.add,size: 80,)
                     : Image.file(_selectedImage!,height: 80,width: 80,),
               ),
          ])
          ),
            CustomContainer2(
            child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("ATTACH PDF",style: textStyleBodyText1,),
                Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
              ],),),
               const SizedBox(height: 10,),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.grey[300]),
                 onPressed: () async{
                    await getPdfAndUpload();
                    setState(() {
                      
                    });
                  },
                 child:file==null
                     ? const Icon(Icons.add,size: 80,)
                     : Text(file!.files.first.path!,textAlign: TextAlign.center,)
               ),
          ])
          ),
           const SizedBox(height: 20,),
           Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            margin:const EdgeInsets.only(left: 20,right: 20),
              child: 
             ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:  const Color.fromRGBO(59, 107, 170, 1),
              elevation: 0,
              splashFactory: NoSplash.splashFactory),
              onPressed: () async{
                    if(durationController.text.isEmpty){
                      Fluttertoast.showToast(msg: "Duration is required");
                    }
                    else if(subjectController.text.isEmpty){
                       Fluttertoast.showToast(msg: "Subject is required");
                    }
                     else if(titleController.text.isEmpty){
                       Fluttertoast.showToast(msg: "Title is required");
                    }
                    else if(videoController.text.isEmpty){
                       Fluttertoast.showToast(msg: "Video link is required");
                    }
                    else if(_selectedImage!.path.isEmpty){
                       Fluttertoast.showToast(msg: "Image is required");
                    }
                    else{
                   EasyLoading.show(maskType: EasyLoadingMaskType.black);
                   Reference referenceRoot = FirebaseStorage.instance.ref();
                   Reference referenceDirImages = referenceRoot.child('images');

                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload = referenceDirImages.child(_selectedImage!.path);

                    //Handle errors/success
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(File(_selectedImage!.path));
                      //Success: get the download URL
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      //Some error occurred
                      print("#########################");
                      print(error);
                      print("#########################");
                    }
                   Reference referenceRoot1 = FirebaseStorage.instance.ref();
                    Reference referenceDirImages1 = referenceRoot1.child('pdfs');
                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload1 = referenceDirImages1.child(fileName!);
                    //Handle errors/success
                    try {
                    // Upload file
                    await referenceImageToUpload1.putData(file!.files.first.bytes!);
                    pdfURL=await referenceImageToUpload1.getDownloadURL();
                      //Store the file
                    } catch (error) {
                      //Some error occurred
                      print("#########################");
                      print(error);
                      print("#########################");
                    }
                  await FirebaseFirestore.instance.collection('videos').add({
                    'duration':durationController.text,
                    'photoLink':imageUrl,
                    'subject':subjectController.text,
                    'title':titleController.text,
                    'videoLink':videoController.text,
                    'pdfLink':pdfURL,
                  });
                  Fluttertoast.showToast(msg: "Video Added Successfully!");
                  durationController.clear();
                  imageUrl="";
                  subjectController.clear();
                  titleController.clear();
                  videoController.clear();
                  EasyLoading.dismiss();
                  }
              }, 
               child: Text("Submit", style: textStyleBodyText1.copyWith(color: Colors.black),)),
           ),
          ]
        )));
  }
}

class CustomContainer2 extends StatelessWidget {
  final Widget child;

  const CustomContainer2({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
           padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: const Color.fromRGBO(59, 107, 170, 1),),
              borderRadius: BorderRadius.circular(5),
            ),
            child: child);
  }
}

class CustomTextFieldArea extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool? enabled;
  final TextEditingController? controller;

  const CustomTextFieldArea({Key? key, 
     this.label,
     this.hintText,
     this.enabled,
     this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    TextField(
      cursorHeight: 20,
      enabled: enabled,
      controller: controller,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey[200],
      enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
            width: 1, color:Colors.grey[300]!), 
              ),
      focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
            width: 1, color:Colors.grey[300]!),
              ),
      errorBorder: InputBorder.none,
      disabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
            width: 1, color:Colors.grey[300]!), 
      ),
      ),
       maxLines: 4,
       style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 16,),
    );
  }
}

class CustomTextField3 extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool? enabled;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField3({Key? key, 
     this.label,
     this.hintText,
     this.enabled,
     this.controller,
     this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    TextField(
      cursorHeight: 20,
      enabled: enabled,
      controller: controller,
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey[200],
      hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
      enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
            width: 1, color:Colors.grey[300]!), 
              ),
      focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
            width: 1, color:Colors.grey[300]!),
              ),
      errorBorder: InputBorder.none,
      disabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
            width: 1, color:Colors.grey[300]!), 
      ),
      ),
       maxLines: null,
       style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 16,),
    );
  }
}