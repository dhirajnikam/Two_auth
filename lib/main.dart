import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:legal/view/auth/getstarted.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:legal/view/auth/phone_verify.dart';
import 'package:legal/view/auth/Register.dart';
import 'package:legal/view/root/root.dart';
import 'package:legal/view/user/Userprofile.dart';



void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark // status bar color
      ));
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted()
    );
  }
}
