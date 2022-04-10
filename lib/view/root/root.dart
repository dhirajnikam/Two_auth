import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:legal/controller/auth/login.dart';
import 'package:legal/controller/auth/register.dart';
import 'package:legal/services/database.dart';
import 'package:legal/view/auth/Register.dart';
import 'package:legal/view/auth/getstarted.dart';
import 'package:legal/view/auth/phone_verify.dart';
import 'package:legal/view/lawyer/Lawyerprofile.dart';
import 'package:legal/view/user/Userprofile.dart';

class Root extends StatefulWidget {
  Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final Reg = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FutureBuilder(builder: builder)
    );
  }
}
