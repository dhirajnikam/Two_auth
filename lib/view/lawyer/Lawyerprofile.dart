import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal/controller/auth/login.dart';
import 'package:legal/controller/auth/register.dart';
import 'package:legal/services/database.dart';

class LawyerProfile extends StatelessWidget {
  LawyerProfile({Key? key}) : super(key: key);

  final Log = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterController>(
        initState: (_) async {
          Get.find<RegisterController>().lawyer =
              await FirebaseDb().getLawyer(Log.uid.toString());
        },
        builder: (_) {
          if (_.lawyer.email != null) {
            return Column(
              children: [
                Text("Lawyer Name: ${_.lawyer.name}"),
                Text("Lawyer email: ${_.lawyer.email}"),
                MaterialButton(
                  onPressed: () {
                    Log.Log_Out_Lawyer();
                  },
                  child: Text("LogOut"),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
