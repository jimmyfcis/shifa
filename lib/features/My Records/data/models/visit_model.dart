class Visit {
  final String? visitNumber;
  final String? visitTypeAr;
  final String? visitTypeEn;
  final String? visitStartdate;
  final String? visitEnddate;
  final String? placeNameAr;
  final String? placeNameEn;
  final String? doctorNameAr;
  final String? doctorNameEn;
  final String? doctorSpecialtyAr;
  final String? doctorSpecialtyEn;

  Visit({
    this.visitNumber,
    this.visitTypeAr,
    this.visitTypeEn,
    this.visitStartdate,
    this.visitEnddate,
    this.placeNameAr,
    this.placeNameEn,
    this.doctorNameAr,
    this.doctorNameEn,
    this.doctorSpecialtyAr,
    this.doctorSpecialtyEn,
  });

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      visitNumber: json['VisitNumber'],
      visitTypeAr: json['VisitTypeAr'],
      visitTypeEn: json['VisitTypeEn'],
      visitStartdate: json['VisitStartdate'],
      visitEnddate: json['VisitEnddate'],
      placeNameAr: json['PlaceNameAr'],
      placeNameEn: json['PlaceNameEn'],
      doctorNameAr: json['DoctorNameAr'],
      doctorNameEn: json['DoctorNameEn'],
      doctorSpecialtyAr: json['DoctorSpecialtyAr'],
      doctorSpecialtyEn: json['DoctorSpecialtyEn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'VisitNumber': visitNumber,
      'VisitTypeAr': visitTypeAr,
      'VisitTypeEn': visitTypeEn,
      'VisitStartdate': visitStartdate,
      'VisitEnddate': visitEnddate,
      'PlaceNameAr': placeNameAr,
      'PlaceNameEn': placeNameEn,
      'DoctorNameAr': doctorNameAr,
      'DoctorNameEn': doctorNameEn,
      'DoctorSpecialtyAr': doctorSpecialtyAr,
      'DoctorSpecialtyEn': doctorSpecialtyEn,
    };
  }
} 