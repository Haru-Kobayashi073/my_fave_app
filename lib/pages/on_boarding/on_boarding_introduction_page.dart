import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fave_app/pages/on_boarding/components/on_boarding_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class OnBoardingIntroductionPage extends StatelessWidget {
  const OnBoardingIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 8),
                  child: Text(
                    '初めての方には機能について教えるよ！',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: OnBoardingSteps.values
                      .map(
                        (onBoardingSteps) => OnBoardingStepTile(
                          onBoardingSteps: onBoardingSteps,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: CommonButton(
                onPressed: () {
                  context.go(
                    const AddFavoriteExperienceIntroducePageRoute().location,
                  );
                },
                text: '次へ',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
