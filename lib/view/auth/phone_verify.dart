import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal/common/container_Style.dart';
import 'package:legal/common/text_style.dart';
import 'package:legal/controller/auth/login.dart';
import 'package:lottie/lottie.dart';

class Phone_verfiy extends StatelessWidget {
  Phone_verfiy({Key? key}) : super(key: key);
  final login = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()
    );
  }
  
  _body() {
    return SingleChildScrollView(
      child: GetBuilder<LoginController>(
        init: LoginController(),
        initState: (_) {},
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                height: Get.height * 0.4,
                child: Lottie.asset("assets/loti/44136-send-a-message.json",
                    repeat: false),
              ),
                _phone(),
                const SizedBox(
                  height: 10,
                ),
                Visibility(visible: _.otpVisibility, child: _visOTP()),
                const SizedBox(
                  height: 10,
                ),
                _button(),
              ],
            ),
          );
        },
      ),
    );
  }

  _phone() {
    return ContainerStyle1(
        icons: Icon(Icons.phone),
        containerD: Container(
          child: TextField(
              autofocus: false,
              controller: login.phoneController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91'),
                  ),
                  border: InputBorder.none)),
        ));
  }

  _visOTP() {
    return ContainerStyle1(
        icons: Icon(Icons.lock),
        containerD: Container(
          child: TextField(
              autofocus: false,
              controller: login.otpController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  border: InputBorder.none)),
        ));
  }

  _button() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            login.otpVisibility ? login.verifyOTP() : login.phone_login();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        TextDescp(
            title: login.otpVisibility ? "Login" : "Verify",
            colors: Colors.black,
            textAlign: TextAlign.center)
      ],
    );
  }
}
