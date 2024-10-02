import 'package:brainbox/utils/app_theme.dart';
import 'package:brainbox/utils/routes.dart';
import 'package:brainbox/widget/button/main_button.dart';
import 'package:brainbox/widget/button/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  bool _isPhoneNumberFilled = false;

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _phoneNumberController.addListener(() {
      setState(() {
        _isPhoneNumberFilled = _phoneNumberController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.inkGrey,
      appBar: AppBar(
        backgroundColor: AppTheme.inkGrey,
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login Your Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: _isPhoneNumberFilled
                      ? Border.all(color: Colors.black, width: 2)
                      : null,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: _isPhoneNumberFilled
                          ? Colors.black
                          : Colors.grey[400],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: _phoneNumberController,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone number",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              MainButon(
                buttonText: "Verification",
                onPressed: () {
                  if (_phoneNumberController.text != "") {
                    context.push(
                        '${Routes.phoneOTPVerification}/${_phoneNumberController.text}');
                  }
                },
              ),
              const SizedBox(height: 20),
              SecondaryButton(buttonText: "Later")
            ],
          ),
        ),
      ),
    );
  }
}
