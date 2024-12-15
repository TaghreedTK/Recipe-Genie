import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';

import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterLoadingState());
  late List<DishModel> filterModel;
  Future<void> getFilter({required List<String> diets,required String type,required List<String> intolerances ,required String maxFat,required String maxCarb,required String minFat,required String minCarb}) async {
    emit(FilterLoadingState());
    try {
      filterModel = await DishService(Dio()).getFilterData(diets: diets,type: type,intolerances: intolerances);
      emit(FilterLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(FilterFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
