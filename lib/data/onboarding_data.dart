import 'package:expenz/models/onboarding_model.dart';

class OnboardingData {
  static final List<Onboarding> onboardingDataList = [
    Onboarding(
      title: 'Gain total control of your money',
      imagePath: 'assets/images/onboard_1.png',
      description:
          'Track your expenses effortlessly and manage your budget with ease.',
    ),
    Onboarding(
      title: 'Know where your money goes',
      imagePath: 'assets/images/onboard_2.png',
      description:
          'Get insights into your spending habits with detailed reports and charts.',
    ),
    Onboarding(
      title: 'Planning ahead made easy',
      imagePath: 'assets/images/onboard_3.png',
      description:
          'Set budgets, save money, and reach your financial goals faster than ever.',
    ),
  ];
}
