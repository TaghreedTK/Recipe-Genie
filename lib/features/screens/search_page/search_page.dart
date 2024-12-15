import 'package:flutter/material.dart';

import 'package:food/cubits/search_recipe_cubit/search_recipe_cubit.dart';

import 'package:food/features/screens/meal_plan_page/views/meals_list_view.dart';
import 'package:food/features/screens/meal_plan_page/widgets/search.dart';
import 'package:food/features/screens/search_page/views/search_recipe_list_view.dart';
import 'package:food/features/screens/search_page/widgets/search_bar.dart';

import 'package:food/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.main,
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(child: RecipeSearch()),
            ),
            Container(
              height: constraints.maxHeight - 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
              ),
              child: Expanded(
                child: BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
                  builder: (context, state) {
                    if (state is NoBodyState) {
                      return Container();
                    } else if (state is SearchRecipeLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SearchRecipeLoadedState) {
                      return SingleChildScrollView(child: SizedBox(
                        height: constraints.maxHeight - 100,
                        child: RecipeSearchListView())); // Assuming ExploreListView returns a SliverGrid
                    } else if (state is SearchRecipeFailuerState) {
                      return Text(state
                          .message); // Assuming ExploreListView returns a SliverGrid
                    } else {
                      return Text('Oops, there is a failure');
                    }
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
