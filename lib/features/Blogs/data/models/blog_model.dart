class Blog {
  final String id;
  final String? titleAr;
  final String? titleEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? image;

  Blog({
    required this.id,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.image,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'].toString(),
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      image: json['image'],
    );
  }
}

class BlogsResponse {
  final List<Blog>? articles;

  BlogsResponse({
    required this.articles,
  });

  factory BlogsResponse.fromJson(Map<String, dynamic> json) {
    return BlogsResponse(
      articles: (json['articles'] as List?)
          ?.map((article) => Blog.fromJson(article))
          .toList(),
    );
  }
}
