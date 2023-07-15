import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {

  File?  _selectedImage;
  final descriptionController=TextEditingController();
  final otherLocationController=TextEditingController();
  late String subV="";
  late String subSubV="";
  final categoryController=TextEditingController();
  final locationController = TextEditingController();
  final subLocationController = TextEditingController();
  final subSubLocationController = TextEditingController();
  final locationId=TextEditingController();
  final subSubLocationId = TextEditingController();
  final subLocationId = TextEditingController();
  final projectId=TextEditingController();
  final clientId = TextEditingController();
  List<String> locationList=["Math","Physics","Chemistry","Biology"];
  TextStyle textStyleBodyText1 =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.3, color: Color.fromRGBO(59, 107, 170, 1),);

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    setState(() {
      _selectedImage =File(image!.path);
    });
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
              value: locationList[0],
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
          items: locationList.map((String items){
              return
                DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) async{
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
               CustomTextField3(enabled: true,controller: otherLocationController,hintText: "Type here",keyboardType: TextInputType.number,)
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
               CustomTextFieldArea(enabled: true,controller: descriptionController,hintText: "Type here",)
          ])
            ),
          const SizedBox(height: 10,),
          CustomContainer2(
            child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("ATTACH FILE/PHOTO",style: textStyleBodyText1,),
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
              }, 
               child: Text("Submit",style: textStyleBodyText1.copyWith(color: Colors.black),)),
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