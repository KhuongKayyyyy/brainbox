import 'package:brainbox/widget/button/main_button.dart';
import 'package:brainbox/widget/button/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatting
import 'package:go_router/go_router.dart';

import '../../utils/app_theme.dart';

class PhoneOTPVerificationPage extends StatelessWidget {
  final String phoneNumber;
  PhoneOTPVerificationPage({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(10, -5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(10, 5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(-10, 10),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensure the height wraps content
              children: [
                const Text(
                  "Verify Phone Number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "We have sent a code to your phone number",
                  style: TextStyle(color: Colors.grey[400]),
                ),
                const SizedBox(height: 20),
                Text(
                  "+84$phoneNumber",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Row for OTP input squares
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildOtpBox(context), // OTP box 1
                    const SizedBox(width: 20), // Space between boxes
                    _buildOtpBox(context),
                    const SizedBox(width: 20), // Space between boxes
                    _buildOtpBox(context), // OTP box 1
                    const SizedBox(width: 20), // Space between boxes
                    _buildOtpBox(context),
                  ],
                ),
                const SizedBox(height: 50),
                MainButon(buttonText: "Verify"),
                const SizedBox(height: 10),
                SecondaryButton(buttonText: "Send Again"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build a square OTP box
  Widget _buildOtpBox(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          maxLength: 1,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
