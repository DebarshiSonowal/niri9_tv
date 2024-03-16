//"url": "https://developer.android.com/",
//                 "version_code": "12.12.12",
//                 "build_no": "123456"
class OsInfo {
  String? url, version_code, build_no;

  OsInfo.fromJson(json) {
    url = json["url"] ?? "";
    version_code = json["version_code"] ?? "0";
    build_no = json["build_no"] ?? "0";
  }
}
