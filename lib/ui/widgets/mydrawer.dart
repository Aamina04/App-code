import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ems/constants.dart';
import 'package:ems/cores/authcore.dart';
import 'package:ems/ui/myhome.dart';
import 'package:ems/ui/screans/myaccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final authState = Get.put(AuthState());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15,bottom: 15),
            color: drawerBackgroundColor,
            child: Column(
              children: [
                SafeArea(child: SizedBox(
                  child: Image.asset('assets/your-location.png'),
                  height: 60,
                  width: 60,
                ),),
                 const SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(drawerText,style:const TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.white,
                     ),),
                   ],
                 ),
              ],
            ),
          ),
          ListTile(
            leading:const Icon(BootstrapIcons.list_task),
            title:const Text("Profile Page"),
            onTap: (){
              Get.to(() => const MyAccountHome());
            },
          ),
          ListTile(
            leading:const Icon(BootstrapIcons.recycle,color: Colors.red,),
            title:const Text("Log Out"),
            onTap: (){
              authState.handleLogOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyHomePage()));
            },
          ),
        ],
      ),
    );
  }
}
