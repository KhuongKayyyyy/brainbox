import 'package:flutter/material.dart';

import '../../utils/custom_icon.dart';

class HomeLandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    CustomIcon.robotIcon,
                  ),
                ),
                const SizedBox(height: 50,),
                const Text(
                  "Welcome to \n BrainBox",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Start chatting with ChattyAI now. You can ask me anything.",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}