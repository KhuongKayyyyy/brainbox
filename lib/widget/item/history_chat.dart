import 'package:flutter/material.dart';

class HistoryChat extends StatelessWidget{
  String chatTitle;
  HistoryChat({required this.chatTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.all(15),
      child: Text(chatTitle,style: const TextStyle(color: Colors.grey),),
    );
  }
}