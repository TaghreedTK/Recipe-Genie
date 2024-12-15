import 'package:flutter/material.dart';
import 'package:food/utils/constants/colors.dart';

class MoreIcon extends StatelessWidget {
  const MoreIcon({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: ImageIcon(
                AssetImage('assets/icones/icons8-fork-and-knife-66.png'),
                color: TColors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
