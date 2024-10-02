import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  String buttonText;
  VoidCallback? onPressed;

  SecondaryButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        height: 60,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
