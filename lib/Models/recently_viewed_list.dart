class RecentViewedList {
  int? videoId;
  int? videoListId;
  int? totalDuration;
  int? viewedTime;
  String? percentViewed;
  String? videoPlayer;

  RecentViewedList(
      {this.videoId,
        this.videoListId,
        this.totalDuration,
        this.viewedTime,
        this.percentViewed,
        this.videoPlayer});

  RecentViewedList.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    videoListId = json['video_list_id'];
    totalDuration = json['total_duration'];
    viewedTime = json['viewed_time'];
    percentViewed = json['percent_viewed'];
    videoPlayer = json['video_player'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['video_list_id'] = this.videoListId;
    data['total_duration'] = this.totalDuration;
    data['viewed_time'] = this.viewedTime;
    data['percent_viewed'] = this.percentViewed;
    data['video_player'] = this.videoPlayer;
    return data;
  }
}