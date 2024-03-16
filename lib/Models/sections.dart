// import 'package:niri9/Models/video.dart';
import 'package:niri9_tv/Models/video.dart';

import 'movies.dart';

class Sections {
  //"id": 3,
  //             "title": "Niri9 original web series",
  //             "slug": "niri9-original-web-series",
  //             "web_template": "slider",
  //             "app_template": "slider",
  //             "page": "home",
  //             "info": "niri9 original web series",
  //             "sequence": 1,
  int? id, sequence;
  String? title, slug, web_template, app_template, page, info;
  List<Movies> movies = [];
  List<Video> videos = [];

  Sections.fromJson(json) {
    id = json['id'] ?? 0;
    sequence = json['sequence'] ?? 0;

    title = json['title'];
    slug = json['slug'];
    web_template = json['web_template'];
    app_template = json['app_template'];
    page = json['page'];
    info = json['info'];
    movies = json['movies'] == null
        ? []
        : (json['movies'] as List).map((e) => Movies.fromJson(e)).toList();
    videos = json['videos'] == null
        ? []
        : (json['videos'] as List).map((e) => Video.fromJson(e)).toList();
  }
}

class SectionsResponse {
  bool? status;
  String? message;
  List<Sections> sections = [];

  SectionsResponse.fromJson(json) {
    status = json['status'] ?? true;
    message = json['message'] ?? "Something went wrong";
    sections = json['result'] == null
        ? []
        : (json['result'] as List).map((e) => Sections.fromJson(e)).toList();
  }

  SectionsResponse.withError(msg) {
    status = false;
    message = msg;
  }
}
