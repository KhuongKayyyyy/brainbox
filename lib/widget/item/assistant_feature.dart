import 'package:brainbox/data/models/ai_feature.dart';
import 'package:flutter/material.dart';

class AssistantFeature extends StatelessWidget {
  AIFeature aiFeature;

  AssistantFeature({super.key, required this.aiFeature});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Image.asset(aiFeature.featureIcon),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            aiFeature.featureName,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            aiFeature.featureDescription,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
