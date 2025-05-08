import 'package:shifa/features/Clinics/data/models/clinic_doctor_model.dart';

class ClinicModel {
  final String name;
  final String? icon;
  final List<ClinicDoctor> doctors;

  ClinicModel({
    required this.name,
    this.icon,
    required this.doctors,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    List<ClinicDoctor> doctorsList = [];
    
    if (json['doctors'] is List) {
      doctorsList = (json['doctors'] as List)
          .where((doctor) => doctor is Map<String, dynamic> && doctor['name'] != '')
          .map((doctor) => ClinicDoctor.fromJson(doctor))
          .toList();
    } else if (json['doctors'] is Map) {
      doctorsList = (json['doctors'] as Map)
          .values
          .where((doctor) => doctor is Map<String, dynamic> && doctor['name'] != '')
          .map((doctor) => ClinicDoctor.fromJson(doctor as Map<String, dynamic>))
          .toList();
    }

    return ClinicModel(
      name: json['name'] ?? '',
      icon: json['icon'],
      doctors: doctorsList,
    );
  }
} 