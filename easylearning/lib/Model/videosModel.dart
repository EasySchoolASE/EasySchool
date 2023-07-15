
class VideoModel{
String? duration;
String? subject;
String? videoLink;
String? photoLink;
String? title;

VideoModel({this.duration,this.subject,this.videoLink,this.photoLink,this.title});

//getting data from server
factory VideoModel.fromMap(map){
  return VideoModel(
    duration: map['duration'],
    subject: map['subject'],
    videoLink: map['videoLink'],
    photoLink: map['photoLink'],
    title: map['title'],
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
  };
}

}