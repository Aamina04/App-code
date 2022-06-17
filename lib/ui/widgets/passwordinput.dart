import 'package:ems/constants.dart';
import 'package:flutter/material.dart';
class MyPasswordInput extends StatefulWidget {
  final TextEditingController password;
  const MyPasswordInput({required this.password,Key? key}) : super(key: key);
  @override
  State<MyPasswordInput> createState() => _MyPasswordInputState();
}

class _MyPasswordInputState extends State<MyPasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: textFieldColor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          controller: widget.password,
          decoration: const InputDecoration(
            hintText: "Enter Password",
            hintStyle: TextStyle(fontSize: 18, color: Colors.white70, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
