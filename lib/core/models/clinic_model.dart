import 'package:shifa/core/models/doctor_model.dart';

class Clinic {
  final String name;
  final String? icon;
  final List<Doctor>? doctors;
  final int? id;
  final int? physicianID;
  final int? clinicId;
  final String? createdAt;
  final String? updatedAt;

  Clinic({
    required this.name,
    this.icon,
    required this.doctors,
    this.id,
    this.physicianID,
    this.clinicId,
    this.createdAt,
    this.updatedAt,
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
      id: json['id']??0,
      physicianID: json['physicianID']??0,
      clinicId: json['clinic_id']??0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'],
      doctors: doctorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'physicianID': physicianID,
      'clinic_id': clinicId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'icon': icon,
      'doctors': doctors?.map((e) => e.toJson()).toList(),

    };
  }
} 