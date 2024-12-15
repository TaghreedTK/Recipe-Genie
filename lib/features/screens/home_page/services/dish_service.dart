import 'package:dio/dio.dart';
import 'package:food/features/screens/home_page/models/dish_model.dart';

class DishService {
  final Dio dio;

  DishService(this.dio);
  static const String apiKey = '3cf407f3aeae4d15a7d782750b630ed9';
  Future<List<DishModel>> getCusineData({required String cusine}) async {
    try {
      // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/complexSearch?cuisine=$cusine&number=100&apiKey=$apiKey');
      List<DishModel> cusineModel = (response.data["results"] as List)
          .map((item) => DishModel.fromJson(item))
          .toList();
      return cusineModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'];
      throw Exception(errorMessage);
    }
  }

  Future<List<DishModel>> getFilterData(
      {required List<String> diets,
      required String type,
      required List<String> intolerances}) async {
    try {
      // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/complexSearch?diet=$diets&intolerances=$intolerances&type=$type&number=100&apiKey=$apiKey');
      List<DishModel> filterModel = (response.data["results"] as List)
          .map((item) => DishModel.fromJson(item))
          .toList();
      return filterModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'];
      throw Exception(errorMessage);
    }
  }

  Future<List<DishModel>> getCategoryData({required String category}) async {
    try {
      // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/complexSearch?query=$category&number=100&apiKey=$apiKey');
      List<DishModel> categoryModel = (response.data["results"] as List)
          .map((item) => DishModel.fromJson(item))
          .toList();
      return categoryModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'];
      throw Exception(errorMessage);
    }
  }

  Future<List<DishModel>> getSearchData({required String quary}) async {
    try {
      // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio.get(
          'https://api.spoonacular.com/recipes/complexSearch?query=$quary&number=100&apiKey=$apiKey');
      List<DishModel> categoryModel = (response.data["results"] as List)
          .map((item) => DishModel.fromJson(item))
          .toList();
      return categoryModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'];
      throw Exception(errorMessage);
    }
  }
}
