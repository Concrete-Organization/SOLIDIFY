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
      imagePath: 'assets/images/first_onboarding.png',
      title: 'All Building Materials in One Place!',
      body: 'Find everything you need for your construction\nprojects with top-quality materials at\ncompetitive prices.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/first_onboarding.png',
      title: 'Consult Experts for Your Project!',
      body: 'Book an appointment with professional\nengineers for consultations and expert\nopinions on your project’s progress.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/first_onboarding.png',
      title: 'Find Cracks Instantly!',
      body: 'Upload images of concrete surfaces, and our\nAI model will detect cracks with precision,\nhelping you identify issues before they grow.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/first_onboarding.png',
      title: 'Your Construction Assistant!',
      body: 'Chat with our AI for advice on concrete\nmanufacturing, construction best practices,\nand guidance on app features Your\nConstruction Assistant!',
    ),
  ];
}