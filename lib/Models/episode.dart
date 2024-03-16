class EpisodeResponse {
  bool? success;
  List<Episode> episodes = [];
  String? message;

  EpisodeResponse.fromJson(json) {
    success = json["success"] ?? false;
    episodes = json['result'] == null
        ? []
        : (json['result'] as List).map((e) => Episode.fromJson(e)).toList();
  }

  EpisodeResponse.withError(msg) {
    success = false;
    message = msg;
  }
}

class Episode {
  int? id,
      sequence,
      duration,
      status,
      last_viewed_duration,
      last_viewed_percent;
  String? title,
      slug,
      profile_pic,
      episode_code,
      note,
      video_player,
      readable_time;

  Episode.fromJson(json) {
    id = json['id'] ?? 0;
    sequence = json['sequence'] ?? 1;
    duration = json['duration'] ?? 0;
    status = json['status'] ?? 0;
    last_viewed_duration = json['last_viewed_duration'] ?? 0;
    last_viewed_percent = json['last_viewed_percent'] ?? 0;
    //
    title = json['title'] ?? "";
  }
}
