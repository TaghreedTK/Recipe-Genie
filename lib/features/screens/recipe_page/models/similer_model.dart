import 'dart:convert';

class SimilerModel {
  final int id;
  final int serving;
  final String title;
  final int time;
  // final int id;

  const SimilerModel(
      {required this.title,
      required this.id,
      required this.time,
      required this.serving

      // required this.id,
      });
  factory SimilerModel.fromJson(json) {
    return SimilerModel(
        title: json["title"],
        id: json["id"],
        time: json["readyInMinutes"],
        serving: json["servings"]);
    //  id:)
  }
  List<SimilerModel> parseSimiler(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SimilerModel>((json) => SimilerModel.fromJson(json))
        .toList();
  }
}
