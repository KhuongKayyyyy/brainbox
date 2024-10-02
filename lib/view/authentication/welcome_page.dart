import 'package:brainbox/utils/custom_icon.dart';
import 'package:brainbox/view/authentication/login_page.dart';
import 'package:brainbox/view/authentication/sign_in_page.dart';
import 'package:brainbox/widget/item/login_method.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: SizedBox(
              height: 100,
              child: Image.asset(
                CustomIcon.robotIcon,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              "Welcome to BrainBox",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 39),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(210, 240, 232, 1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(5, 10),
                          ),
                        ]),
                    child: const Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200],
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          //other login method
          const LoginMethod(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
