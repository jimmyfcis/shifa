class RescheduleAppointmentRequest {
  final String appointmentID;
  final String id;
  final String dateFrom;
  final String dateTo;
  final String scheduleSerial;

  RescheduleAppointmentRequest({
    required this.appointmentID,
    required this.id,
    required this.dateFrom,
    required this.dateTo,
    required this.scheduleSerial,
  });

  Map<String, dynamic> toJson() {
    return {
      'appointmentID': appointmentID,
      'id': id,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'scheduleSerial': scheduleSerial,
    };
  }
}

class RescheduleAppointmentResponse {
  final String message;

  RescheduleAppointmentResponse({required this.message});

  factory RescheduleAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return RescheduleAppointmentResponse(
      message: json['message'] as String,
    );
  }
} 