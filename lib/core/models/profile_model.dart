class Profile {
  final String id;
  final String? skillLevel;
  final String? preferredPosition;
  final String? strength;
  final String? weakness;
  final String? preferredFoot;
  final String? favoriteNumber;
  final String? favoritePlayer;
  final String? favoriteClub;
  final int totalMatches;
  final int winnings;
  final int draws;
  final int loses;
  final String createdAt;
  final String? updatedAt;
  final String userId;

  Profile({
    required this.id,
    this.skillLevel,
    this.preferredPosition,
    this.strength,
    this.weakness,
    this.preferredFoot,
    this.favoriteNumber,
    this.favoritePlayer,
    this.favoriteClub,
    required this.totalMatches,
    required this.winnings,
    required this.draws,
    required this.loses,
    required this.createdAt,
    this.updatedAt,
    required this.userId,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      skillLevel: json['skillLevel'],
      preferredPosition: json['preferredPosition'],
      strength: json['strength'],
      weakness: json['weakness'],
      preferredFoot: json['preferredFoot'],
      favoriteNumber: json['favoriteNumber'],
      favoritePlayer: json['favoritePlayer'],
      favoriteClub: json['favoriteClub'],
      totalMatches: json['totalMatches'],
      winnings: json['winnings'],
      draws: json['draws'],
      loses: json['loses'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
    );
  }
}
