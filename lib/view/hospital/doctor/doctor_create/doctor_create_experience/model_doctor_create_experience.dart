class DoctorCreateExperience {
  final int id;
  final String experience;
  final int status;
  final int userId;
  final String createdAt;
  final String updatedAt;

  DoctorCreateExperience({
    required this.id,
    required this.experience,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorCreateExperience.fromJson(Map<String, dynamic> json) {
    return DoctorCreateExperience(
      id: json['id'],
      experience: json['experience'],
      status: json['status'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'experience': experience,
      'status': status,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
