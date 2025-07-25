class FileResponseModel {
  final FileData? file;

  FileResponseModel({this.file});

  factory FileResponseModel.fromJson(Map<String, dynamic> json) {
    return FileResponseModel(
      file: json['file'] != null ? FileData.fromJson(json['file']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file': file?.toJson(),
    };
  }
}

class FileData {
  final String? base64;
  final String? accessionNo;

  FileData({this.base64, this.accessionNo});

  factory FileData.fromJson(Map<String, dynamic> json) {
    return FileData(
      base64: json['base64'] as String?,
      accessionNo: json['accession_no'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base64': base64,
      'accession_no': accessionNo,
    };
  }
}
