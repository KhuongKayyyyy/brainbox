import 'package:brainbox/data/models/fake_data.dart';
import 'package:brainbox/widget/item/assistant_feature_by_type.dart';
import 'package:flutter/material.dart';

class AssistantLandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("AI Assistant",style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            AssistantFeatureByType(featureList: FakeData.socialMedia,featureListName: "Social Media",),
            const SizedBox(height: 20,),
            AssistantFeatureByType(featureList: FakeData.health,featureListName: "Health",),
            const SizedBox(height: 20,),
            AssistantFeatureByType(featureList: FakeData.sports,featureListName: "Sports",),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}