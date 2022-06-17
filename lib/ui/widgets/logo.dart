import 'package:ems/constants.dart';
import 'package:flutter/material.dart';
class MyAppLogo extends StatelessWidget {
  const MyAppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Image.asset(appLogo),
      ),
    );
  }
}
