class RecordsRequestModel {
  final String patientID;
  final String visitID;

  RecordsRequestModel({required this.patientID, required this.visitID});

  Map<String, dynamic> toJson() => {
    "patientID": patientID,
    "visitID": visitID,
  };
}