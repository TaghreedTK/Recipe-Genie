import 'dart:convert';

class DishModel {
  final int id;
  final String image;
  final String dishName;

  const DishModel(
      {required this.image, required this.dishName, required this.id});
  factory DishModel.fromJson(json) {
    return DishModel(
        dishName: json['title'], id: json['id'], image: json['image']);
  }
  List<DishModel> parseDishes(String responseBody) {
    final parsed =
        json.decode(responseBody)["results"].cast<Map<String, dynamic>>();
    return parsed.map<DishModel>((json) => DishModel.fromJson(json)).toList();
  }
}
