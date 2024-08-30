// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HeartDiseasePrediction {
  final int prediction;
  final double probability;
  final String result;

  HeartDiseasePrediction({
    required this.prediction,
    required this.probability,
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prediction': prediction,
      'probability': probability,
      'result': result,
    };
  }

  factory HeartDiseasePrediction.fromMap(Map<String, dynamic> map) {
    return HeartDiseasePrediction(
      prediction: map['prediction'] as int,
      probability: map['probability'] as double,
      result: map['result'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeartDiseasePrediction.fromJson(String source) =>
      HeartDiseasePrediction.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
