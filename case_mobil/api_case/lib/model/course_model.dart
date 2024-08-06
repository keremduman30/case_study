class CourseModel {
  int? id;
  String? title;
  String? subtitle;
  String? slug;
  String? date;
  String? image;
  String? createdAt;
  String? updatedAt;

  CourseModel(
      {this.id,
      this.title,
      this.subtitle,
      this.slug,
      this.date,
      this.image,
      this.createdAt,
      this.updatedAt});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    slug = json['slug'];
    date = json['date'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['slug'] = slug;
    data['date'] = date;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
