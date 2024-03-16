class Genres {
  int? id, sequence, status;
  String? name, slug, profile_icon;

  Genres.fromJson(json) {
    id = json["id"] ?? 0;
    sequence = json["sequence"] ?? 0;
    status = json["status"] ?? 0;
    name = json["name"];
    slug = json["slug"];
    profile_icon = json["profile_icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['profile_icon'] = this.profile_icon;
    data['sequence'] = this.sequence;
    data['status'] = this.status;
    return data;
  }
}

class GenresResponse {
  bool? success;
  String? message;
  List<Genres> genres = [];

  GenresResponse.fromJson(json) {
    success = json["success"] ?? true;
    message = json["message"];
    genres = json["result"] == null
        ? []
        : (json["result"] as List).map((e) => Genres.fromJson(e)).toList();
  }

  GenresResponse.withError(msg){
    success = false;
    message = msg;
  }

}
