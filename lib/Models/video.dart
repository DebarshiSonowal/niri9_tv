import 'package:flutter/material.dart';
import 'package:niri9_tv/Models/recently_viewed_list.dart';
import 'package:niri9_tv/Models/rent.dart';
import 'package:niri9_tv/Models/video_details.dart';
// import 'package:niri9/Models/genres.dart';
// import 'package:niri9/Models/recently_viewed_list.dart';
// import 'package:niri9/Models/rent.dart';
// import 'package:niri9/Models/video_details.dart';

import 'genres.dart';
import 'languages.dart';
import 'meta.dart';
import 'season.dart';

class Video {
  int? id,
      season_no,
      series_id,
      language_id,
      producer_id,
      type_id,
      category_id,
      status,
      video_type_id;
  String? unique_no,
      title,
      slug,
      season_txt,
      profile_pic,
      trailer_player,
      poster_pic,
      language_name,
      producer_name,
      type_name,
      type_slug,
      category_name,
      category_slug,
      description,
      released_date,
      genres_slug,
      readable_time,
      type_web_url,
      category_web_url,
      web_url,
      imdb_rating;
  bool? has_rent, has_my_list, view_permission;

  // Meta? meta, meta_org;
  List<Genres> genres = [];
  List<Rent> rent = [];
  List<RelatedLanguage> related_language = [];
  List<Season> season_list = [];
  List<VideoDetails> videos = [];
  RecentViewedList? recentViewedList;

  Video.fromJson(json) {
    id = json['id'] ?? 0;
    season_no = json['season_no'] ?? 0;
    series_id = json['series_id'] ?? 0;
    video_type_id = json['video_type_id'] ?? 1;
    imdb_rating = json['imdb_rating'] ?? "0";
    language_id = json['language_id'] ?? 0;
    producer_id = json['producer_id'] ?? 0;
    type_id = json['type_id'] ?? 0;
    category_id = json['category_id'] ?? 0;
    status = json['status'] ?? 0;
    //String
    unique_no = json['unique_no'] ?? "";
    title = json['title'] ?? "";
    slug = json['slug'] ?? "";
    season_txt = json['season_txt'] ?? "";
    profile_pic = json['profile_pic'] ?? "";
    trailer_player = json['trailer_player'] ?? "";
    poster_pic = json['poster_pic'] ?? "";
    language_name = json['language_name'] ?? "";
    producer_name = json['producer_name'] ?? "";
    type_name = json['type_name'] ?? "";
    type_slug = json['type_slug'] ?? "";
    category_name = json['category_name'] ?? "";
    category_slug = json['category_slug'] ?? "";
    description = json['description'] ?? "";
    released_date = json['released_date'] ?? "";
    genres_slug = json['genres_slug'] ?? "";
    readable_time = json['readable_time'] ?? "";
    type_web_url = json['type_web_url'] ?? "";
    category_web_url = json['category_web_url'] ?? "";
    web_url = json['web_url'];
    //bool
    has_rent = json['has_rent'] ?? false;
    has_my_list = json['has_my_list'] ?? false;
    view_permission = json['view_permission'] ?? false;
    //meta
    // meta = json['meta'] == null ? null : Meta.fromJson(json['meta']);
    // meta_org =
    //     json['meta_org'] == null ? null : Meta.fromJson(json['meta_org']);
    //list
    genres = json['genres'] == null
        ? []
        : (json['genres'] as List).map((e) => Genres.fromJson(e)).toList();
    // rent = (json['rent'] == null||json['rent']==[])
    //     ? []
    //     : (json['rent'] as List)
    //         .map((e) => (Rent.fromJson(json['rent'])))
    //         .toList();
    related_language = json['related_language'] == null
        ? []
        : (json['related_language'] as List)
            .map((e) => RelatedLanguage.fromJson(e))
            .toList();
    season_list = json['season_list'] == null
        ? []
        : (json['season_list'] as List).map((e) => Season.fromJson(e)).toList();
    videos = json['video_list'] == null
        ? []
        : (json['video_list'] as List)
            .map((e) => VideoDetails.fromJson(e))
            .toList();
    recentViewedList = json['recent_viewed_list'] == null
        ? null
        : RecentViewedList.fromJson(json['recent_viewed_list']);
  }
}

class VideoResponse {
  //"current_page": 1,
  //         "last_page": 5,
  //         "per_page": 4,
  //         "total": 18
  bool? success;
  String? message;
  List<Video> videos = [];
  int? current_page, last_page, per_page, total;

  VideoResponse.fromJson(json) {
    debugPrint("VideoResponse.fromJson");
    success = json['success'] ?? false;
    message = json['message'] ?? "";
    debugPrint("List: ${(json['result']['data'] as List).length}");
    try {
      videos = (json['result']['data'] as List)
          .map((e) => Video.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
    }
    debugPrint("List: ${videos.length}");
    current_page = json['result']['current_page'] ?? 0;
    last_page = json['result']['last_page'] ?? 0;
    per_page = json['result']['per_page'] ?? 0;
    debugPrint("List: ${(json['result']['data'] as List).length}");
  }

  VideoResponse.withError(msg) {
    success = false;
    message = msg;
  }
}

class VideoDetailsResponse {
  bool? success;
  String? message;
  Video? video;

  VideoDetailsResponse.fromJson(json) {
    success = json['success'] ?? false;
    message = json['message'] ?? "";
    video = json['result'] == null ? null : Video.fromJson(json['result']);
  }

  VideoDetailsResponse.withError(msg) {
    success = false;
    message = msg;
  }
}
