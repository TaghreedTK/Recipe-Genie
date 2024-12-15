import 'package:dio/dio.dart';
import 'package:food/features/screens/recipe_page/models/details_model.dart';
import 'package:food/features/screens/recipe_page/models/ingredients_model.dart';
import 'package:food/features/screens/recipe_page/models/nutrition_model.dart';
import 'package:food/features/screens/recipe_page/models/similer_model.dart';
import 'package:html/parser.dart' as html_parser;

class RecipeService {
  final Dio dio;
  static const String apiKey = '3cf407f3aeae4d15a7d782750b630ed9';

  RecipeService(this.dio);

  Future<List<IngredientsModel>> getIngredientsData(
      {required String id}) async {
    try {
      // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/$id/ingredientWidget.json?apiKey=$apiKey');
      List<IngredientsModel> cusineModel =
          (response.data["ingredients"] as List)
              .map((item) => IngredientsModel.fromJson(item))
              .toList();
      return cusineModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'];
      throw Exception(errorMessage);
    }
  }

  Future<String> getSummary({required String id}) async {
    try {
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/$id/summary?apiKey=$apiKey');
      String summary = response.data["summary"];
      String summaryText = html_parser.parse(summary).body!.text;
      return summaryText;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'Unknown error';
      throw Exception(errorMessage);
    }
  }

  Future<List<InstructionsModel>> getInstructions({required String id}) async {
    try {
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=$apiKey');
      List<dynamic> stepsData = response.data[0]['steps'];

      // Convert the dynamic list to a list of InstructionsModel
      List<InstructionsModel> steps =
          stepsData.map((item) => InstructionsModel.fromJson(item)).toList();
      return steps;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'Unknown error';
      throw Exception(errorMessage);
    }
  }

  Future<List<NutritionModel>> getNutrition({required String id}) async {
    try {
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/$id/nutritionWidget.json?apiKey=$apiKey');
      List<NutritionModel> nutritionModel = (response.data["nutrients"] as List)
          .map((item) => NutritionModel.fromJson(item))
          .toList();
      return nutritionModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'Unknown error';
      throw Exception(errorMessage);
    }
  }
    Future<List<SimilerModel>> getSimiler({required String id}) async {
    try {
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/$id/similar?apiKey=$apiKey');
      List<SimilerModel> similerModel = (response.data as List)
          .map((item) => SimilerModel.fromJson(item))
          .toList();
      return similerModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'Unknown error';
      throw Exception(errorMessage);
    }
  }
}
