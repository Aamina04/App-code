import 'package:ems/constants.dart';
import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      title:  Text(appBarText),
      elevation: 1000,
    );
  }
}
