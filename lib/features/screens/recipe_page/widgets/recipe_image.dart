// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/cuisines_cubit/cuisines_cubit.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/helpers/helper_functions.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    //    final dark = THelperFunctions.isDarkMode(context);
    return Stack(children: [
      Positioned(
        left: 8,
        right: 8,
        bottom: 5,
        child: Column(
          children: [
            CircleAvatar(
              radius: 110,
              backgroundColor: Color(0xFFFBF8F8),
              child: CircleAvatar(
                radius: 105,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Noto Serif Bengali',
                  color: TColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ]);
  }
}
