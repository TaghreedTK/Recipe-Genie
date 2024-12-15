import 'dart:convert';

class MealPlanModel {
  final int date;
  final String day;
  final String title;
  final String image;

  const MealPlanModel(
      {required this.date,
      required this.day,
      required this.image,
      required this.title});

  factory MealPlanModel.fromJson(Map<String, dynamic> json) {
    return MealPlanModel(
        date: json["date"],
        day: json["day"],
        title: json['items'][0]['value']["title"],
        image: json['items'][0]['value']["image"]);
  }
  List<MealPlanModel> parseDishes(String responseBody) {
    final parsed =
        json.decode(responseBody)["days"].cast<Map<String, dynamic>>();
    return parsed
        .map<MealPlanModel>((json) => MealPlanModel.fromJson(json))
        .toList();
  }
}
