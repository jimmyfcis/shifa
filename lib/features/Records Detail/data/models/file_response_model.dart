class FileResponseModel {
  final String? base64;
  final String? error;

  FileResponseModel({this.base64, this.error});

  factory FileResponseModel.fromJson(Map<String, dynamic> json) {
    return FileResponseModel(
      base64: json['base64'] as String?,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base64': base64,
      'error': error,
    };
  }
}
