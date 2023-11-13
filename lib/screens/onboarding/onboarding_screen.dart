import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/page_indicator.dart';
import 'package:golly_express/providers/onboarding_providers.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(onboardingPageIndexProvider);
    final onboardingItems = ref.watch(onboardingItemsProvider);

    updatePageIndex(int index) {
      ref.read(onboardingPageIndexProvider.notifier).state = index;
    }

    final pageController = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: 3,
            onPageChanged: updatePageIndex,
            itemBuilder: (BuildContext context, int position) {
              return Container(
                color: onboardingItems[position].backgroundColor,
                child: Center(
                  child: onboardingItems[position].backgroundImage,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: .374,
              child: OnboardingCutOut(
                title: onboardingItems[currentPageIndex].title,
                description: onboardingItems[currentPageIndex].description,
                onGetStartedClick: () {
                  // context.go('/signup');
                  // setUserOnboardStatus(true);
                  // updatePageIndex;
                  currentPageIndex == 2
                      ? context.go("/login")
                      : pageController.nextPage(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 200),
                        );
                },
                pageIndicator: PageIndicator(
                  numberOfIndicators: onboardingItems.length,
                  // currentIndex: currentPageIndex % 3,    //infinite scroll glitch
                  currentIndex: currentPageIndex,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () => context.go("/login"),
              // onPressed: () => context.go("/login"),
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingCutOut extends StatelessWidget {
  final String title;
  final String description;
  final Widget pageIndicator;

  // final TabController? controller;
  final void Function()? onGetStartedClick;

  const OnboardingCutOut({
    super.key,
    required this.title,
    required this.description,
    required this.onGetStartedClick,
    required this.pageIndicator,
    // this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: pageIndicator,
              ),
              AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 16),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFA3ADAA),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomButton(
              borderRadius: 8,
              isEnabled: true,
              onPressed: onGetStartedClick,
              buttonText: "Get Started",
            ),
          ),
        ],
      ),
    );
  }
}
