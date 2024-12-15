import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';

import 'package:meta/meta.dart';

part 'cuisines_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(CusinesLoadingState());
  late List<DishModel> cusineModel;
  Future<void> getCusine({required String cusine}) async {
    emit(CusinesLoadingState());
    try {
      cusineModel = await DishService(Dio()).getCusineData(cusine: cusine);
      emit(CusinesLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(CusinesFailuerState(e.toString()));
      log(state.toString());
    }
  }
   Future<void> getCategory({required String category}) async {
    emit(CategoryLoadingState());
    try {
      cusineModel = await DishService(Dio()).getCategoryData(category: category);
      emit(CategoryLoadedState());
    } on Exception catch (e) {
      log(e.toString());
      emit(CateogryFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
