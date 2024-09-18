import 'package:brainbox/data/models/ai_feature.dart';
import 'package:brainbox/widget/item/assistant_feature.dart';
import 'package:flutter/material.dart';

class AssistantFeatureByType extends StatelessWidget {
  String featureListName;
  List<AIFeature> featureList;

  AssistantFeatureByType(
      {required this.featureList, required this.featureListName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                featureListName,
                style:const TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon:const Icon(Icons.arrow_forward,color: Colors.grey,))
            ],
          ),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featureList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child:
                    AssistantFeature(aiFeature: featureList.elementAt(index)),
              );
            },
          ),
        )
      ],
    );
  }
}
