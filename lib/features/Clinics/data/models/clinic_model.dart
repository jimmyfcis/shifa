import 'package:shifa/features/Home/data/models/doctor_model.dart';

class Clinic {
  final String name;
  final String? icon;
  final List<Doctor>? doctors;

  Clinic({
    required this.name,
    this.icon,
    required this.doctors,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    List<Doctor> doctorsList = [];
    
    if (json['doctors'] is List) {
      doctorsList = (json['doctors'] as List)
          .where((doctor) => doctor is Map<String, dynamic> && doctor['name'] != '')
          .map((doctor) => Doctor.fromJson(doctor))
          .toList();
    } else if (json['doctors'] is Map) {
      doctorsList = (json['doctors'] as Map)
          .values
          .where((doctor) => doctor is Map<String, dynamic> && doctor['name'] != '')
          .map((doctor) => Doctor.fromJson(doctor as Map<String, dynamic>))
          .toList();
    }

    return Clinic(
      name: json['name'] ?? '',
      icon: json['icon'],
      doctors: doctorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'doctors': doctors?.map((e) => e.toJson()).toList(),

    };
  }
} 