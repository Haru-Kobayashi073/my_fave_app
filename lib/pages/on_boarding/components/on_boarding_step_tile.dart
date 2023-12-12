import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/utils.dart';

class OnBoardingStepTile extends StatelessWidget {
  const OnBoardingStepTile({super.key, required this.onBoardingSteps});
  final OnBoardingSteps onBoardingSteps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (onBoardingSteps.index + 1).toString(),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onBoardingSteps.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  onBoardingSteps.description,
                  style: TextStyle(
                    color: AppColor.grey88,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
