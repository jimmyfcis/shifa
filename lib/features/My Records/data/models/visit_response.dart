import 'package:shifa/features/My%20Records/data/models/visit_model.dart';

class VisitResponse {
  final List<Visit> visits;

  VisitResponse({required this.visits});

  factory VisitResponse.fromJson(Map<String, dynamic> json) {
    return VisitResponse(
      visits: (json['visits'] as List?)
          ?.map((visit) => Visit.fromJson(visit))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'visits': visits.map((visit) => visit.toJson()).toList(),
    };
  }
} 