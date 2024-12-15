import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';
import 'package:food/features/screens/meal_plan_page/models/meal_plan_model.dart';
import 'package:food/features/screens/meal_plan_page/services/get_meals_services.dart';

import 'package:meta/meta.dart';

part 'plan_search_state.dart';

class PlanSearchrCubit extends Cubit<PlanSearchState> {
  PlanSearchrCubit() : super(NoBodyState());
  late List<MealPlanModel> mealsModel;
  Future<void> getSearchData({required String date}) async {
    emit(SearchLoadingState());
    try {
      mealsModel = await MealsService(Dio()).getSearchData(date: date);
      emit(SearchLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(SearchFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
