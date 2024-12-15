import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';

import 'package:meta/meta.dart';

part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit() : super(NoBodyState());
  late List<DishModel> searchModel;
  Future<void> getSearchData({required String quary}) async {
    emit(SearchRecipeLoadingState());
    try {
      searchModel = await DishService(Dio()).getSearchData(quary: quary);
      emit(SearchRecipeLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(SearchRecipeFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
