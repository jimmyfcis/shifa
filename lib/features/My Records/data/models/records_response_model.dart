import '../../../authentication/data/models/user.dart';

class RecordsResponseModel {
  final User? user;
  final List<Lab>? labs;
  final List<Rad>? rads;
  final List<Diagnosis>? diagnosis;
  final List<Complaint>? complaints;
  final List<PatientVitalSign>? patientVitalSigns;
  final List<PatientFinding>? pateintFindings;
  final List<PatientHistory>? patientHistory;
  final List<dynamic>? surgicalIntervention;
  final List<MedicalReport>? medicalReports;

  RecordsResponseModel({
    this.user,
    this.labs,
    this.rads,
    this.diagnosis,
    this.complaints,
    this.patientVitalSigns,
    this.pateintFindings,
    this.patientHistory,
    this.surgicalIntervention,
    this.medicalReports,
  });

  factory RecordsResponseModel.fromJson(Map<String, dynamic> json) {
    return RecordsResponseModel(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      labs: (json['labs'] as List?)?.map((e) => Lab.fromJson(e)).toList(),
      rads: (json['rads'] as List?)?.map((e) => Rad.fromJson(e)).toList(),
      diagnosis: (json['diagnosis'] as List?)?.map((e) => Diagnosis.fromJson(e)).toList(),
      complaints: (json['complaints'] as List?)?.map((e) => Complaint.fromJson(e)).toList(),
      patientVitalSigns: (json['patientVitalSigns'] as List?)?.map((e) => PatientVitalSign.fromJson(e)).toList(),
      pateintFindings: (json['pateintFindings'] as List?)?.map((e) => PatientFinding.fromJson(e)).toList(),
      patientHistory: (json['patientHistory'] as List?)?.map((e) => PatientHistory.fromJson(e)).toList(),
      surgicalIntervention: json['surgicalIntervention'],
      medicalReports: (json['medicalReports'] as List?)?.map((e) => MedicalReport.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
    'labs': labs?.map((e) => e.toJson()).toList(),
    'rads': rads?.map((e) => e.toJson()).toList(),
    'diagnosis': diagnosis?.map((e) => e.toJson()).toList(),
    'complaints': complaints?.map((e) => e.toJson()).toList(),
    'patientVitalSigns': patientVitalSigns?.map((e) => e.toJson()).toList(),
    'pateintFindings': pateintFindings?.map((e) => e.toJson()).toList(),
    'patientHistory': patientHistory?.map((e) => e.toJson()).toList(),
    'surgicalIntervention': surgicalIntervention,
    'medicalReports': medicalReports?.map((e) => e.toJson()).toList(),
  };
}
class Lab {
  final String? categoryId;
  final String? categoryAr;
  final String? categoryEn;
  final String? testId;
  final String? testNameAr;
  final String? testNameEn;
  final String? serviceStatusAr;
  final String? serviceStatusEn;
  final String? date;

  Lab({
    this.categoryId,
    this.categoryAr,
    this.categoryEn,
    this.testId,
    this.testNameAr,
    this.testNameEn,
    this.serviceStatusAr,
    this.serviceStatusEn,
    this.date,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
    categoryId: json['categoryId'],
    categoryAr: json['categoryAr'],
    categoryEn: json['categoryEn'],
    testId: json['testId'],
    testNameAr: json['testNameAr'],
    testNameEn: json['testNameEn'],
    serviceStatusAr: json['serviceStatusAr'],
    serviceStatusEn: json['serviceStatusEn'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'categoryId': categoryId,
    'categoryAr': categoryAr,
    'categoryEn': categoryEn,
    'testId': testId,
    'testNameAr': testNameAr,
    'testNameEn': testNameEn,
    'serviceStatusAr': serviceStatusAr,
    'serviceStatusEn': serviceStatusEn,
    'date': date,
  };
}

class Rad {
  final String? categoryId;
  final String? categoryAr;
  final String? categoryEn;
  final String? serviceId;
  final String? serviceNameAr;
  final String? serviceNameEn;
  final String? serviceStatusAr;
  final String? serviceStatusEn;
  final String? date;

  Rad({
    this.categoryId,
    this.categoryAr,
    this.categoryEn,
    this.serviceId,
    this.serviceNameAr,
    this.serviceNameEn,
    this.serviceStatusAr,
    this.serviceStatusEn,
    this.date,
  });

  factory Rad.fromJson(Map<String, dynamic> json) => Rad(
    categoryId: json['categoryId'],
    categoryAr: json['categoryAr'],
    categoryEn: json['categoryEn'],
    serviceId: json['serviceId'],
    serviceNameAr: json['serviceNameAr'],
    serviceNameEn: json['serviceNameEn'],
    serviceStatusAr: json['serviceStatusAr'],
    serviceStatusEn: json['serviceStatusEn'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'categoryId': categoryId,
    'categoryAr': categoryAr,
    'categoryEn': categoryEn,
    'serviceId': serviceId,
    'serviceNameAr': serviceNameAr,
    'serviceNameEn': serviceNameEn,
    'serviceStatusAr': serviceStatusAr,
    'serviceStatusEn': serviceStatusEn,
    'date': date,
  };
}
class Diagnosis {
  final String? desc;
  final String? date;

  Diagnosis({
    this.desc,
    this.date,
  });

  factory Diagnosis.fromJson(Map<String, dynamic> json) => Diagnosis(
    desc: json['desc'],
    date: json['Date'],
  );

  Map<String, dynamic> toJson() => {
    'desc': desc,
    'Date': date,
  };
}
class Complaint {
  final String? desc;
  final String? date;

  Complaint({
    this.desc,
    this.date,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
    desc: json['desc'],
    date: json['Date'],
  );

  Map<String, dynamic> toJson() => {
    'desc': desc,
    'Date': date,
  };
}
class PatientVitalSign {
  final String? nameAr;
  final String? nameEn;
  final VitalDetail? details;

  PatientVitalSign({
    this.nameAr,
    this.nameEn,
    this.details,
  });

  factory PatientVitalSign.fromJson(Map<String, dynamic> json) => PatientVitalSign(
    nameAr: json['nameAr'],
    nameEn: json['nameEn'],
    details: json['details'] != null ? VitalDetail.fromJson(json['details']) : null,
  );

  Map<String, dynamic> toJson() => {
    'nameAr': nameAr,
    'nameEn': nameEn,
    'details': details?.toJson(),
  };
}

class VitalDetail {
  final dynamic value;
  final String? date;

  VitalDetail({
    this.value,
    this.date,
  });

  factory VitalDetail.fromJson(Map<String, dynamic> json) => VitalDetail(
    value: json['Value'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'Value': value,
    'date': date,
  };
}
class PatientFinding {
  final String? descAr;
  final String? descEn;
  final String? date;

  PatientFinding({
    this.descAr,
    this.descEn,
    this.date,
  });

  factory PatientFinding.fromJson(Map<String, dynamic> json) => PatientFinding(
    descAr: json['descAr'],
    descEn: json['descEn'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'descAr': descAr,
    'descEn': descEn,
    'date': date,
  };
}
class PatientHistory {
  final String? name;
  final String? type;
  final String? date;

  PatientHistory({
    this.name,
    this.type,
    this.date,
  });

  factory PatientHistory.fromJson(Map<String, dynamic> json) => PatientHistory(
    name: json['Name'],
    type: json['Type'],
    date: json['Date'],
  );

  Map<String, dynamic> toJson() => {
    'Name': name,
    'Type': type,
    'Date': date,
  };
}
class MedicalReport {
  final String? serial;
  final String? visitNumber;
  final String? visitTypeAr;
  final String? visitTypeEn;
  final String? visitStartdate;
  final String? visitEnddate;
  final String? reportName;

  MedicalReport({
    this.serial,
    this.visitNumber,
    this.visitTypeAr,
    this.visitTypeEn,
    this.visitStartdate,
    this.visitEnddate,
    this.reportName,
  });

  factory MedicalReport.fromJson(Map<String, dynamic> json) => MedicalReport(
    serial: json['Serial'],
    visitNumber: json['VisitNumber'],
    visitTypeAr: json['VisitTypeAr'],
    visitTypeEn: json['VisitTypeEn'],
    visitStartdate: json['VisitStartdate'],
    visitEnddate: json['VisitEnddate'],
    reportName: json['ReportName'],
  );

  Map<String, dynamic> toJson() => {
    'Serial': serial,
    'VisitNumber': visitNumber,
    'VisitTypeAr': visitTypeAr,
    'VisitTypeEn': visitTypeEn,
    'VisitStartdate': visitStartdate,
    'VisitEnddate': visitEnddate,
    'ReportName': reportName,
  };
}
