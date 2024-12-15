// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/cuisines_cubit/cuisines_cubit.dart';
import 'package:food/cubits/recipe_cupit/recipe_cubit.dart';
import 'package:food/cubits/similer_cubit/similer_cubit.dart';
import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:food/features/screens/home_page/widgets/favourite_button.dart';
import 'package:food/features/screens/recipe_page/views/ingredients_list_view.dart';
import 'package:food/features/screens/recipe_page/views/instructions_list_view.dart';
import 'package:food/features/screens/recipe_page/widgets/details_taile.dart';
import 'package:food/features/screens/recipe_page/widgets/more_icon.dart';
import 'package:food/features/screens/recipe_page/widgets/recipe_buttons.dart';
import 'package:food/features/screens/recipe_page/widgets/recipe_image.dart';
import 'package:food/features/screens/similer_screen/similer_page.dart';
import 'package:food/utils/constants/colors.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen(
      {Key? key,
      required this.dishName,
      required this.dishId,
      required this.dishImage})
      : super(key: key);
  final String dishName;
  final String dishImage;
  final int dishId;
  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: Stack(children: [
                      Positioned(
                          top: 25,
                          right: 15,
                          child: MoreIcon(
                            backgroundColor: TColors.primary,
                            onPressed: () {
                              BlocProvider.of<SimilerCubit>(context)
                                  .getSimilers(id: '${widget.dishId}');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return BlocBuilder<SimilerCubit,
                                            SimilerState>(
                                        builder: (context, state) {
                                      if (state is SimilerRecipeLoadingState) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else if (state
                                          is SimilerRecipeLoadedState) {
                                        return SimilerScreen(); // Assuming ExploreListView returns a SliverGrid
                                      } else if (state
                                          is SimilerRecipeFailuerState) {
                                        return Text(state
                                            .message); // Assuming ExploreListView returns a SliverGrid
                                      } else {
                                        return Text('Oops, there is a failure');
                                      }
                                    });
                                  },
                                ),
                              );
                            },
                          )),
                      Center(
                        child: RecipeImage(
                          image: widget.dishImage,
                          name: widget.dishName,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: constraints.maxHeight - 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, right: 20),
                          child: RecipeButtons(
                            id: widget.dishId.toString(),
                          ),
                        ),
                        Expanded(
                          child: BlocBuilder<RecipeCubit, RecipeState>(
                            builder: (context, state) {
                              if (state is RecipeLoadingState) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (state is IngredientsLoadedState) {
                                return IngredientsListView(); // Assuming ExploreListView returns a SliverGrid
                              } else if (state is IngredientsFailuerState) {
                                return Text(
                                    'Oops, there is a failure'); // Assuming ExploreListView returns a SliverGrid
                              } else if (state is DetailsLoadedState) {
                                return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DetailTile(
                                      summary: state.Summary,
                                    )); // Assuming ExploreListView returns a SliverGrid
                              } else if (state is DetailsFailuerState) {
                                return Text(
                                    'Oops, there is a failure'); // Assuming ExploreListView returns a SliverGrid
                              } else if (state is InstructionsLoadedState) {
                                return InstructionsListView(); // Assuming ExploreListView returns a SliverGrid
                              } else if (state is InstructionsFailuerState) {
                                return Text(
                                    'Oops, there is a failure'); // Assuming ExploreListView returns a SliverGrid
                              } else {
                                return Text('Unexpected state'); // Default case
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
