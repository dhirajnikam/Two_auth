import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal/controller/auth/login.dart';
import 'package:legal/controller/auth/register.dart';
import 'package:legal/services/database.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final Log = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterController>(
        initState: (_) async {
          Get.put(RegisterController()).user =
              await FirebaseDb().getUser(Log.uid.toString()
              );
        },
        builder: (_) {
         return
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Name: ${_.user.name}"),
                Text("User email: ${_.user.email}"),
                MaterialButton(
                  onPressed: () {
                    Log.Log_Out_User();
                  },
                  child: Text("LogOut"),
                )
              ],
            );
     
        },
      ),
    );
  }
}
