import 'package:shifa/features/Home/data/models/specialist_model.dart';

import '../../../Clinics/data/models/clinic_model.dart';

class Doctor {
  final int? id;
  final String? physicianID;
  final String? contractType;
  final String? firstName;
  final String? secondName;
  final String? thirdName;
  final String? fourthName;
  final String? firstNameAR;
  final String? secondNameAR;
  final String? thirdNameAR;
  final String? fourthNameAR;
  final String? gender;
  final String? dateOfBirth;
  final String? nationality;
  final int? specialtyID;
  final String? availabilityStatus;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? rate;
  final String? description;
  final String? name;
  final String? schedule;
  final List<Clinic>? clinics;
  final Specialist? specialist;

  Doctor({
    this.id,
    this.physicianID,
    this.contractType,
    this.firstName,
    this.secondName,
    this.thirdName,
    this.fourthName,
    this.firstNameAR,
    this.secondNameAR,
    this.thirdNameAR,
    this.fourthNameAR,
    this.gender,
    this.dateOfBirth,
    this.nationality,
    this.specialtyID,
    this.availabilityStatus,
    this.descriptionAr,
    this.descriptionEn,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.rate,
    this.description,
    this.name,
    this.schedule,
    this.clinics,
    this.specialist,
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
      clinics: (json['clinics'] as List?)?.map((e) => Clinic.fromJson(e)).toList(),
      specialist: json['specialist'] != null
          ? Specialist.fromJson(json['specialist'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'physicianID': physicianID,
      'contractType': contractType,
      'firstName': firstName,
      'secondName': secondName,
      'thirdName': thirdName,
      'fourthName': fourthName,
      'firstNameAR': firstNameAR,
      'secondNameAR': secondNameAR,
      'thirdNameAR': thirdNameAR,
      'fourthNameAR': fourthNameAR,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
      'specialtyID': specialtyID,
      'availabilityStatus': availabilityStatus,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'rate': rate,
      'description': description,
      'name': name,
      'schedule': schedule,
      'clinics': clinics?.map((e) => e.toJson()).toList(),
      'specialist': specialist?.toJson(),
    };
  }
}
