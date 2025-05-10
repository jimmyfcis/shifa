class ContactUsResponse {
  final String message;

  ContactUsResponse({
    required this.message,
  });

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) {
    return ContactUsResponse(
      message: json['message'] ?? '',
    );
  }
} 