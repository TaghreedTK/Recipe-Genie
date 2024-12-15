// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:dio/dio.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';
import 'package:food/features/screens/meal_plan_page/models/meal_plan_model.dart';
import 'package:food/features/screens/meal_plan_page/services/add_meal_service.dart';
import 'package:food/features/screens/recipe_page/recipe_screen.dart';

import 'package:food/features/widgets/add_mealPlan_dialog.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class PlansTile extends StatefulWidget {
  const PlansTile({
    Key? key,
    required this.plan,
  }) : super(key: key);
  final MealPlanModel plan;

  @override
  State<PlansTile> createState() => _PlansTileState();
}

class _PlansTileState extends State<PlansTile> {
  // Example Unix timestamp

  @override
  Widget build(BuildContext context) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(widget.plan.date * 1000);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
      ),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return RecipeScreen(
          //         dish: widget.dish,
          //       );
          //     },
          //   ),
          // );
        },
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/plan.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Text(
                        widget.plan.day,
                        maxLines: 3,
                        style: TextStyle(
                            fontFamily: 'Noto Serif Bengali',
                            color: TColors.textPrimary,
                            fontSize: 15,
                            height: 1.2,
                            fontWeight: FontWeight.bold),
                        strutStyle: StrutStyle(
                          height: 0.5,
                          // Adjust this value to control the space between lines
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          formattedDate,
                          maxLines: 3,
                          style: TextStyle(
                              fontFamily: 'Noto Serif Bengali',
                              color: TColors.textPrimary,
                              fontSize: 15,
                              height: 1.2,
                              fontWeight: FontWeight.bold),
                          strutStyle: StrutStyle(
                            height: 0.5,
                            // Adjust this value to control the space between lines
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
