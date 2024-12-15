import 'dart:convert';

class IngredientsModel {
  final double value;
  final String unit;
  final String image;
  final String Name;
  // final int id;

  const IngredientsModel({
    required this.Name,
    required this.image,
    required this.unit,
    required this.value,
    // required this.id,
  });
  factory IngredientsModel.fromJson(json) {
    return IngredientsModel(
      Name: json["name"],
      image: json["image"],
      value: json["amount"]["metric"]["value"],
      unit: json["amount"]["metric"]["unit"],
    );
    //  id:)
  }
  List<IngredientsModel> parseingredient(String responseBody) {
    final parsed =
        json.decode(responseBody)["ingredients"].cast<Map<String, dynamic>>();
    return parsed
        .map<IngredientsModel>((json) => IngredientsModel.fromJson(json))
        .toList();
  }
}
