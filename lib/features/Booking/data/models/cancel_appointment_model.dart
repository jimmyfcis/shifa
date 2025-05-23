class CancelAppointmentRequest {
  final String appointmentID;
  final String reason;

  CancelAppointmentRequest({
    required this.appointmentID,
    required this.reason,
  });

  Map<String, dynamic> toJson() {
    return {
      'appointmentID': appointmentID,
      'reason': reason,
    };
  }
}

class CancelAppointmentResponse {
  final String message;

  CancelAppointmentResponse({required this.message});

  factory CancelAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return CancelAppointmentResponse(
      message: json['message'] as String,
    );
  }
} 