import 'dart:async';  // Import for Timer
import 'package:brainbox/main_wrapper.dart';
import 'package:brainbox/utils/routes.dart';
import 'package:brainbox/view/splash/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:brainbox/utils/custom_icon.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double turns = 0.0;
  Timer? _rotationTimer;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _startRotation(); // Start the icon rotation
    _startSplashTimer(); // Start the timer for transitioning the screen
  }

  @override
  void dispose() {
    _rotationTimer?.cancel(); // Cancel the rotation timer
    _navigationTimer?.cancel(); // Cancel the navigation timer
    super.dispose();
  }

  void _startRotation() {
    _rotationTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        turns += 0.1;  // Increase rotation incrementally
      });
    });
  }

  void _startSplashTimer() {
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      context.go(Routes.onBoardPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 100,),
            const Spacer(),
            SizedBox(
              height: 80,
              child: AnimatedRotation(
                turns: turns,
                duration: const Duration(milliseconds: 10000),  // Smooth rotation
                child: Image.asset(
                  CustomIcon.sakuraIcon,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "BrainBox",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 30),
            ),
            const Text(
              "Version 1.0",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
