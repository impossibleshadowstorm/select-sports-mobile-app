class Address {
  final String id;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String createdAt;
  final String updatedAt;

  Address({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
