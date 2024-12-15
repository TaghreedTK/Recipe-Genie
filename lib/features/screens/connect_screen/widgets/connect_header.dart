import 'package:flutter/material.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.loginTitle,
          style: TextStyle(
              fontFamily: 'Noto Serif Bengali',
              color: TColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1.2),
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          TTexts.loginSubTitle,
          style: TextStyle(
              fontFamily: 'Noto Serif Bengali',
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              height: 1.2),
        ),
      ],
    );
  }
}
