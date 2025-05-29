import 'user.dart';

class LoginResponse {
  final String token;
  final String? message;
  final User user;

  LoginResponse({
    required this.token,
    required this.user,
     this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}
