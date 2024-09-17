import 'package:brainbox/main_wrapper.dart';
import 'package:brainbox/utils/app_theme.dart';
import 'package:brainbox/view/authentication/sign_in_page.dart';
import 'package:brainbox/widget/button/main_button.dart';
import 'package:brainbox/widget/item/login_method.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _isEmailFilled = false;
  bool _isPasswordFilled = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _isEmailFilled = _emailController.text.isNotEmpty;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _isPasswordFilled = _passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //this is use for validation in the future
  bool get _isCompletedInformed => _isEmailFilled && _isPasswordFilled;
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
          FocusScope.of(context).unfocus(); // Unfocus the text field when tapping outside
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
                  border: _isEmailFilled ? Border.all(color: Colors.black, width: 2) : null, // Black border if filled
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: _isEmailFilled ? Colors.black : Colors.grey[400], // Change icon color if filled
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your email",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: _isPasswordFilled ? Border.all(color: Colors.black, width: 2) : null,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      color: _isPasswordFilled ? Colors.black : Colors.grey[400], // Change icon color if filled
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              MainButon(buttonText: "Login",onPressed: (){
                context.go(Routes.homeLandingPage);
              },),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Create new account? ",
                        style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          context.push(Routes.signUp);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Divider(color: Colors.grey[300],),
              const SizedBox(height: 30),
              LoginMethod(),
            ],
          ),
        ),
      ),
    );
  }
}
