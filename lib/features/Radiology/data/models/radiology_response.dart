import 'package:shifa/features/Radiology/data/models/radiology_model.dart';

class RadiologyResponse {
  final List<Radiology> radiologies;

  RadiologyResponse({required this.radiologies});

  factory RadiologyResponse.fromJson(Map<String, dynamic> json) {
    return RadiologyResponse(
      radiologies: (json['radiologies'] as List?)
          ?.map((radiology) => Radiology.fromJson(radiology))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'radiologies': radiologies.map((radiology) => radiology.toJson()).toList(),
    };
  }
} 