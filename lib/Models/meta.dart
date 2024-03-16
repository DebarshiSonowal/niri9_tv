// "title": "",
// "description": "",
// "keywords": ""
class Meta {
  String? title, description, keywords;

  Meta.fromJson(json) {
    title = json["title"]??"";
    description = json["description"]??"";
    keywords = json["keywords"]??"";
  }
}
