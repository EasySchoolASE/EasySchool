
class VideoModel{
String? duration;
String? subject;
String? videoLink;
String? photoLink;
String? title;
String? pdfURL;
String? quizPdfURL;

VideoModel({this.duration,this.subject,this.videoLink,this.photoLink,this.title, this.pdfURL, this.quizPdfURL});

//getting data from server
factory VideoModel.fromMap(map){
  return VideoModel(
    duration: map['duration'],
    subject: map['subject'],
    videoLink: map['videoLink'],
    photoLink: map['photoLink'],
    title: map['title'],
    pdfURL: map['pdfLink'],
    quizPdfURL: map['quizPdfLink']
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
    'quizPdfLink':quizPdfURL,
  };
}

}