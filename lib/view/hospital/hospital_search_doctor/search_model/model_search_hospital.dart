class SearchHospitalData {
  final List<String> hospitalNames;
  final List<String> doctorDepartments;

  SearchHospitalData({
    required this.hospitalNames,
    required this.doctorDepartments,
  });

  factory SearchHospitalData.fromJson(Map<String, dynamic> json) {
    return SearchHospitalData(
      hospitalNames: List<String>.from(json['hospitalNames']),
      doctorDepartments: List<String>.from(json['doctorDepartments']),
    );
  }
}
