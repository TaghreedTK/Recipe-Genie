import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/recipe_cupit/recipe_cubit.dart';
import 'package:food/features/screens/recipe_page/widgets/ingredient_tile.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var ingredients = BlocProvider.of<RecipeCubit>(context).ingredientsModel;
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: IngrediantTile(
            ingredient: ingredients[index],
          ),
        );
      },
    );
  }
}
