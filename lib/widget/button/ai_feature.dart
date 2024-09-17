import 'package:brainbox/utils/custom_icon.dart';
import 'package:flutter/material.dart';

class AIFeature extends StatelessWidget{
  Color backcolor;
  String feature;
  String icon;
  AIFeature({required this.backcolor,required this.feature, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backcolor,
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
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(icon),
                ),
                const Spacer(),
                Transform.rotate(
                  angle: -45 * 3.1415927 / 180,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            Text(feature),
          ],
        ),
      ),
    );
  }
}