class OnboardingModel {
  final String imagePath;
  final String title;
  final String body;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.body,
  });
}

List<OnboardingModel> getOnBoardingList() {
  return [
    OnboardingModel(
      imagePath: 'assets/svgs/first_onboarding.svg',
      title: 'All Building Materials in One Place!',
      body: 'Find everything you need for your construction\nprojects with top-quality materials at\ncompetitive prices.',
    ),
    OnboardingModel(
      imagePath: 'assets/svgs/second_onboarding.svg',
      title: 'Engineering Community!',
      body: 'Communicate: Share ideas and collaborate,\nLearn: Access valuable resources, Support: Get\nhelp and offer advice, Innovate: Work on\ncutting-edge projects together.',
    ),
    OnboardingModel(
      imagePath: 'assets/svgs/third_onboarding.svg',
      title: 'Find Cracks Instantly!',
      body: 'Upload images of concrete surfaces, and our\nAI model will detect cracks with precision,\nhelping you identify issues before they grow.',
    ),
    OnboardingModel(
      imagePath: 'assets/svgs/last_onboarding.svg',
      title: 'Your Construction Assistant!',
      body: 'Chat with our AI for advice on concrete\nmanufacturing, construction best practices,\nand guidance on app features Your\nConstruction Assistant!',
    ),
  ];
}