import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthState extends GetxController {
  bool isLogin = false;
  final String _base_url =
      "http://192.168.12.208/emptrac/emptrac/apis/login.php";
  String name = "Aamina Jaddon";
  void initSate() {
    print("user Login State");
    print(isLogin);
    update();
  }

  void updateState(state) {
    isLogin = state;
    update();
  }

  Future<void> handleLogin({required email, required password}) async {
    print('Login with email : ' + email);
    print('Login with password : ' + password);

    try {
      final response =
          await Dio().get(_base_url + '?userid=$email&&password=$password');
      if (response.statusCode == 200) {
        print('response data >>>>');
        var data = json.decode(response.data);
        if (data['response'] == 1) {
          isLogin = true;
          print('value of isLogin = $isLogin');
          update();
        } else {
          print('else con');
        }
      } else {
        print('======');
        print('testing');
      }
    } catch (e) {
      print("Failed to Get All Tasks : $e");
    }

    // isLogin = true;
    // update();
  }

  void handleLogOut() {
    print("log Out");
    isLogin = false;
    update();
  }
}
