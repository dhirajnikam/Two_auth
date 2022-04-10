import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal/common/container_Style.dart';
import 'package:legal/common/text_style.dart';
import 'package:legal/controller/auth/register.dart';

import '../../controller/auth/login.dart';

class RegDet extends StatelessWidget {
  RegDet({Key? key}) : super(key: key);
  final login = Get.put(LoginController());
  final Reg = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children: [_fontBody(), _backBody()],
    ));
  }

  _body() {
    Stack(
      children: [_fontBody(), _backBody()],
    );
  }

  _fontBody() {
    return Container(
      width: Get.width,
      height: Get.height * 0.85,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 10),
        ],
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [_welcome(), _img()],
              ),
            ),
            _phoneVerf(),
            _phone(),
            SizedBox(
              height: 30,
            ),
            _nameVerf(),
            _name(),
            SizedBox(
              height: 30,
            ),
            _emailVerf(),
            _email(),
            SizedBox(
              height: 30,
            ),
            _textUserLawyer()
          ],
        ),
      ),
    );
  }

  _welcome() {
    return Container(
      // height: 120,
      width: 200,
      child: TextDescp(
          title: "Welcome ${login.name} to legal seva",
          colors: Colors.black,
          textAlign: TextAlign.left),
    );
  }

  _img() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(login.Pimg.toString()),
      ),
    );
  }

  _phoneVerf() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextDescp(
              title: "Phone Number",
              colors: Colors.black,
              textAlign: TextAlign.left),
          Icon(
            Icons.verified,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  _phone() {
    return ContainerStyle1(
        icons: Icon(Icons.phone),
        containerD: Container(
          alignment: Alignment.center,
          child: Text(
            login.phone.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ));
  }

  _nameVerf() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextDescp(
              title: "Name", colors: Colors.black, textAlign: TextAlign.left),
          Icon(
            Icons.verified,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  _name() {
    return ContainerStyle1(
        icons: Icon(Icons.person),
        containerD: Container(
          alignment: Alignment.center,
          child: Text(
            login.name.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ));
  }

  _emailVerf() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextDescp(
              title: "Email Address",
              colors: Colors.black,
              textAlign: TextAlign.left),
          Icon(
            Icons.verified,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  _email() {
    return ContainerStyle1(
        icons: Icon(Icons.email),
        containerD: Container(
          alignment: Alignment.center,
          child: Text(
            login.email.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ));
  }

  _textUserLawyer() {
    return TextDescp(
        title: "Once Register as User or Lawyer it can't be change",
        colors: Colors.black,
        textAlign: TextAlign.center);
  }

  _backBody() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Get.height * 0.15,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_createLawyer(), _createUser()],
            )
          ],
        ),
      ),
    );
  }

  _createLawyer() {
    return InkWell(
      onTap: () {
        Reg.createLawyer();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100, blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.amber.shade100)),
        child: Center(child: Text("Lawyer")),
      ),
    );
  }

  _createUser() {
    return InkWell(
      onTap: () {
        Reg.createUser();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, blurRadius: 10),
          ],
          color: Colors.amber.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text("Users")),
      ),
    );
  }
}
