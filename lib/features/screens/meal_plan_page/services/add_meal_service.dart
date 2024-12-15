import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food/core/Di.dart';
import 'package:food/core/Sh.dart';

class AddMealService {
  final Dio dio;

  AddMealService(this.dio);

  Future<void> addToMealPlan({
    required int date,
    required int slot,
    required int position,
    required int id,
    required String title,
    required String image,
  }) async {
    var response = await dio.request(
      'https://api.spoonacular.com/mealplanner/${sl<MySharedPrefInterface>().getString(key: MySharedKeys.username)}/items?hash=${sl<MySharedPrefInterface>().getString(key: MySharedKeys.hash)}&apiKey=3cf407f3aeae4d15a7d782750b630ed9',
      options: Options(
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: {
        "date": date,
        "slot": slot,
        "position": position,
        "type": "RECIPE",
        "value": {
          "id": id,
          "title": "$title",
          "image": "$image",
        }
      },
    );

    if (response.statusCode == 200) {
      print('Meal plans added successfully!');
      log(response.toString());
    } else {
      log(response.data["statuse"]);
      print('Failed to add meal plans. Status code: ${response.statusCode}');
      print('Response body: ${response.data}');
    }
  }
}
