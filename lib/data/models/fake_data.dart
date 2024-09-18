import 'package:brainbox/data/models/ai_feature.dart';
import 'package:brainbox/utils/custom_icon.dart';

class FakeData{
  //social media assistant
  static AIFeature tiktok = AIFeature(featureName: "Tiktok", featureDescription: "Generate my video Hashtag", featureIcon: CustomIcon.tiktok);
  static AIFeature telegram = AIFeature(featureName: "Telegram", featureDescription: "Generate popular Channels in telegram", featureIcon: CustomIcon.telegram);
  static AIFeature instagram = AIFeature(featureName: "Instagram", featureDescription: "Generate my trending Hashtag", featureIcon: CustomIcon.instagram);
  static AIFeature twitter = AIFeature(featureName: "Twitter", featureDescription: "Generate my trending Tweet", featureIcon: CustomIcon.twitter);

  //healthcare assistant
  static AIFeature medicine = AIFeature(featureName: "Medicine", featureDescription: "Generate text for all my medicine", featureIcon: CustomIcon.medicine);
  static AIFeature disease = AIFeature(featureName: "Disease", featureDescription: "Generate text for all disease problems", featureIcon: CustomIcon.genes);
  static AIFeature nature = AIFeature(featureName: "Nature", featureDescription: "Generate text for Natural Disease", featureIcon: CustomIcon.nature);
  static AIFeature anatomy = AIFeature(featureName: "Anatomy", featureDescription: "Generate text for Anatomy Learn", featureIcon: CustomIcon.anatomy);
  //sports assistant
  static AIFeature football = AIFeature(
      featureName: "Football",
      featureDescription: "Generate personalized hashtags for your football video content",
      featureIcon: CustomIcon.football
  );
  static AIFeature gym = AIFeature(
      featureName: "Gym",
      featureDescription: "Generate personalized hashtags for your gym video content",
      featureIcon: CustomIcon.basketball
  );

  static AIFeature basketball = AIFeature(
      featureName: "Basketball",
      featureDescription: "Generate personalized hashtags for your basketball video content",
      featureIcon: CustomIcon.basketball
  );

  static AIFeature baseball = AIFeature(
      featureName: "Baseball",
      featureDescription: "Generate personalized hashtags for your baseball video content",
      featureIcon: CustomIcon.baseball
  );

  static AIFeature swimming = AIFeature(
      featureName: "Baseball",
      featureDescription: "Generate personalized hashtags for your swimming video content",
      featureIcon: CustomIcon.baseball
  );

  static List<AIFeature> socialMedia = [tiktok,telegram,twitter,instagram];
  static List<AIFeature> health = [medicine, disease, nature, anatomy];
  static List<AIFeature> sports = [football, basketball, baseball, swimming];
}