class DoctorCreateSymptom {
  final int id;
  final String symptom;

  DoctorCreateSymptom({required this.id, required this.symptom});

  factory DoctorCreateSymptom.fromJson(Map<String, dynamic> json) {
    return DoctorCreateSymptom(
      id: json['id'],
      symptom: json['symptom'],
    );
  }
}