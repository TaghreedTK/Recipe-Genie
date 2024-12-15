import 'dart:convert';

class InstructionsModel {
  final int number;
  final String step;

  const InstructionsModel({
    required this.number,
    required this.step,
  });

  factory InstructionsModel.fromJson(Map<String, dynamic> json) {
    return InstructionsModel(
      number: json['number'],
      step: json['step'],
    );
  }

  static List<InstructionsModel> parseInstructions(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<InstructionsModel>((json) => InstructionsModel.fromJson(json))
        .toList();
  }
}