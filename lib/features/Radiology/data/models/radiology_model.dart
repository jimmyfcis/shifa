class Radiology {
  final String? doctorId;
  final String? doctorNameAr;
  final String? doctorNameEn;
  final String? locationId;
  final String? locationAr;
  final String? locationEn;
  final String? visitNo;
  final String? visitTypeAr;
  final String? visitTypeEn;
  final String? date;
  final String? accessionNo;

  Radiology({
    this.doctorId,
    this.doctorNameAr,
    this.doctorNameEn,
    this.locationId,
    this.locationAr,
    this.locationEn,
    this.visitNo,
    this.visitTypeAr,
    this.visitTypeEn,
    this.date,
    this.accessionNo,
  });

  factory Radiology.fromJson(Map<String, dynamic> json) {
    return Radiology(
      doctorId: json['doctorId'],
      doctorNameAr: json['doctorNameAr'],
      doctorNameEn: json['doctorNameEn'],
      locationId: json['locationId'],
      locationAr: json['locationAr'],
      locationEn: json['locationEn'],
      visitNo: json['visitNo'],
      visitTypeAr: json['visitTypeAr'],
      visitTypeEn: json['visitTypeEn'],
      date: json['date'],
      accessionNo: json['accessionNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'doctorNameAr': doctorNameAr,
      'doctorNameEn': doctorNameEn,
      'locationId': locationId,
      'locationAr': locationAr,
      'locationEn': locationEn,
      'visitNo': visitNo,
      'visitTypeAr': visitTypeAr,
      'visitTypeEn': visitTypeEn,
      'date': date,
      'accessionNo': accessionNo,
    };
  }
} 