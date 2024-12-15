// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food/features/screens/recipe_page/models/details_model.dart';
import 'package:food/utils/constants/colors.dart';

class instructionsTile extends StatelessWidget {
  const instructionsTile({
    Key? key,
    required this.instructions,
  }) : super(key: key);
  final InstructionsModel instructions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Step number :',
                style: TextStyle(
                    fontFamily: 'Noto Serif Bengali',
                    color: TColors.textPrimary,
                    fontSize: 15,
                    height: 1.2,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${instructions.number}',
                style: TextStyle(
                    color: TColors.textPrimary,
                    fontSize: 15,
                    height: 1.2,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${instructions.step}',
            style: TextStyle(
                fontFamily: 'Noto Serif Bengali',
                color: Colors.grey,
                fontSize: 15,
                height: 1.2,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
