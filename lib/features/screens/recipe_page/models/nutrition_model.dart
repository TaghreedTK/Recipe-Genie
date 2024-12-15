import 'dart:convert';

class NutritionModel {
  final dynamic amount;
  final String unit;
  final dynamic percentOfDailyNeeds;
  final String Name;
  // final int id;

  const NutritionModel({
    required this.Name,
    required this.amount,
    required this.unit,
    required this.percentOfDailyNeeds,
    // required this.id,
  });
  factory NutritionModel.fromJson(json) {
    return NutritionModel(
        Name: json["name"],
        unit: json["unit"],
        amount: json["amount"],
        percentOfDailyNeeds: json["percentOfDailyNeeds"]);
    //  id:)
  }
  List<NutritionModel> parseNutrients(String responseBody) {
    final parsed =
        json.decode(responseBody)["nutrients"].cast<Map<String, dynamic>>();
    return parsed
        .map<NutritionModel>((json) => NutritionModel.fromJson(json))
        .toList();
  }
}
