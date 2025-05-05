import 'package:shifa/features/Home/data/models/specialist_model.dart';

import 'clinic_model.dart';

class Doctor {
  final int id;
  final String physicianID;
  final String contractType;
  final String firstName;
  final String secondName;
  final String thirdName;
  final String fourthName;
  final String firstNameAR;
  final String secondNameAR;
  final String thirdNameAR;
  final String fourthNameAR;
  final String gender;
  final String dateOfBirth;
  final String nationality;
  final int specialtyID;
  final String availabilityStatus;
  final String descriptionAr;
  final String descriptionEn;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String rate;
  final String description;
  final String name;
  final String schedule;
  final List<Clinic> clinics;
  final Specialist specialist;

  Doctor({
    required this.id,
    required this.physicianID,
    required this.contractType,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.fourthName,
    required this.firstNameAR,
    required this.secondNameAR,
    required this.thirdNameAR,
    required this.fourthNameAR,
    required this.gender,
    required this.dateOfBirth,
    required this.nationality,
    required this.specialtyID,
    required this.availabilityStatus,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.rate,
    required this.description,
    required this.name,
    required this.schedule,
    required this.clinics,
    required this.specialist,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      physicianID: json['physicianID'] ?? '',
      contractType: json['contractType'] ?? '',
      firstName: json['firstName'] ?? '',
      secondName: json['secondName'] ?? '',
      thirdName: json['thirdName'] ?? '',
      fourthName: json['fourthName'] ?? '',
      firstNameAR: json['firstNameAR'] ?? '',
      secondNameAR: json['secondNameAR'] ?? '',
      thirdNameAR: json['thirdNameAR'] ?? '',
      fourthNameAR: json['fourthNameAR'] ?? '',
      gender: json['gender'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      nationality: json['nationality'] ?? '',
      specialtyID: json['specialtyID'],
      availabilityStatus: json['availabilityStatus'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      rate: json['rate'] ?? '',
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      schedule: json['schedule'] ?? '',
      clinics: (json['clinics'] as List<dynamic>)
          .map((e) => Clinic.fromJson(e))
          .toList(),
      specialist: Specialist.fromJson(json['specialist']),
    );
  }
}