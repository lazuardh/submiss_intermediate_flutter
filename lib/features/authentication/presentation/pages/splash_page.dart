import 'package:flutter/material.dart';

import '../../../../lib.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImageWrapper(
              image: AppImageAssets.logo,
              width: 48,
              height: 48,
              isNetworkImage: false,
            ),
            const Gap(height: AppGap.medium),
            Text(
              "Story Man",
              style: AppTextStyle.medium.copyWith(
                color: AppColors.white,
                fontSize: AppFontSize.extraBig,
              ),
            )
          ],
        ),
      ),
    );
  }
}
