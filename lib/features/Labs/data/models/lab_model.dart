class Lab {
  final String? doctorId;
  final String? doctorNameAr;
  final String? doctorNameEn;
  final int? patFinAccount;
  final String? locationId;
  final String? locationAr;
  final String? locationEn;
  final String? visitNo;
  final String? visitTypeAr;
  final String? visitTypeEn;
  final String? startDate;
  final String? endDate;

  Lab({
    this.doctorId,
    this.doctorNameAr,
    this.doctorNameEn,
    this.patFinAccount,
    this.locationId,
    this.locationAr,
    this.locationEn,
    this.visitNo,
    this.visitTypeAr,
    this.visitTypeEn,
    this.startDate,
    this.endDate,
  });

  factory Lab.fromJson(Map<String, dynamic> json) {
    return Lab(
      doctorId: json['doctorId'],
      doctorNameAr: json['doctorNameAr'],
      doctorNameEn: json['doctorNameEn'],
      patFinAccount: json['patFinAccount'],
      locationId: json['locationId'],
      locationAr: json['locationAr'],
      locationEn: json['locationEn'],
      visitNo: json['visitNo'],
      visitTypeAr: json['visitTypeAr'],
      visitTypeEn: json['visitTypeEn'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'doctorNameAr': doctorNameAr,
      'doctorNameEn': doctorNameEn,
      'patFinAccount': patFinAccount,
      'locationId': locationId,
      'locationAr': locationAr,
      'locationEn': locationEn,
      'visitNo': visitNo,
      'visitTypeAr': visitTypeAr,
      'visitTypeEn': visitTypeEn,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
} 