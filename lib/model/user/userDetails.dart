
import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel  {
  String uid;
  String name;
  String email;
  String img;
  String phoneNumber;
  String state;
  String city;
  UserModel({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.img = '',
    this.phoneNumber = '',
    this.state = '',
    this.city = '',
  });

  factory UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    return UserModel(
      uid: documentSnapshot['uid'],
      name: documentSnapshot['name'],
      email: documentSnapshot['email'],
      img: documentSnapshot['img'] ,
      phoneNumber: documentSnapshot['phoneNumber'] ,
      state: documentSnapshot['state'] ,
      city: documentSnapshot['city'] ,
    );
  }

  
}
