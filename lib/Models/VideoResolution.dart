class VideoResolution {
  String exactResolution, url;
  int resolution;

  VideoResolution(this.exactResolution, this.url, this.resolution);
}

class VideoResolutionModel {
  bool success;
  List<VideoResolution> videoResolutions;

  VideoResolutionModel(this.success, this.videoResolutions);
}
