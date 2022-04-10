import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:legal/common/text_style.dart';

import 'package:lottie/lottie.dart';

import '../../controller/auth/login.dart';

class Login_Google extends StatelessWidget {
  Login_Google({Key? key}) : super(key: key);
  final login = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.amber.shade50, body: _body());
  }

  _body() {
    return Stack(
      children: [_backBody(), _fontBody()],
    );
  }

  _backBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: Get.height * 0.4,
            child: Lottie.asset(
              "assets/loti/92070-dvn-girl.json",
            )),
        Lottie.asset("assets/loti/68933-yellow-bubble.json"),
      ],
    );
  }

  _fontBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          _backButton(),
          SizedBox(
            height: Get.height * 0.3,
          ),
          _LoginTitle(),
          SizedBox(
            height: 10,
          ),
          _LoginDes(),
          SizedBox(
            height: Get.height * 0.2,
          ),
          Center(child: _googleButton())
        ],
      ),
    );
  }

  _backButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, blurRadius: 10),
          ],
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
    );
  }

  _LoginTitle() {
    return TextTitle(
      title: "Welcome ",
      colors: Colors.black,
      textAlign: TextAlign.left,
    );
  }

  _LoginDes() {
    return TextDescp(
      title:
          "Let's sign you in, This app allows you to search and book Lawyers near you, It also let's Lawyers find client, So sign in Accordingly!",
      colors: Colors.black,
      textAlign: TextAlign.left,
    );
  }

  _googleButton() {
    return GestureDetector(
      onTap: () {
        login.login_google();
      },
      child: Container(
          height: 60,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade100, blurRadius: 10),
              ]),
          child: GetBuilder<LoginController>(
            builder: (controller) =>
              controller.isloding
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 50,
                            child: Lottie.asset(
                                "assets/loti/38870-google-logo-effect.json")),
                        Text(
                          "SignIn with Google",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    )
                  : Center(child: Lottie.asset("assets/loti/google-loading.json"))
            
          )),
    );
  }
}
