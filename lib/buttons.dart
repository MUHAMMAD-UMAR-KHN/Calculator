import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.color, this.textColor, required this.buttonText, this.onTapped});

final color;
final textColor;
final String buttonText;
final onTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(child: Text(buttonText,style: TextStyle(color: textColor,fontSize: 20),),),
          )),
      ),
    );
  }
}