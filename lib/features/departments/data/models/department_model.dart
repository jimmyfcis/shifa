class DepartmentModel {
  final int id;
  final String? leksell;
  final String? banner;
  final String? titleEn;
  final String? titleAr;
  final String? description;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? slugEn;
  final String? slugAr;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? contentAr;
  final String? contentEn;
  final String? title;
  final String? slug;
  final String? image;
  final List<dynamic>? media;

  DepartmentModel({
    required this.id,
     this.leksell,
    this.banner,
     this.titleEn,
     this.titleAr,
     this.description,
     this.descriptionAr,
     this.descriptionEn,
    this.slugEn,
    this.slugAr,
     this.status,
     this.createdAt,
     this.updatedAt,
     this.contentAr,
     this.contentEn,
     this.title,
     this.slug,
     this.image,
     this.media,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      leksell: json['leksell'],
      banner: json['banner'],
      titleEn: json['title_en'],
      titleAr: json['title_ar'],
      description: json['description'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      slugEn: json['slug_en'],
      slugAr: json['slug_ar'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      contentAr: json['content_ar'],
      contentEn: json['content_en'],
      title: json['title'],
      slug: json['slug'],
      image: json['image'],
      media: json['media'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'leksell': leksell,
      'banner': banner,
      'title_en': titleEn,
      'title_ar': titleAr,
      'description': description,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'slug_en': slugEn,
      'slug_ar': slugAr,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'content_ar': contentAr,
      'content_en': contentEn,
      'title': title,
      'slug': slug,
      'image': image,
      'media': media,
    };
  }
} 