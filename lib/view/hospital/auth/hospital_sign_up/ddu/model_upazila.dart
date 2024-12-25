class Upazila {
  final int id;
  final String text;

  Upazila({required this.id, required this.text});

  factory Upazila.fromJson(Map<String, dynamic> json) {
    return Upazila(
      id: json['id'],
      text: json['text'],
    );
  }
}
