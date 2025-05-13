import 'package:shifa/features/Labs/data/models/lab_model.dart';

class LabResponse {
  final List<Lab> labs;

  LabResponse({required this.labs});

  factory LabResponse.fromJson(Map<String, dynamic> json) {
    return LabResponse(
      labs: (json['labs'] as List?)
          ?.map((lab) => Lab.fromJson(lab))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'labs': labs.map((lab) => lab.toJson()).toList(),
    };
  }
} 