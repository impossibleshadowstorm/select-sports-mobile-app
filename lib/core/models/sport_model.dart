class Sport {
  final String id;
  final String name;
  final List<String> rules;
  final int totalPlayer;
  final String createdAt;
  final String updatedAt;

  Sport({
    required this.id,
    required this.name,
    required this.rules,
    required this.totalPlayer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Sport.fromJson(Map<String, dynamic> json) {
    return Sport(
      id: json['id'],
      name: json['name'],
      rules: List<String>.from(json['rules'] ?? []),
      totalPlayer: json['totalPlayer'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
