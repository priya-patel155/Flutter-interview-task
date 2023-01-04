class CategoryMovieModel {
  String? categoryId;
  String? categoryName;
  int? parentId;
  List<Movie>? movie;

  CategoryMovieModel(
      {this.categoryId, this.categoryName, this.parentId, this.movie});

  CategoryMovieModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
    if (json['movie'] != null) {
      movie = <Movie>[];
      json['movie'].forEach((v) {
        movie!.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['parent_id'] = this.parentId;
    if (this.movie != null) {
      data['movie'] = this.movie!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  int? num;
  String? name;
  String? title;
  String? year;
  String? streamType;
  String? streamId;
  String? streamIcon;
  String? rating;
  String? rating5based;
  String? added;
  String? categoryId;
  List<int>? categoryIds;
  String? containerExtension;
  String? customSid;
  String? directSource;

  Movie(
      {this.num,
      this.name,
      this.title,
      this.year,
      this.streamType,
      this.streamId,
      this.streamIcon,
      this.rating,
      this.rating5based,
      this.added,
      this.categoryId,
      this.categoryIds,
      this.containerExtension,
      this.customSid,
      this.directSource});

  Movie.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
    title = json['title'];
    year = json['year'];
    streamType = json['stream_type'];
    streamId = json['stream_id'].toString();
    streamIcon = json['stream_icon'];
    rating = json['rating'].toString();
    rating5based = json['rating_5based'].toString();
    added = json['added'];
    categoryId = json['category_id'];
    categoryIds = json['category_ids'].cast<int>();
    containerExtension = json['container_extension'];
    customSid = json['custom_sid'];
    directSource = json['direct_source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    data['title'] = this.title;
    data['year'] = this.year;
    data['stream_type'] = this.streamType;
    data['stream_id'] = this.streamId;
    data['stream_icon'] = this.streamIcon;
    data['rating'] = this.rating;
    data['rating_5based'] = this.rating5based;
    data['added'] = this.added;
    data['category_id'] = this.categoryId;
    data['category_ids'] = this.categoryIds;
    data['container_extension'] = this.containerExtension;
    data['custom_sid'] = this.customSid;
    data['direct_source'] = this.directSource;
    return data;
  }
}
