import 'package:flutter/cupertino.dart';
import 'package:niri9_tv/Models/video.dart';
// import 'package:niri9/Models/video.dart';

class FilmFestivalResponse {
  bool? success;
  List<FilmFestival>? result;
  String? message;
  int? code;

  FilmFestivalResponse({this.success, this.result, this.message, this.code});

  FilmFestivalResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <FilmFestival>[];
      json['result'].forEach((v) {
        debugPrint("ITEM : ${json['result']}");
        result!.add(FilmFestival.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  FilmFestivalResponse.withError(msg) {
    success = false;
    message = msg;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.result != null) {

      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}

class FilmFestival {
  int? id;
  String? name;
  String? slug;
  int? sequence;
  String? profileIcon;
  String? webUrl;
  bool? showBtn;
  List<Video>? videos;

  FilmFestival(
      {this.id,
        this.name,
        this.slug,
        this.sequence,
        this.profileIcon,
        this.webUrl,
        this.showBtn,
        this.videos});

  FilmFestival.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    sequence = json['sequence'];
    profileIcon = json['profile_icon'];
    webUrl = json['web_url'];
    showBtn = json['show_btn'];
    if (json['videos'] != null) {
      videos = <Video>[];
      json['videos'].forEach((v) {
        debugPrint("${json['videos']}");
        videos!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['sequence'] = this.sequence;
    data['profile_icon'] = this.profileIcon;
    data['web_url'] = this.webUrl;
    data['show_btn'] = this.showBtn;
    // if (this.videos != null) {
    //   data['videos'] = this.videos!.map((v) => Video.toJson(e)).toList();
    // }
    return data;
  }
}