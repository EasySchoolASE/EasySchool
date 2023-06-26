
class UserModel{
String? uid;
String? firstName;
String? secondName;
String? email;
String? password;

UserModel({this.uid,this.firstName,this.secondName,this.email,this.password});

//getting data from server
factory UserModel.fromMap(map){
  return UserModel(
    uid: map['uid'],
    firstName: map['firstName'],
    secondName: map['secondName'],
    email: map['email'],
    password: map['password'],
  );
}

//sending data to server
Map<String, dynamic> toMap(){
  return {
    'uid': uid,
    'firstName': firstName,
    'secondName': secondName,
    'email':email,
     'password': password,
  };
}

}