import 'package:flutter/material.dart';
import 'package:food/utils/constants/colors.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
          color: TColors.secondry, borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Positioned(
          right: 5,
          top: 7,
          child: Image(
            image: AssetImage('assets/images/egg.png'),
            height: 90,
          ),
        ),
        Positioned(
          top: 45,
          left: 11,
          child: SizedBox(
            width: 260,
            child: Text(
              'Generate Unlimited Ricpe!',
              style: TextStyle(
                  fontFamily: 'Noto Serif Bengali',
                  color: TColors.primary,
                  fontSize: 18,
                  height: 1.2),
            ),
          ),
        ),
      ]),
    );
  }
}
