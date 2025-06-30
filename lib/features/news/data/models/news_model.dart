class NewResponseModel {
  List<NewsItem>? news;

  NewResponseModel({this.news});

  factory NewResponseModel.fromJson(Map<String, dynamic> json) {
    return NewResponseModel(
      news: (json['news'] as List<dynamic>?)
          ?.map((item) => NewsItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'news': news?.map((item) => item.toJson()).toList(),
    };
  }
}

class NewsItem {
  int? id;
  String? leksell;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? slugAr;
  String? slugEn;
  String? status;
  String? date;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  List<Media>? media;

  NewsItem({
    this.id,
    this.leksell,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.slugAr,
    this.slugEn,
    this.status,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.media,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'] as int?,
      leksell: json['leksell'] as String?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
      slugAr: json['slug_ar'] as String?,
      slugEn: json['slug_en'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      imageUrl: json['image_url'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((item) => Media.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'leksell': leksell,
      'title_ar': titleAr,
      'title_en': titleEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'slug_ar': slugAr,
      'slug_en': slugEn,
      'status': status,
      'date': date,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
      'media': media?.map((item) => item.toJson()).toList(),
    };
  }
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  List<dynamic>? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.originalUrl,
    this.previewUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'] as int?,
      modelType: json['model_type'] as String?,
      modelId: json['model_id'] as int?,
      uuid: json['uuid'] as String?,
      collectionName: json['collection_name'] as String?,
      name: json['name'] as String?,
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
      disk: json['disk'] as String?,
      conversionsDisk: json['conversions_disk'] as String?,
      size: json['size'] as int?,
      manipulations: json['manipulations'] as List<dynamic>?,
      customProperties: json['custom_properties'] as List<dynamic>?,
      generatedConversions: json['generated_conversions'] as List<dynamic>?,
      responsiveImages: json['responsive_images'] as List<dynamic>?,
      orderColumn: json['order_column'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      originalUrl: json['original_url'] as String?,
      previewUrl: json['preview_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model_type': modelType,
      'model_id': modelId,
      'uuid': uuid,
      'collection_name': collectionName,
      'name': name,
      'file_name': fileName,
      'mime_type': mimeType,
      'disk': disk,
      'conversions_disk': conversionsDisk,
      'size': size,
      'manipulations': manipulations,
      'custom_properties': customProperties,
      'generated_conversions': generatedConversions,
      'responsive_images': responsiveImages,
      'order_column': orderColumn,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'original_url': originalUrl,
      'preview_url': previewUrl,
    };
  }
}
