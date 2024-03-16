
class Season {
  int? id;
  String? title, season, slug, web_url;

  Season.fromJson(json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    season = json['season'] ?? "";
    slug = json['slug'] ?? "";
    web_url = json['web_url'] ?? "";
  }
}
