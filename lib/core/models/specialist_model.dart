class Specialist {
  final String? id;
  final String? nameEn;
  final String? nameAr;
  final String? specialtyID;
  final String? specialtyName;
  final String? specialtyArabicName;
  final String? availabilityStatus;
  final String? callCenterAppearance;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? name;

  Specialist({
     this.id,
     this.nameEn,
     this.nameAr,
     this.specialtyID,
     this.specialtyName,
     this.specialtyArabicName,
     this.availabilityStatus,
     this.callCenterAppearance,
     this.status,
     this.createdAt,
     this.updatedAt,
     this.name,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) {
    return Specialist(
      id: json['id']??"",
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      specialtyID: json['specialtyID']??"",
      specialtyName: json['specialtyName'] ?? '',
      specialtyArabicName: json['specialtyArabicName'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      callCenterAppearance: json['callCenterAppearance'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'specialtyID': specialtyID,
      'specialtyName': specialtyName,
      'specialtyArabicName': specialtyArabicName,
      'availabilityStatus': availabilityStatus,
      'callCenterAppearance': callCenterAppearance,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
    };
  }
}
