import 'package:flutter/material.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Continue With Accounts",
          style:
              TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(238, 204, 202, 1),
                  ),
                  child: const Center(
                    child: Text(
                      "GOOGLE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(212, 70, 56, 1)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(202, 212, 232, 1),
                  ),
                  child: const Center(
                    child: Text(
                      "FACEBOOK",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(66, 103, 178, 1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
