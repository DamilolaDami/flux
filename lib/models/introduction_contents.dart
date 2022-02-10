import 'package:fluxstore/animations/lotties.dart';
import 'package:fluxstore/constants/images.dart';

class OnboardingStuffs {
  String img;
  String title;
  String description;
  OnboardingStuffs(
      {required this.img, required this.description, required this.title});
}

List<OnboardingStuffs> stuffs = [
  OnboardingStuffs(
      img: recom,
      title: 'Get Meal Recommendation',
      description:
          'We will recommend you a meal based on your preferences and your location '),
  OnboardingStuffs(
      img: ontime,
      title: 'Well Packaged Meals',
      description:
          'We will provide you with well packaged meals that are easy to eat and healthy '),
  OnboardingStuffs(
      img: ontime,
      title: 'On-Time Delivery',
      description: 'We will deliver your meals on time to your doorstep '),
];
