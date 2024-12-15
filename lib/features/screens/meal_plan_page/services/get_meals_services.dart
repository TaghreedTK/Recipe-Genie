import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food/core/Di.dart';
import 'package:food/core/Sh.dart';
import 'package:food/features/screens/meal_plan_page/models/meal_plan_model.dart';

class MealsService {
  final Dio dio;

  MealsService(this.dio);
  static const String apiKey = '3cf407f3aeae4d15a7d782750b630ed9';
  Future<List<MealPlanModel>> getSearchData({required String date}) async {
    try {
      // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio.get(
          'https://api.spoonacular.com/mealplanner/${sl<MySharedPrefInterface>().getString(key: MySharedKeys.username)}/week/$date?hash=${sl<MySharedPrefInterface>().getString(key: MySharedKeys.hash)}&apiKey=$apiKey');
      List<MealPlanModel> mealsModel = (response.data["days"] as List)
          .map((item) => MealPlanModel.fromJson(item))
          .toList();
      return mealsModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'];
      throw Exception(errorMessage);
    }
  }

  Future<void> clearMealPlan({required String date}) async {
    var response = await dio.request(
      'https://api.spoonacular.com/mealplanner/dsky/day/$date?hash=4b5v4398573406',
      options: Options(
        method: 'DELET',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Meal plans cleared successfully!');
      log(response.toString());
    } else {
      log(response.data["statuse"]);
      print('Failed to add meal plans. Status code: ${response.statusCode}');
      print('Response body: ${response.data}');
    }
  }
}
