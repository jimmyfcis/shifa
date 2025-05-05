class Clinic {
  final int id;
  final int physicianID;
  final int clinicId;
  final String createdAt;
  final String updatedAt;

  Clinic({
    required this.id,
    required this.physicianID,
    required this.clinicId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      physicianID: json['physicianID'],
      clinicId: json['clinic_id'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
