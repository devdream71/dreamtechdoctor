class Division {
  final int id;
  final String text;

  Division({required this.id, required this.text});

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      id: json['id'],
      text: json['text'],
    );
  }
}
