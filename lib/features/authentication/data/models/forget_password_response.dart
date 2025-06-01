class ForgetPasswordResponse {
  final String? message;

  ForgetPasswordResponse({
    this.message,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      message: json['message'] ?? '',
    );
  }
}
