import 'package:ems/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Login Button

class MyButton extends StatelessWidget {
  final String title;
  final onPressed;
  const MyButton({required this.title, required this.onPressed, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: TextButton(
          onPressed: onPressed,
          child: Container(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: bubbleColor),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
