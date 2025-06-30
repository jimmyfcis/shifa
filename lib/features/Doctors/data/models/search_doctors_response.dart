import '../../../../core/models/doctor_model.dart';

class SearchDoctorsResponse {
  final List<Doctor>? doctors;

  SearchDoctorsResponse({required this.doctors});

  factory SearchDoctorsResponse.fromJson(Map<String, dynamic> json) {
    return SearchDoctorsResponse(
      doctors: (json['data'] as List?)
          ?.map((doc) => Doctor.fromJson(doc))
          .toList(),
    );
  }
}
