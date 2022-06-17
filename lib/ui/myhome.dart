import 'package:ems/cores/authcore.dart';
import 'package:ems/ui/screans/homepage.dart';
import 'package:ems/ui/screans/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyHomePage> {
  // Auth State State Object
  final authState = Get.put(AuthState());
  @override
  void initState() {
    // Initializ the user is login or not
    super.initState();
    authState.initSate();
  }

  @override
  Widget build(BuildContext context) {
    /// Navigator to Home Screen if User is Login else Login Screen
    return authState.isLogin == false ? const LoginPage() : HomePage();
  }
}
