class Clinic {
  final int? id;
  final int? physicianID;
  final int? clinicId;
  final String? createdAt;
  final String? updatedAt;

  Clinic({
     this.id,
     this.physicianID,
     this.clinicId,
     this.createdAt,
     this.updatedAt,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id']??0,
      physicianID: json['physicianID']??0,
      clinicId: json['clinic_id']??0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'physicianID': physicianID,
      'clinic_id': clinicId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
