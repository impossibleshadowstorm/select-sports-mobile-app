class ProfileOptions {
  final List<String> skillLevelOptions;
  final List<String> preferredFootOptions;
  final List<String> preferredPositionOptions;

  ProfileOptions({
    required this.skillLevelOptions,
    required this.preferredFootOptions,
    required this.preferredPositionOptions,
  });

  factory ProfileOptions.fromJson(Map<String, dynamic> json) {
    return ProfileOptions(
      skillLevelOptions: (json['skillLevel'] as Map<String, dynamic>).values.cast<String>().toList(),
      preferredFootOptions: (json['preferredFoot'] as Map<String, dynamic>).values.cast<String>().toList(),
      preferredPositionOptions: (json['preferredPosition'] as Map<String, dynamic>).values.cast<String>().toList(),
    );
  }
}
