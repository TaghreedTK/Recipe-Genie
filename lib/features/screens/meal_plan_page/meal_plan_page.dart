import 'package:flutter/material.dart';
import 'package:food/cubits/plan_search_cubit/plan_search_cubit.dart';
import 'package:food/features/screens/filter_page/widgets/filter_container.dart';
import 'package:food/features/screens/meal_plan_page/views/meals_list_view.dart';
import 'package:food/features/screens/meal_plan_page/widgets/search.dart';
import 'package:food/features/screens/recipe_page/views/ingredients_list_view.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealPlanPage extends StatelessWidget {
  const MealPlanPage({super.key});

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
              child: Center(child: Search()),
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
                child: BlocBuilder<PlanSearchrCubit, PlanSearchState>(
                  builder: (context, state) {
                    if (state is NoBodyState) {
                      return Container();
                    } else if (state is SearchLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoadedState) {
                      return MealsPlansListView(); // Assuming ExploreListView returns a SliverGrid
                    } else if (state is SearchFailuerState) {
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
