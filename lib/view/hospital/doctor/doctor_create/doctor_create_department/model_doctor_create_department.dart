class DoctorCreateDepartment {
  final int id;
  final String departmentCategory;
  final int status;
  final int userId;
  final String createdAt;
  final String updatedAt;

  DoctorCreateDepartment({
    required this.id,
    required this.departmentCategory,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorCreateDepartment.fromJson(Map<String, dynamic> json) {
    return DoctorCreateDepartment(
      id: json['id'],
      departmentCategory: json['department_category'],
      status: json['status'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'department_category': departmentCategory,
      'status': status,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
