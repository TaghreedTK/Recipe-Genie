import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food/cubits/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:food/features/screens/cusine_page/widgets/dishes_tile.dart';
import 'package:food/features/screens/meal_plan_page/widgets/plans_tile.dart';

class RecipeSearchListView extends StatelessWidget {
  const RecipeSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    var result = BlocProvider.of<SearchRecipeCubit>(context).searchModel;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: result.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DishesTile(
            dish: result[index],
          ),
        );
      },
    );
  }
}
