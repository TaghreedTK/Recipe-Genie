import 'package:flutter/material.dart';
import 'package:food/utils/constants/colors.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
  });

  final ImageProvider<Object> icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: ImageIcon(
            icon,
            color: TColors.primary,
            size: 30,
          ),
        ),
      ),
    );
  }
}
