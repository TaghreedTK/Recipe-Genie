import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/recipe_cupit/recipe_cubit.dart';
import 'package:food/features/screens/recipe_page/widgets/ingredient_tile.dart';
import 'package:food/features/screens/recipe_page/widgets/instructions_tile.dart';

class InstructionsListView extends StatelessWidget {
  const InstructionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var instructions = BlocProvider.of<RecipeCubit>(context).instructionsModel;
    return ListView.builder(
      itemCount: instructions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: instructionsTile(
            instructions: instructions[index],
          ),
        );
      },
    );
  }
}
