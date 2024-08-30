part of 'heart_disease_cubit.dart';

@immutable
sealed class HeartDiseaseState {}

final class HeartDiseaseInitial extends HeartDiseaseState {}

class HeartDiseaseLoading extends HeartDiseaseState {}

class HeartDiseaseSuccess extends HeartDiseaseState {
  final HeartDiseasePrediction prediction;

  HeartDiseaseSuccess(this.prediction);

  @override
  List<Object> get props => [prediction];
}

class HeartDiseaseFailure extends HeartDiseaseState {
  final String error;

  HeartDiseaseFailure(this.error);

  @override
  List<Object> get props => [error];
}


// class HeartDiseaseState extends Equatable {
//   final int age;
//   final int sex;
//   final int cp;
//   final int trestbps;
//   final String error;
//   final HeartDiseasePrediction results;
//   final HeartDiseaseProgressState progressState;
//   const HeartDiseaseState({
//     required this.age,
//     required this.sex,
//     required this.cp,
//     required this.trestbps,
//     required this.progressState,
//     required this.error,
//     required this.results,
//   });

//   const HeartDiseaseState.initial(
//       {this.age = 0,
//       this.sex = 0,
//       this.cp = 0,
//       this.trestbps = 0,
//       this.error = '',
//       this.results = ,
//       this.progressState = HeartDiseaseProgressState.initial});

//   HeartDiseaseState copyWith(
//       {int? age,
//       int? sex,
//       int? cp,
//       int? trestbps,
//       String? error,
//       HeartDiseasePrediction? results,
//       HeartDiseaseProgressState? progressState}) {
//     return HeartDiseaseState(
//       age: age ?? this.age,
//       sex: sex ?? this.sex,
//       cp: cp ?? this.cp,
//       trestbps: trestbps ?? this.trestbps,
//       progressState: progressState ?? this.progressState,
//       error: error ?? this.error,
//       results: results ?? this.results,
//     );
//   }

//   @override
//   // TODO: implement props
//   List<Object> get props => [age, sex, cp, trestbps, progressState, error, results];

//   @override
//   bool get stringify => true;
// }