import 'doctor_model.dart';

class TopDoctorsResponse {
  final List<Doctor> doctors;

  TopDoctorsResponse({required this.doctors});

  factory TopDoctorsResponse.fromJson(Map<String, dynamic> json) {
    return TopDoctorsResponse(
      doctors: (json['data'] as List)
          .map((doc) => Doctor.fromJson(doc))
          .toList(),
    );
  }
}


