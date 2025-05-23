class BookAppointmentRequest {
  final String clinicID;
  final String doctorId;
  final String date;
  final String time;
  final String mobile;
  final String name;

  BookAppointmentRequest({
    required this.clinicID,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.mobile,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'clinicID': clinicID,
      'DoctorId': doctorId,
      'Date': date,
      'Time': time,
      'mobile': mobile,
      'name': name,
    };
  }
}

class BookAppointmentResponse {
  final String message;

  BookAppointmentResponse({required this.message});

  factory BookAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return BookAppointmentResponse(
      message: json['message'] as String,
    );
  }
} 