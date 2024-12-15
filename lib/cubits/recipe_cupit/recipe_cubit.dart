import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';
import 'package:food/features/screens/recipe_page/models/details_model.dart';
import 'package:food/features/screens/recipe_page/models/ingredients_model.dart';
import 'package:food/features/screens/recipe_page/models/nutrition_model.dart';
import 'package:food/features/screens/recipe_page/services/recipe_service.dart';

import 'package:meta/meta.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeLoadingState());
  late List<IngredientsModel> ingredientsModel;
  late List<NutritionModel> nutritiontsModel;
  late String summary;
  late List<InstructionsModel> instructionsModel;
  Future<void> getIngredients({required String id}) async {
    emit(RecipeLoadingState());
    try {
      ingredientsModel = await RecipeService(Dio()).getIngredientsData(id: id);
      emit(IngredientsLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(IngredientsFailuerState(e.toString()));
      log(state.toString());
    }
  }
    Future<void> getDetails({required String id}) async {
     emit(RecipeLoadingState());
    try {
      nutritiontsModel = await RecipeService(Dio()).getNutrition(id: id);
      summary = await RecipeService(Dio()).getSummary(id: id);
      emit(DetailsLoadedState(summary));
    } on Exception catch (e) {
      log(e.toString());
      emit(DetailsFailuerState(e.toString()));
      log(state.toString());
    }
  }
    Future<void> getInstructions({required String id}) async {
    emit(RecipeLoadingState());
    try {
      instructionsModel = await RecipeService(Dio()).getInstructions(id: id);
      emit(InstructionsLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(InstructionsFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
