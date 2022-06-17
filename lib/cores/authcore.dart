import 'package:get/get.dart';

class AuthState extends GetxController{
  bool isLogin = false;
  String name = "Aamina Jaddon";
  void initSate(){
    print("user Login State");
    print(isLogin);
    update();
  }
  void updateState(state){
    isLogin = state;
    update();
  }
  void handleLogin({required email,required password}){
    print('Login with email : ' + email);
    print('Login with password : ' +password);
    isLogin = true;
    update();
  }
  void handleLogOut(){
    print("log Out");
    isLogin = false;
    update();
  }
}