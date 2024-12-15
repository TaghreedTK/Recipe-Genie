import 'package:flutter/material.dart';
import 'package:food/cubits/recipe_cupit/recipe_cubit.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({super.key, required this.summary});
  final String summary;

  @override
  Widget build(BuildContext context) {
    var nutritions = BlocProvider.of<RecipeCubit>(context).nutritiontsModel;
    return SingleChildScrollView(
      // Add SingleChildScrollView here
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true, // Add shrinkWrap to true
            physics:
                NeverScrollableScrollPhysics(), // Disable ListView scrolling
            itemCount: nutritions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${nutritions[index].Name} :',
                          style: TextStyle(
                            fontFamily: 'Noto Serif Bengali',
                            color: TColors.textPrimary,
                            fontSize: 15,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' ${nutritions[index].amount}',
                          style: TextStyle(
                              fontFamily: 'Noto Serif Bengali',
                              color: Colors.grey,
                              fontSize: 15,
                              height: 1.2,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '${nutritions[index].unit}',
                          style: TextStyle(
                              fontFamily: 'Noto Serif Bengali',
                              color: Colors.grey,
                              fontSize: 15,
                              height: 1.2,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'percent Of DailyNeeds :',
                            style: TextStyle(
                              fontFamily: 'Noto Serif Bengali',
                              color: TColors.textPrimary,
                              fontSize: 15,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' ${nutritions[index].percentOfDailyNeeds}%',
                            style: TextStyle(
                                fontFamily: 'Noto Serif Bengali',
                                color: Colors.grey,
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Text(
            summary,
            style: TextStyle(
                fontFamily: 'Noto Serif Bengali',
                color: Colors.grey,
                fontSize: 15,
                height: 1.2,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
