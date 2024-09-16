import 'package:flutter/material.dart';

class MainButon extends StatelessWidget {
  String buttonText;
  VoidCallback? onPressed;

  MainButon({required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        height: 60,
        child: Center(
            child: Text(buttonText,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
        ),
      ),
    );
  }
}
