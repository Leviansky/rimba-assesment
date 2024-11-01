class ProfileModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });

  // Factory constructor to create a Profile from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      accessToken: json['accessToken'] as String,
      expiresIn: json['expiresIn'] as int,
      refreshToken: json['refreshToken'] as String,
    );
  }

  // Method to convert a Profile instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'accessToken': accessToken,
      'expiresIn': expiresIn,
      'refreshToken': refreshToken,
    };
  }
}
