import 'package:shifa/core/models/doctor_model.dart';

class Appointment {
  final int? bookingID;
  final int? appointmentID;
  final String? scheduleSerial;
  final String? date;
  final String? time;
  final Doctor? doctor;

  Appointment({
    this.bookingID,
    this.appointmentID,
    this.scheduleSerial,
    this.date,
    this.time,
    this.doctor,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      bookingID: json['bookingID'],
      appointmentID: json['appointmentID'],
      scheduleSerial: json['scheduleSerial'],
      date: json['date'],
      time: json['time'],
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingID': bookingID,
      'appointmentID': appointmentID,
      'scheduleSerial': scheduleSerial,
      'date': date,
      'time': time,
      'doctor': doctor?.toJson(),
    };
  }
}

class AppointmentResponse {
  final List<Appointment> appointments;

  AppointmentResponse({required this.appointments});

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentResponse(
      appointments: (json['appointments'] as List)
          .map((appointment) => Appointment.fromJson(appointment))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointments': appointments.map((appointment) => appointment.toJson()).toList(),
    };
  }
} 