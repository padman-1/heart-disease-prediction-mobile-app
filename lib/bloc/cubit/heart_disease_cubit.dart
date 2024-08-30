import 'package:bloc/bloc.dart';
import 'package:heart_disease_mobile_app/models/api_response_model.dart';
import 'package:heart_disease_mobile_app/models/heart_disease_model.dart';
import 'package:heart_disease_mobile_app/service/api_service.dart';
import 'package:meta/meta.dart';

part 'heart_disease_state.dart';

class HeartDiseaseCubit extends Cubit<HeartDiseaseState> {
  final HeartDiseaseService repository;
  HeartDiseaseCubit({required this.repository}) : super(HeartDiseaseInitial());

  Future<void> predictHeartDisease(HeartDiseaseModel input) async {
    try {
      emit(HeartDiseaseLoading());
      print("=====================");
      print(state);
      final prediction = await repository.predictHeartDisease(input);
      emit(HeartDiseaseSuccess(prediction));
    } catch (e) {
      emit(HeartDiseaseFailure(e.toString()));
    }
  }
}
