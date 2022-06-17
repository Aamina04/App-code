import 'package:ems/cores/location_provider.dart';
import 'package:ems/ui/myhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*
        Location Provider Global Varibale Like Employee Location Task Location etc
        Also Finding distance b/w task and Employee
        */
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);
  /*
      Only this Class made for override the My Class
      and Another Package for Get.dart 
  */
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
