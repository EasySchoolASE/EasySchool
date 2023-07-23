
class VideoModel{
String? duration;
String? subject;
String? videoLink;
String? photoLink;
String? title;
String? pdfURL;

VideoModel({this.duration,this.subject,this.videoLink,this.photoLink,this.title, this.pdfURL});

//getting data from server
factory VideoModel.fromMap(map){
  return VideoModel(
    duration: map['duration'],
    subject: map['subject'],
    videoLink: map['videoLink'],
    photoLink: map['photoLink'],
    title: map['title'],
    pdfURL: map['pdfLink']
  );
}

//sending data to server
Map<String, dynamic> toMap(){
  return {
    'duration': duration,
    'subject': subject,
    'videoLink': videoLink,
    'photoLink':photoLink,
    'title': title,
    'pdfLink':pdfURL,
  };
}

}