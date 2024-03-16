// "client_id": "rzp_live_sd",
// "secret": "FyJKcLABsssssf",
// "gmap_api_key": "dfgdgdgd",
// "analytics_code": "dfgdgdgd",

class Social {
  String? name,
      url,
      icon,
      app_id,
      client_secret,
      client_id,
      secret,
      gmap_api_key,
      analytics_code;
  int? is_show_page_link, enabled_login;

  Social.fromJson(json) {
    name = json['name'] ?? "";
    url = json['url'] ?? "";
    icon = json['icon'] ?? "";
    app_id = json['app_id'] ?? "";
    client_secret = json['client_secret'] ?? "";
    client_id = json['client_id'] ?? "";
    secret = json['secret'] ?? "";
    gmap_api_key = json['gmap_api_key'] ?? "";
    analytics_code = json['analytics_code'] ?? "";
    //int
    enabled_login = int.parse(json['enabled_login'] ?? "0");
    is_show_page_link = int.parse(json['is_show_page_link'] ?? "0");
  }
}

class SocialResponse {
  bool? success;
  String? message;
  Social? facebook, twitter, google, instagram, youtube;

  SocialResponse.fromJson(json) {
    success = json['success'] ?? false;
    message = json['message'] ?? "";
    facebook = json['result']['facebook'] == null
        ? null
        : Social.fromJson(json['result']['facebook']);
    twitter = json['result']['twitter'] == null
        ? null
        : Social.fromJson(json['result']['twitter']);
    google = json['result']['google'] == null
        ? null
        : Social.fromJson(json['result']['google']);
    instagram = json['result']['instagram'] == null
        ? null
        : Social.fromJson(json['result']['instagram']);
    youtube = json['result']['youtube'] == null
        ? null
        : Social.fromJson(json['result']['youtube']);
  }

  SocialResponse.withError(msg) {
    success = false;
    message = msg;
  }
}
