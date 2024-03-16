// "title": "Movies,Sports,Originals",
// "value": true

class GenericItemBool {
  String? title;
  bool? value;

  GenericItemBool.fromJson(json) {
    title = json["title"] ?? "";
    value = json["value"] ?? false;
  }
}

class GenericItemString {
  String? title, value;

  GenericItemString.fromJson(json) {
    title = json['title'] ?? "";
    value = json['value'] ?? "";
  }
}

class GenericItemInt {
  String? title;
  int? value;

  GenericItemInt.fromJson(json) {
    title = json['title'] ?? "";
    value = json['value'] ?? 0;
  }
}
