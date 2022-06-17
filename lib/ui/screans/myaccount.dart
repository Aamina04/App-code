import 'package:ems/cores/authcore.dart';
import 'package:ems/ui/myhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountHome extends StatefulWidget {
  const MyAccountHome({Key? key}) : super(key: key);
  @override
   createState() => MyAccountHomeState();
}

class MyAccountHomeState extends State<MyAccountHome> {
  final auth = Get.put(AuthState());
  Widget _builtTile(what,text,onPressed){
    return Container(
      margin: const EdgeInsets.only(left: 5,right: 5,top: 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
        color: Colors.white,
        child: ListTile(
          leading: Text(what),
          title: Text(text,style:const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
            color: Colors.black,
          ),),
          onTap: onPressed,
        ),
      ),
    );
  }
  Widget userHeader(){
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 140,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 244, 225, 54),
            radius: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20,top: 10),
                    child:  Text(auth.name,style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget actionButton(text,onPressed,color){
    return GestureDetector(
      onTap: onPressed,
      child:Container(
        padding: const EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(text,style:const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
        ),),
      ),
    );
  }
  Widget logoutTile(context){
    return Container(
      margin: const EdgeInsets.only(left: 5,right: 5),
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
        color: Colors.white,
        child: Center(
          heightFactor: 2.5,
          child: GestureDetector(
            child: const Text("Logout",style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
              color: Colors.red,
            ),),
            onTap: (){
              auth.isLogin = false;
              final newRoute = MaterialPageRoute(builder: (context) => const MyHomePage());
              Navigator.pushReplacement(context, newRoute);
            },
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
           userHeader(),
          _builtTile('email',"amminajadoon@gmail.com",(){}),
          _builtTile("contact","0316-5404005",(){}),
          _builtTile("address","Abbottabad",(){}),
           logoutTile(context),
        ],
      ),
    );
  }
}
