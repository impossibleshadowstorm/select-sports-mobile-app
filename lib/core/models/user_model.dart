class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String phone;
  final DateTime? dob; // Nullable DateTime
  final String gender;
  final int skillsRating;
  final bool isVerified;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    this.dob, // Nullable
    required this.gender,
    required this.skillsRating,
    required this.isVerified,
    required this.isActive,
  });

  // Factory constructor to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      phone: json['phone'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      // Handle null DOB
      gender: json['gender'],
      skillsRating: json['skillsRating'],
      isVerified: json['isVerified'],
      isActive: json['isActive'],
    );
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
      'dob': dob?.toIso8601String(), // Convert DateTime to string if not null
      'gender': gender,
      'skillsRating': skillsRating,
      'isVerified': isVerified,
      'isActive': isActive,
    };
  }
}
