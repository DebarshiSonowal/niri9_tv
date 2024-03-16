// {
// "id": 1,
// "name": "Assamese",
// "slug": "assamese",
// "short_code": "as",
// "local_name": "অসমীয়া",
// "profile_pic": "http://test.niri9.com/public/assets/languages/assamese-pic.jpg",
// "status": 1
// },

class Language {
  int? id, status;
  String? name, slug, local_name, profile_pic;

  Language.fromJson(json) {
    id = json['id'] ?? 0;
    status = json['status'] ?? 0;
    name = json['name'] ?? "";
    slug = json['slug'] ?? "";
    local_name = json['local_name'] ?? "";
    profile_pic = json['profile_pic'] ?? "";
  }
}

//            "language_id": 6,
//                 "video_id": 71,
//                 "web_url": "http://test.niri9.com/web-series/illegal-bengali/231214115232",
//                 "language_name": "Bengali"
class RelatedLanguage {
  int? language_id, video_id;
  String? web_url, language_name;

  RelatedLanguage.fromJson(json) {
    language_id = json['language_id'] ?? "";
    video_id = json['video_id'] ?? "";
    web_url = json['web_url'] ?? "";
    language_name = json['language_name'] ?? "";
  }
}

class LanguageResponse {
  bool? status;
  String? message;
  List<Language> languages = [];

  LanguageResponse.fromJson(json) {
    status = json['status'] ?? true;
    message = json['message'] ?? "";
    languages = json['result'] == null
        ? []
        : (json['result'] as List).map((e) => Language.fromJson(e)).toList();
  }

  LanguageResponse.withError(msg) {
    status = false;
    message = msg;
  }
}
