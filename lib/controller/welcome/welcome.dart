import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legal/view/auth/login.dart';

import '../../model/welcome/start.dart';

class WelcomeController extends GetxController {
 

  List<start> startlist = [
    start(
        title: "Family Law",
        desp: "We have the list of lawyers available near you",
        img: "assets/getstart/1.png"),
    start(
        title: "Corporate Law",
        desp: "No matter what your need is",
        img: "assets/getstart/2.png"),
    start(
        title: "We got it", desp: "Get Started!", img: "assets/getstart/3.png")
  ];

  int get count {
    return startlist.length;
  }

  List<start> get _startList {
    return [...startlist];
  }

  PageController _pageController = PageController();

  PageController get controller {
    return _pageController;
  }

  void nextpage(int index) {
    if (index == 2) {
      Get.to(Login_Google());
      print("Get Started");
    } else {
      _pageController.animateToPage(index + 1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
