import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/page_controller/build_page_indicator.dart';
import 'package:my_fave_app/pages/on_boarding/components/on_boarding_components.dart';
import 'package:my_fave_app/pages/register_user_information/components/register_user_information_components.dart';
import 'package:my_fave_app/widgets/widget.dart';

class OnBoardingPage extends HookConsumerWidget {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentPage = useState<int>(0);

    return Scaffold(
      appBar: CommonAppBar(
        icon: SkipButton(
          onPressed: () {
            pageController.jumpToPage(4);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (int page) {
                currentPage.value = page;
              },
              children: [
                FirstBoardView(pageController: pageController),
                SecondBoardView(pageController: pageController),
                ThirdBoardView(pageController: pageController),
                const FourthBoardView(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ref.watch(buildPageIndicatorProvider).call(
                    context,
                    currentPage.value,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
