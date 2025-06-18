import 'package:e_commerce/features/Authantication/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentpage = 0;
  final PageController _pageController = PageController();

  // Onboarding content data
  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Choose your Product',
      'description':
          'Welcome to the world of limitless choices - Your Perfect Product is waiting',
      'image': 'assets/Animation1.gif',
    },
    {
      'title': 'Fast & Secure Payment',
      'description':
          'Shop with confidence using our secure payment methods and fast checkout process',
      'image': 'assets/Animation1.gif',
    },
    {
      'title': 'Quick Delivery',
      'description':
          'Get your products delivered to your doorstep with our reliable delivery service',
      'image': 'assets/Animation1.gif',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _skipOnboarding() async {
    final box = GetStorage();
    await box.write('seenOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void _nextPage() {
    if (currentpage == onboardingData.length - 1) {
      _skipOnboarding();
    } else {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentpage = value;
                });
              },
              children: onboardingData.map((data) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 60),
                      Image.asset(data['image']!, height: 300, width: 300),
                      SizedBox(height: 40),
                      Text(
                        data['title']!,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        data['description']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            // Skip button
            Positioned(
              top: 20,
              right: 20,
              child: TextButton(
                onPressed: _skipOnboarding,
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),

            // Page indicator
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                    expansionFactor: 4,
                    activeDotColor: const Color.fromARGB(255, 108, 83, 245),
                  ),
                ),
              ),
            ),

            // Next/Get Started button
            Positioned(
              bottom: 40,
              right: 20,
              child: ElevatedButton(
                onPressed: _nextPage,
                child: Icon(
                  currentpage == onboardingData.length - 1
                      ? Icons.check
                      : Icons.arrow_right_alt,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: const Color.fromARGB(255, 108, 83, 245),
                  padding: EdgeInsets.all(16),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
