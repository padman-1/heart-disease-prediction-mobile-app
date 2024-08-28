import 'dart:convert';
import 'package:heart_disease_mobile_app/config/constants.dart';
import 'package:dio/dio.dart';
import 'package:heart_disease_mobile_app/models/api_response_model.dart';
// import 'package:http/http.dart' as http;
import '../models/heart_disease_model.dart';

// class HeartDiseaseService {
//   final String apiUrl = '$BASE_URL/predict/';

//   Future<HeartDiseaseModel> predictHeartDisease(HeartDiseaseModel input) async {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(input.toJson()),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body) as Map<String, dynamic>;
//     } else {
//       throw Exception('Failed to load prediction');
//     }
//   }
// }

class HeartDiseaseService {
  final Dio _dio;

  HeartDiseaseService()
      : _dio = Dio(BaseOptions(
          baseUrl: BASE_URL,
          headers: {'Content-Type': 'application/json'},
        ));

  Future<HeartDiseasePrediction> predictHeartDisease(
      HeartDiseaseModel input) async {
    try {
      final response = await _dio.post(
        '/predict/',
        data: input.toJson(),
      );

      return HeartDiseasePrediction.fromMap(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle different status codes or errors
        throw Exception('Failed to load prediction: ${e.response?.statusCode}');
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        throw Exception('Failed to load prediction: ${e.message}');
      }
    }
  }
}
