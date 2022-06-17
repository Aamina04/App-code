import 'package:ems/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginBar extends StatelessWidget {
  const LoginBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle style({required size}){
      return GoogleFonts.poppins(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
    }
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          decoration: const BoxDecoration(
            color: bubbleColor,
            borderRadius:  BorderRadius.only(
              bottomRight: Radius.circular(230.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(welcome,style: style(size: 22.0)),
                const SizedBox(height: 5,),
                Text(loginString,style: style(size: 40.0)),
              ],
          ),
        ),
      ],
    );
  }
}
