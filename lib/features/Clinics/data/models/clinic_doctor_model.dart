class ClinicDoctor {
  final int id;
  final String name;

  ClinicDoctor({
    required this.id,
    required this.name,
  });

  factory ClinicDoctor.fromJson(Map<String, dynamic> json) {
    return ClinicDoctor(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
} 