import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPdfPage extends StatefulWidget {
  const AddPdfPage({super.key});

  @override
  State<AddPdfPage> createState() => _AddPdfPageState();
}

class _AddPdfPageState extends State<AddPdfPage> {

  final descriptionController=TextEditingController();
  final durationController=TextEditingController();
  final videoController=TextEditingController();
  final questionController=TextEditingController();
  final subjectController=TextEditingController();
  String pdfURL="";
  List<String> subjectList=["Math","Physics","Chemistry","Biology"];
  TextStyle textStyleBodyText1 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.3, color: Color.fromRGBO(59, 107, 170, 1),);

  List<Widget> widgets = [];
  var options = <TextEditingController>[];
  var scores = <TextEditingController>[];
  var fields=[];

  createField(){
    var optionController = TextEditingController();
    var scoreController = TextEditingController();
    options.add(optionController);
    scores.add(scoreController);
    return CustomContainer2(
      child:
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          SizedBox(
            width: 230,
            height: 80,
            child: 
           CustomTextField3(
              controller: optionController,
              hintText: "Add option",
          ),
          ),
          SizedBox(
            width: 50,
            height: 80,
            child:
          CustomTextField3(
              controller: scoreController,
              hintText: "Score",
              keyboardType: TextInputType.number,
           ),
          )
          ]),
    );
  }

  @override 
  void initState() {
    fields.add(createField());
    super.initState();
  }
  
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
            // const SizedBox(height: 10,),
          CustomContainer2(child: 
            Column(children: [
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("Question",style: textStyleBodyText1,),
                Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
              ],),),
               const SizedBox(height: 10,),
               CustomTextFieldArea(enabled: true, controller: questionController, hintText: "Type here",)
          ])
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
                itemCount: fields.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return 
                  Column(children: [
                  const SizedBox(height: 5,),
                  Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text("      Option ${index+1}",style: textStyleBodyText1,),
                  Text("*",style: textStyleBodyText1.copyWith(color: Colors.red),),
                  ],),),
                    fields[index]
                  ]);
                },
             ),
              const SizedBox(height: 10,),
              if(fields.length<=3)...{
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    fields.add(createField());
                  });
                },
                child: const Text("Add Options"))
              ])
              },
              if(fields.length>=3)...{
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              ElevatedButton(
                onPressed: () async {
                  if(subjectController.text.isEmpty){
                    Fluttertoast.showToast(msg: 'Subject is required');
                  }
                  else if(options.any((element) => element.text.isEmpty)){
                     Fluttertoast.showToast(msg: 'Fill all options please');
                  }
                  else if(scores.any((element) => element.text.isEmpty)){
                     Fluttertoast.showToast(msg: 'Please fill all scores');
                  }
                  else{
                  List map=[];
                  for(int i=0;i<options.length;i++){
                    map.add({
                      'text':options[i].text,
                      'score':int.parse(scores[i].text),
                    });
                  }
                    await FirebaseFirestore.instance.collection(subjectController.text).add({
                    'question':questionController.text,
                    'options':map,
                  });
                  Fluttertoast.showToast(msg: 'Question added successfully');
                  fields.clear();
                  options.clear();
                  scores.clear();
                  questionController.clear();
                  setState(() {
                    
                  });
                  }
                },
                child: const Text("Submit"))
              ])
              }
          ])
        ));
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