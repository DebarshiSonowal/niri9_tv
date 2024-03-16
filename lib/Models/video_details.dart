class VideoDetails {
  int? id;
  String? title;
  String? profilePicFile;
  String? note;
  String? profile_pic;
  int? duration;
  String? videoPlayer;

  VideoDetails(
      {this.id,
      this.title,
      this.profilePicFile,
      this.note,
      this.profile_pic,
      this.duration,
      this.videoPlayer});

  VideoDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    profilePicFile = json['profile_pic_file'];
    note = json['note'];
    profile_pic = json['profile_pic'];
    duration = json['duration'];
    videoPlayer = json['video_player'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['profile_pic_file'] = this.profilePicFile;
    data['note'] = this.note;
    data['duration'] = this.duration;
    data['video_player'] = this.videoPlayer;
    return data;
  }
}
