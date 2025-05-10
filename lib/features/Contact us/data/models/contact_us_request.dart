class ContactUsRequest {
  final String name;
  final String email;
  final String message;
  final String? phone;
  final String? subject;

  ContactUsRequest({
    required this.name,
    required this.email,
    required this.message,
    this.phone,
    this.subject,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'message': message,
    };

    if (phone != null) {
      data['phone'] = phone;
    }
    
    if (subject != null) {
      data['subject'] = subject;
    }

    return data;
  }
} 