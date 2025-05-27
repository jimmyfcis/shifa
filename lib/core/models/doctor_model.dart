import 'package:intl/intl.dart';
import 'package:shifa/core/models/specialist_model.dart';
import 'clinic_model.dart';

class ScheduleSlot {
  final String? timeStart;
  final String? timeEnd;

  ScheduleSlot({
    this.timeStart,
    this.timeEnd,
  });

  factory ScheduleSlot.fromJson(Map<String, dynamic> json) {
    return ScheduleSlot(
      timeStart: json['timeStart'],
      timeEnd: json['timeEnd'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeStart': timeStart,
      'timeEnd': timeEnd,
    };
  }
}

class Schedule {
  final String? clinicID;
  final String? physicianID;
  final String? physicianNameAr;
  final String? physicianNameEn;
  final DateTime? shiftDate;
  final int? shift;
  final int? dayOfWeek;
  final String? dayNameAr;
  final String? dayNameEn;
  final int? blockFlag;
  final List<ScheduleSlot>? slots;

  Schedule({
    this.clinicID,
    this.physicianID,
    this.physicianNameAr,
    this.physicianNameEn,
    this.shiftDate,
    this.shift,
    this.dayOfWeek,
    this.dayNameAr,
    this.dayNameEn,
    this.blockFlag,
    this.slots,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    final formatter = DateFormat('dd/MM/yyyy');
    return Schedule(
      clinicID: json['clinicID']??"",
      physicianID: json['physicianID']??"",
      physicianNameAr: json['physicianNameAr'],
      physicianNameEn: json['physicianNameEn'],
      shiftDate: formatter.parse(json['shiftDate']),
      shift: json['shift'],
      dayOfWeek: json['dayOfWeek'],
      dayNameAr: json['dayNameAr'],
      dayNameEn: json['dayNameEn'],
      blockFlag: json['blockFlag'],
      slots: (json['slots'] as List?)?.map((e) => ScheduleSlot.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clinicID': clinicID,
      'physicianID': physicianID,
      'physicianNameAr': physicianNameAr,
      'physicianNameEn': physicianNameEn,
      'shiftDate': shiftDate,
      'shift': shift,
      'dayOfWeek': dayOfWeek,
      'dayNameAr': dayNameAr,
      'dayNameEn': dayNameEn,
      'blockFlag': blockFlag,
      'slots': slots?.map((e) => e.toJson()).toList(),
    };
  }
}


class Doctor {
  final String? id;
  final String? leksell;
  final String? rate;
  final int? serviceId;
  final String? physicianID;
  final String? arabicNickname;
  final String? englishNickname;
  final String? physicianCode;
  final String? contractType;
  final String? nameAR;
  final String? gender;
  final String? image;
  final String? dateOfBirth;
  final String? nationality;
  final String? specialtyID;
  final String? availabilityStatus;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? description;
  final String? name;
  final String? schedule;
  final List<Clinic>? clinics;
  final Specialist? specialist;
  final List<Schedule>? schedules;

  Doctor({
    this.id,
    this.leksell,
    this.rate,
    this.serviceId,
    this.physicianID,
    this.arabicNickname,
    this.englishNickname,
    this.physicianCode,
    this.contractType,
    this.gender,
    this.dateOfBirth,
    this.nationality,
    this.specialtyID,
    this.availabilityStatus,
    this.descriptionAr,
    this.descriptionEn,
    this.status,
    this.createdAt,
    this.image,
    this.updatedAt,
    this.description,
    this.name,
    this.nameAR,
    this.schedule,
    this.clinics,
    this.specialist,
    this.schedules,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id']??"",
      image: json['image']??"",
      leksell: json['leksell'],
      rate: json['rate'],
      serviceId: json['service_id'],
      physicianID: json['physicianID']??"",
      arabicNickname: json['arabicNickname'],
      englishNickname: json['englishNickname'],
      physicianCode: json['physicianCode'],
      contractType: json['contractType'] ?? '',
      nameAR: json['nameAr'] ?? '',
      gender: json['gender'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      nationality: json['nationality'] ?? '',
      specialtyID: json['specialtyID']??"",
      availabilityStatus: json['availabilityStatus'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      schedule: json['schedule'] ?? '',
      clinics: (json['clinics'] as List?)?.map((e) => Clinic.fromJson(e)).toList(),
      specialist: json['specialist'] != null ? Specialist.fromJson(json['specialist']) : null,
      schedules: (json['schedules'] as List?)?.map((e) => Schedule.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'leksell': leksell,
      'rate': rate,
      'service_id': serviceId,
      'physicianID': physicianID,
      'arabicNickname': arabicNickname,
      'englishNickname': englishNickname,
      'physicianCode': physicianCode,
      'contractType': contractType,
      'nameAr': nameAR,
      'gender': gender,
      'image': image,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
      'specialtyID': specialtyID,
      'availabilityStatus': availabilityStatus,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'description': description,
      'name': name,
      'schedule': schedule,
      'clinics': clinics?.map((e) => e.toJson()).toList(),
      'specialist': specialist?.toJson(),
      'schedules': schedules?.map((e) => e.toJson()).toList(),
    };
  }
}
