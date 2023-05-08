class Animal {
  final String id;
  final String url;

  Animal({
    required this.id,
    required this.url,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    id: json["id"],
    url: json["url"],
  );
}
