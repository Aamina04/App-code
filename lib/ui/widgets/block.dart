import 'package:flutter/material.dart';
class HomeBlock extends StatelessWidget {
  final String title;
  final int quantity;
  final String icon;
  final Color backgroundColor;
  const HomeBlock({required this.title,required this.quantity,required this.icon,required this.backgroundColor,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: backgroundColor,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 50,
            child: Center(
              child: Image.asset(icon),
            ),
          ),
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(title,style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                Text(quantity.toString(),style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),),
                const SizedBox(height: 10,),
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}
