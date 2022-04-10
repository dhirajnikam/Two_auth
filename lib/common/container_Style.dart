import 'package:flutter/material.dart';

class ContainerStyle1 extends StatelessWidget {
  Icon icons;
  Container containerD;
  ContainerStyle1({
    Key? key,
    required this.icons,
    required this.containerD,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              child: icons,
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 1,
                color: Colors.grey.shade200,
              ),
            ),
            Container(
              height: 70,
              width: 200,
              child: containerD
            ),
          ],
        ),
      ),
    );
  }
}
