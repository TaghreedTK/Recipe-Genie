import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/plan_search_cubit/plan_search_cubit.dart';
import 'package:food/cubits/recipe_cupit/recipe_cubit.dart';
import 'package:food/features/screens/meal_plan_page/widgets/plans_tile.dart';
import 'package:food/features/screens/recipe_page/widgets/ingredient_tile.dart';

class MealsPlansListView extends StatelessWidget {
  const MealsPlansListView({super.key});

  @override
  Widget build(BuildContext context) {
    var plans = BlocProvider.of<PlanSearchrCubit>(context).mealsModel;
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: PlansTile(
            plan: plans[index],
          ),
        );
      },
    );
  }
}
