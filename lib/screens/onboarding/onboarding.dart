import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/page_indicator.dart';
import 'package:golly_express/providers/providers.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final captions = ref.watch(onboardingCaptionProvider);
    final descriptions = ref.watch(onboardingDescriptionProvider);
    final currentPageIndex = ref.watch(onboardingPageIndexProvider);

    updatePageIndex(int index) {
      ref.read(onboardingPageIndexProvider.notifier).state = index;
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: updatePageIndex,
            itemBuilder: (_, __) => Container(color: const Color(0xFFE6EDB7)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: .374,
              child: OnboardingCutOut(
                title: captions[currentPageIndex % 3],
                description: descriptions[currentPageIndex % 3],
                onGetStartedClick: () {
                  context.go('/signin');
                  setUserOnboardStatus(true);
                },
                pageIndicator: PageIndicator(
                  numberOfIndicators: captions.length,
                  currentIndex: currentPageIndex % 3,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {},
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
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton(
                style: FilledButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                )),
                onPressed: onGetStartedClick,
                child:
                    const Text("Get Started", style: TextStyle(fontSize: 14)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
