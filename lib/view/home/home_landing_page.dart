// Đặt tất cả các import ở đầu file
import 'package:brainbox/widget/button/ai_feature.dart';
import 'package:brainbox/widget/button/main_button.dart';
import 'package:flutter/material.dart';
import '../../utils/custom_icon.dart';

class HomeLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 100,
                child: Image.asset(
                  CustomIcon.robotIcon,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Welcome to \n BrainBox",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Start chatting with ChattyAI now. You can ask me anything.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              // Feature section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(198, 244, 50, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      shape: BoxShape.circle
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(CustomIcon.talk),
                                ),
                                const Spacer(),
                                Transform.rotate(
                                  angle: -45 * 3.1415927 / 180,
                                  child: const Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50,),
                            const Text("Talk with Bot",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(192, 159, 248, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.2),
                                          shape: BoxShape.circle
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Image.asset(CustomIcon.chat),
                                    ),
                                    const Spacer(),
                                    Transform.rotate(
                                      angle: -45 * 3.1415927 / 180,
                                      child: const Icon(Icons.arrow_forward),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                const Text("Chat with Bot",style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(254, 196, 221, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.2),
                                          shape: BoxShape.circle
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Image.asset(CustomIcon.image),
                                    ),
                                    const Spacer(),
                                    Transform.rotate(
                                      angle: -45 * 3.1415927 / 180,
                                      child: const Icon(Icons.arrow_forward),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                const Text("Search by Image",style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MainButon(buttonText: "Get Started"),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
