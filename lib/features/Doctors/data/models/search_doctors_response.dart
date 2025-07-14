import '../../../../core/models/doctor_model.dart';

class SearchDoctorsResponse {
  final List<Doctor>? doctors;
  final Pagination? pagination;

  SearchDoctorsResponse({required this.doctors,required this.pagination,});

  factory SearchDoctorsResponse.fromJson(Map<String, dynamic> json) {
    return SearchDoctorsResponse(
      doctors: (json['data'] as List?)
          ?.map((doc) => Doctor.fromJson(doc))
          .toList(),
      pagination: json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null,
    );
  }
}


class Pagination {
  int? currentPage;
  int? perPage;
  int? total;
  int? lastPage;
  String? nextPageUrl;
  String? prevPageUrl;

  Pagination({
    this.currentPage,
    this.perPage,
    this.total,
    this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      perPage: json['per_page'],
      total: json['total'],
      lastPage: json['last_page'],
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
    );
  }
}