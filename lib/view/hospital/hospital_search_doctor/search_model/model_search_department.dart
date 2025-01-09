class SearchDepartment {
  final int id;
  final String departmentCategory;
  final int status;
  final int userId;

  SearchDepartment({
    required this.id,
    required this.departmentCategory,
    required this.status,
    required this.userId,
  });

  factory SearchDepartment.fromJson(Map<String, dynamic> json) {
    return SearchDepartment(
      id: json['id'],
      departmentCategory: json['department_category'],
      status: json['status'],
      userId: json['user_id'],
    );
  }
}
