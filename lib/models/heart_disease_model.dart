// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HeartDiseaseModel {
  final int age;
  final int sex;
  final int cp;
  final int trestbps;
  final int chol;
  final int fbs;
  final int restecg;
  final int thalach;
  final int exang;
  final double oldpeak;
  final int slope;
  final int ca;
  final int thal;
  HeartDiseaseModel({
    required this.age,
    required this.sex,
    required this.cp,
    required this.trestbps,
    required this.chol,
    required this.fbs,
    required this.restecg,
    required this.thalach,
    required this.exang,
    required this.oldpeak,
    required this.slope,
    required this.ca,
    required this.thal,
  });

  HeartDiseaseModel copyWith({
    int? age,
    int? sex,
    int? cp,
    int? trestbps,
    int? chol,
    int? fbs,
    int? restecg,
    int? thalach,
    int? exang,
    double? oldpeak,
    int? slope,
    int? ca,
    int? thal,
  }) {
    return HeartDiseaseModel(
      age: age ?? this.age,
      sex: sex ?? this.sex,
      cp: cp ?? this.cp,
      trestbps: trestbps ?? this.trestbps,
      chol: chol ?? this.chol,
      fbs: fbs ?? this.fbs,
      restecg: restecg ?? this.restecg,
      thalach: thalach ?? this.thalach,
      exang: exang ?? this.exang,
      oldpeak: oldpeak ?? this.oldpeak,
      slope: slope ?? this.slope,
      ca: ca ?? this.ca,
      thal: thal ?? this.thal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'age': age,
      'sex': sex,
      'cp': cp,
      'trestbps': trestbps,
      'chol': chol,
      'fbs': fbs,
      'restecg': restecg,
      'thalach': thalach,
      'exang': exang,
      'oldpeak': oldpeak,
      'slope': slope,
      'ca': ca,
      'thal': thal,
    };
  }

  factory HeartDiseaseModel.fromMap(Map<String, dynamic> map) {
    return HeartDiseaseModel(
      age: map['age'] as int,
      sex: map['sex'] as int,
      cp: map['cp'] as int,
      trestbps: map['trestbps'] as int,
      chol: map['chol'] as int,
      fbs: map['fbs'] as int,
      restecg: map['restecg'] as int,
      thalach: map['thalach'] as int,
      exang: map['exang'] as int,
      oldpeak: map['oldpeak'] as double,
      slope: map['slope'] as int,
      ca: map['ca'] as int,
      thal: map['thal'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeartDiseaseModel.fromJson(String source) =>
      HeartDiseaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HeartDiseaseModel(age: $age, sex: $sex, cp: $cp, trestbps: $trestbps, chol: $chol, fbs: $fbs, restecg: $restecg, thalach: $thalach, exang: $exang, oldpeak: $oldpeak, slope: $slope, ca: $ca, thal: $thal)';
  }

  @override
  bool operator ==(covariant HeartDiseaseModel other) {
    if (identical(this, other)) return true;

    return other.age == age &&
        other.sex == sex &&
        other.cp == cp &&
        other.trestbps == trestbps &&
        other.chol == chol &&
        other.fbs == fbs &&
        other.restecg == restecg &&
        other.thalach == thalach &&
        other.exang == exang &&
        other.oldpeak == oldpeak &&
        other.slope == slope &&
        other.ca == ca &&
        other.thal == thal;
  }

  @override
  int get hashCode {
    return age.hashCode ^
        sex.hashCode ^
        cp.hashCode ^
        trestbps.hashCode ^
        chol.hashCode ^
        fbs.hashCode ^
        restecg.hashCode ^
        thalach.hashCode ^
        exang.hashCode ^
        oldpeak.hashCode ^
        slope.hashCode ^
        ca.hashCode ^
        thal.hashCode;
  }
}
