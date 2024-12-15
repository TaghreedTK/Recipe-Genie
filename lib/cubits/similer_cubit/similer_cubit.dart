import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';
import 'package:food/features/screens/recipe_page/models/details_model.dart';
import 'package:food/features/screens/recipe_page/models/ingredients_model.dart';
import 'package:food/features/screens/recipe_page/models/nutrition_model.dart';
import 'package:food/features/screens/recipe_page/models/similer_model.dart';
import 'package:food/features/screens/recipe_page/services/recipe_service.dart';

import 'package:meta/meta.dart';

part 'recipe_state.dart';

class SimilerCubit extends Cubit<SimilerState> {
  SimilerCubit() : super(SimilerRecipeLoadingState());
  late List<SimilerModel> similerModel;

  Future<void> getSimilers({required String id}) async {
    emit(SimilerRecipeLoadingState());
    try {
      similerModel = await RecipeService(Dio()).getSimiler(id: id);
      emit(SimilerRecipeLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(SimilerRecipeFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
