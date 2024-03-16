// "site_name": "Niri9",
// "site_url": "http://test.niri9.com/",
// "owner": "Niri9",
// import 'package:niri9/Models/os_info.dart';

import 'category_all.dart';
import 'os_info.dart';

class Settings {
  String? name, email, contact, logo;
  OsInfo? android, ios;

  Settings.fromJson(json) {
    name = json["name"] ?? "";
    email = json["email"] ?? "";
    contact = json["contact"] ?? "";
    logo = json["logo"] ?? "";
    android = json["android"] == null ? null : OsInfo.fromJson(json["android"]);
    ios = json["ios"] == null ? null : OsInfo.fromJson(json["ios"]);
  }
}

class SettingsResponse {
  bool? success;
  String? message, site_name, site_url, owner, firebase_otp_key;
  Settings? settings;
  List<VideoPercent>? videoPercent;
  VideoSetting? videoSetting;
  CategoryAll? categoryAll;

  SettingsResponse.fromJson(json) {
    success = json["success"] ?? false;
    message = json["message"] ?? "";
    site_name = json["result"]["site_name"] ?? "";
    site_url = json["result"]["site_url"] ?? "";
    owner = json["result"]["owner"] ?? "";
    firebase_otp_key = json["result"]["firebase_otp_key"] ?? "";
    settings = json["result"]['app_setting'] == null
        ? null
        : Settings.fromJson(json["result"]['app_setting']);
    videoPercent = json['result']['video_percent'] == null
        ? []
        : (json['result']['video_percent'] as List)
            .map((e) => VideoPercent.fromJson(e))
            .toList();
    videoSetting = json['result']['video_setting'] == null
        ? null
        : VideoSetting.fromJson(json['result']['video_setting']);
    categoryAll = json['result']['category_all'] == null
        ? null
        : CategoryAll.fromJson(json['result']['category_all']);
  }

  SettingsResponse.withError(msg) {
    success = false;
    message = msg;
  }
}

class VideoPercent {
  String? percent;
  String? amount;

  VideoPercent({this.percent, this.amount});

  VideoPercent.fromJson(Map<String, dynamic> json) {
    percent = json['percent'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percent'] = this.percent;
    data['amount'] = this.amount;
    return data;
  }
}

class VideoSetting {
  String? rentAllowMaxTime;
  String? subscriptionAllowMaxTime;
  String? sendToServerInterval;
  String? forwardTime;

  VideoSetting(
      {this.rentAllowMaxTime,
      this.subscriptionAllowMaxTime,
      this.sendToServerInterval,
      this.forwardTime});

  VideoSetting.fromJson(Map<String, dynamic> json) {
    rentAllowMaxTime = json['rent_allow_max_time'];
    subscriptionAllowMaxTime = json['subscription_allow_max_time'];
    sendToServerInterval = json['send_to_server_interval'];
    forwardTime = json['forward_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rent_allow_max_time'] = this.rentAllowMaxTime;
    data['subscription_allow_max_time'] = this.subscriptionAllowMaxTime;
    data['send_to_server_interval'] = this.sendToServerInterval;
    data['forward_time'] = this.forwardTime;
    return data;
  }
}
