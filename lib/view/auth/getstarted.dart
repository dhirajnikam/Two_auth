import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal/common/text_style.dart';

import 'package:lottie/lottie.dart';

import '../../controller/welcome/welcome.dart';

class GetStarted extends StatelessWidget {
  GetStarted({Key? key}) : super(key: key);
  final welcome = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _body());
  }

 
  _body() {
    return Stack(
      children: [_background(), _font()],
    );
  }

  _background() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Lottie.asset("assets/loti/68933-yellow-bubble.json"),
        Lottie.asset("assets/loti/86228-yellow-shape.json")
      ],
    );
  }

  _font() {
    return PageView.builder(
        controller: welcome.controller,
        itemCount: welcome.count,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _img(index),
                SizedBox(
                  height: 30,
                ),
                _title(index),
                SizedBox(
                  height: 30,
                ),
                _discrip(index),
                SizedBox(
                  height: 30,
                ),
                _indicator(index),
                SizedBox(
                  height: 30,
                ),
                _button(index)
              ],
            ),
          );
        }));
  }

  _img(index) {
    return Container(
      height: 300,
      width: double.maxFinite,
      child: Image(image: AssetImage(welcome.startlist[index].img)),
    );
  }

  _title(index) {
    return TextTitle(
      title: welcome.startlist[index].title,
      colors: Colors.black,
      textAlign: TextAlign.center,
    );
  }

  _discrip(index) {
    return Container(
        height: 70,
        child: TextDescp(
          title: welcome.startlist[index].desp,
          colors: Colors.black,
          textAlign: TextAlign.center,
        ));
  }

  _indicator(index) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            welcome.startlist.length,
            (dotindex) => Container(
                  margin: EdgeInsets.only(right: 5),
                  width: index == dotindex ? 25 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index == dotindex
                          ? Colors.brown.shade100
                          : Colors.grey.shade100),
                )));
  }

  _button(index) {
    return GestureDetector(
      onTap: () {
        welcome.nextpage(index);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            height: 70,
            width: 70,
            child: Lottie.asset("assets/loti/28241-right-arrow.json",
                repeat: true),
          )
        ],
      ),
    );
  }
}
