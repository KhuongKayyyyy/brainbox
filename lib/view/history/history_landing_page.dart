import 'package:brainbox/utils/custom_icon.dart';
import 'package:flutter/material.dart';

import '../../widget/item/history_chat.dart';

class HistoryLandingPage extends StatelessWidget {
  const HistoryLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "History",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.edit_note_rounded))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[100]),
                        padding: const EdgeInsets.all(15),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.search_rounded,
                              size: 30,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search ...",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SizedBox(
                        height: 50,
                        child: Image.asset(CustomIcon.filter),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: HistoryChat(chatTitle: "How much PushUp A Day"),
                      );
                    },
                  ),
                ),
                const Text(
                  "Yesterday",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: HistoryChat(chatTitle: "How much PushUp A Day"),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
