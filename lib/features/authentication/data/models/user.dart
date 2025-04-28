class User {
  final String firstName;
  final String secondName;
  final String userId;
  final String phoneNumber;

  User({
    required this.firstName,
    required this.secondName,
    required this.userId,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] ?? '',
      secondName: json['secondName'] ?? '',
      userId: json['userId'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}
