import 'package:cloud_firestore/cloud_firestore.dart';

class LawyerModels {
  String uid;
  String name;
  String email;
  String img;
  String phoneNumber;
  String lawyerType;
  String state;
  String city;
  LawyerModels({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.img = '',
    this.phoneNumber = '',
    this.lawyerType = '',
    this.state = '',
    this.city = '',
  });

  factory LawyerModels.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    return LawyerModels(
      uid: documentSnapshot['uid'],
      name: documentSnapshot['name'],
      email: documentSnapshot['email'],
      img: documentSnapshot['img'],
      phoneNumber: documentSnapshot['phoneNumber'],
      lawyerType: documentSnapshot['lawyerType'],
      state: documentSnapshot['state'],
      city: documentSnapshot['city'],
    );
  }
}
