class District {
  final int id;
  final String text;

  District({required this.id, required this.text});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      text: json['text'],
    );
  }
}
