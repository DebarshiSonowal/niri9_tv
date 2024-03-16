import 'dart:ffi';

import 'season.dart';
import 'video_details.dart';

// import 'package:niri9/Models/season.dart';
// import 'package:niri9/Models/video_details.dart';

class EpisodeListResponse {
  bool? success;
  List<VideoDetailsResult> result=[];
  String? message;

  EpisodeListResponse({this.success, required this.result, this.message});

  EpisodeListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'] == null?[]:(json['result'] as List).map((v)=>VideoDetailsResult.fromJson(v)).toList();
    message = json['message'];
  }

  EpisodeListResponse.withError(msg) {
    success = false;
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = Map<String, dynamic>();
//   data['success'] = this.success;
//   if (this.result != null) {
//     data['result'] = this.result!.map((v) => v.toJson()).toList();
//   }
//   data['message'] = this.message;
//   return data;
// }
}

class VideoDetailsResult {
  //       "genres_slug": "adventure,drama",
  //             "total_duration": "0:21:56",
  //             "readable_time": "0 hour 21 minutes ",
  //             "type_web_url": "http://test.niri9.com/multi",
  //             "category_web_url": "http://test.niri9.com/web-series",
  //             "web_url": "http://test.niri9.com/web-series/the-consequence-2/231206115232",
  //             "has_rent": false,
  //             "rent": [],
  //             "has_my_list": true,
  //             "view_permission": false,
  int? id, season_no, series_id, language_id, producer_id, type_id, category_id;
  String? unique_no,
      title,
      slug,
      season_txt,
      profile_pic,
      poster_pic,
      imdb_rating,
      trailer_player,
      language_name,
      producer_name,
      type_name,
      type_slug,
      category_name,
      category_slug,
      genres_slug,
      total_duration,
      readable_time,
      type_web_url,
      category_web_url,
      web_url;
  bool? has_rent, view_permission, has_my_list;
  List<Season> season_list = [];
  List<VideoDetails> video_list = [];

  VideoDetailsResult.fromJson(json) {
    id = json["id"] ?? 0;
    season_no = json["season_no"] ?? 0;
    series_id = json["series_id"] ?? 0;
    language_id = json["language_id"] ?? 0;
    producer_id = json["producer_id"] ?? 0;
    type_id = json["type_id"] ?? 0;
    category_id = json["category_id"] ?? 0;
    //
    unique_no = json['unique_no'] ?? "";
    title = json['title'] ?? "";
    slug = json['slug'] ?? "";
    season_txt = json['season_txt'] ?? "";
    profile_pic = json['profile_pic'] ?? "";
    poster_pic = json['poster_pic'] ?? "";
    imdb_rating = json['imdb_rating'] ?? "";
    trailer_player = json['trailer_player'] ?? "";
    language_name = json['language_name'] ?? "";
    producer_name = json['producer_name'] ?? "";
    type_name = json['type_name'] ?? "";
    type_slug = json['type_slug'] ?? "";
    category_name = json['category_name'] ?? "";
    category_slug = json['category_slug'] ?? "";
    genres_slug = json['genres_slug'] ?? "";
    total_duration = json['total_duration'] ?? "";
    readable_time = json['readable_time'] ?? "";
    type_web_url = json['type_web_url'] ?? "";
    category_web_url = json['category_web_url'] ?? "";
    web_url = json['web_url'] ?? "";

    has_rent = json['has_rent'] == null ? false : true;
    view_permission = json['view_permission'] == null ? false : true;
    has_my_list = json['has_my_list'] == null ? false : true;

    season_list =
    json['season_list'] == null ? [] : (json['season_list'] as List).map((e) =>
        Season.fromJson(e)).toList();
    video_list =
    json['video_list'] == null ? [] : (json['video_list'] as List).map((e) =>
        VideoDetails.fromJson(e)).toList();
  }
}
