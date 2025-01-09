class SearchSymptom {
  final int id;
  final String symptom;
  final int status;
  final int userId;
  final String createdAt;
  final String updatedAt;

  SearchSymptom({
    required this.id,
    required this.symptom,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a Symptom instance from a JSON map
  factory SearchSymptom.fromJson(Map<String, dynamic> json) {
    return SearchSymptom(
      id: json['id'],
      symptom: json['symptom'],
      status: json['status'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Method to convert Symptom to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symptom': symptom,
      'status': status,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}