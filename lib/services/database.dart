import 'package:legal/model/lawyers/lawyerDetails.dart';
import 'package:legal/model/user/userDetails.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDb {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  
  
  Future<bool> addUser(UserModel userModel) async {
    try {
      await firebaseFirestore.collection('Users').doc(userModel.uid).set({
        'uid': userModel.uid,
        'name': userModel.name,
        'email': userModel.email,
        'img': userModel.img,
        'phoneNumber': userModel.phoneNumber,
        'state': userModel.state,
        'city': userModel.city
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await firebaseFirestore.collection("Users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> addLawyer(LawyerModels lawyerModels) async {
    try {
      await firebaseFirestore.collection('Lawyers').doc(lawyerModels.uid).set({
        'uid': lawyerModels.uid,
        'name': lawyerModels.name,
        'email': lawyerModels.email,
        'img': lawyerModels.img,
        'lawyerType': lawyerModels.lawyerType,
        'phoneNumber': lawyerModels.phoneNumber,
        'state': lawyerModels.state,
        'city': lawyerModels.city
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<LawyerModels> getLawyer(String uid) async {
    try {
      DocumentSnapshot _doc =
          await firebaseFirestore.collection('Lawyers').doc(uid).get();
      return LawyerModels.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
