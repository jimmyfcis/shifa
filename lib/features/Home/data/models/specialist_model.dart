class Specialist {
  final int id;
  final String nameEn;
  final String nameAr;
  final int specialtyID;
  final String specialtyName;
  final String specialtyArabicName;
  final String availabilityStatus;
  final String callCenterAppearance;
  final String status;
  final dynamic userId;
  final String createdAt;
  final String updatedAt;
  final String name;

  Specialist({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.specialtyID,
    required this.specialtyName,
    required this.specialtyArabicName,
    required this.availabilityStatus,
    required this.callCenterAppearance,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) {
    return Specialist(
      id: json['id'],
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      specialtyID: json['specialtyID'],
      specialtyName: json['specialtyName'] ?? '',
      specialtyArabicName: json['specialtyArabicName'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      callCenterAppearance: json['callCenterAppearance'] ?? '',
      status: json['status'] ?? '',
      userId: json['user_id'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
