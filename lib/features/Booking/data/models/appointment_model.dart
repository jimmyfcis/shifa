import 'package:shifa/core/models/doctor_model.dart';

class Appointment {
  final String? id;
  final String? appointmentID;
  final String? clinicID;
  final String? scheduleSerial;
  final String? date;
  final String? ticketNumber;
  final String? time;
  final Doctor? doctor;

  Appointment({
    this.id,
    this.appointmentID,
    this.scheduleSerial,
    this.clinicID,
    this.date,
    this.time,
    this.ticketNumber,
    this.doctor,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id']??"",
      appointmentID: json['appointmentID']??"",
      clinicID: json['clinicID']??"",
      scheduleSerial: json['scheduleSerial']??"",
      ticketNumber: json['ticketNumber']??"",
      date: json['date']??"",
      time: json['time']??"",
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'appointmentID': appointmentID,
      'clinicID': clinicID,
      'scheduleSerial': scheduleSerial,
      'ticketNumber': ticketNumber,
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