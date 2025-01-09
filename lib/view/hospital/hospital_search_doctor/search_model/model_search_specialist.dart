class SearchSpecialist {
  final int id;
  final String specialist;
  final int status;
  final int userId;
  final String createdAt;
  final String updatedAt;

  SearchSpecialist({
    required this.id,
    required this.specialist,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SearchSpecialist.fromJson(Map<String, dynamic> json) {
    return SearchSpecialist(
      id: json['id'],
      specialist: json['specialist'],
      status: json['status'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialist': specialist,
      'status': status,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
