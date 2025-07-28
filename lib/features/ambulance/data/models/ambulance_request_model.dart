class AmbulanceRequestModel {
  String? buildingNumber;
  String? addressDetails;
  String? floorNumber;
  String? patientName;
  String? phoneNumber;
  String? patientConditionDescription;
  String? additionalNotes;
  String? userId;

  AmbulanceRequestModel({
    this.buildingNumber,
    this.addressDetails,
    this.floorNumber,
    this.patientName,
    this.phoneNumber,
    this.patientConditionDescription,
    this.additionalNotes,
    this.userId,
  });

  factory AmbulanceRequestModel.fromJson(Map<String, dynamic> json) {
    return AmbulanceRequestModel(
      buildingNumber: json['building_number'] as String?,
      addressDetails: json['address_details'] as String?,
      floorNumber: json['floor_number'] as String?,
      patientName: json['patient_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      patientConditionDescription: json['patient_condition_description'] as String?,
      additionalNotes: json['additional_notes'] as String?,
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'building_number': buildingNumber,
      'address_details': addressDetails,
      'floor_number': floorNumber,
      'patient_name': patientName,
      'phone_number': phoneNumber,
      'patient_condition_description': patientConditionDescription,
      'additional_notes': additionalNotes,
      'user_id': userId,
    };
  }
}
