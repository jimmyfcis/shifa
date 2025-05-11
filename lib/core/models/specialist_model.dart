class Specialist {
  final int? id;
  final String? nameEn;
  final String? nameAr;
  final int? specialtyID;
  final String? specialtyName;
  final String? specialtyArabicName;
  final String? availabilityStatus;
  final String? callCenterAppearance;
  final String? status;
  final int? userId;
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
     this.userId,
     this.createdAt,
     this.updatedAt,
     this.name,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) {
    return Specialist(
      id: json['id']??0,
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      specialtyID: json['specialtyID']??0,
      specialtyName: json['specialtyName'] ?? '',
      specialtyArabicName: json['specialtyArabicName'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      callCenterAppearance: json['callCenterAppearance'] ?? '',
      status: json['status'] ?? '',
      userId: json['user_id']??0,
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
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
    };
  }
}
