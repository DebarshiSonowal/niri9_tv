class GenreListItem {
//  "id": 1,
//                             "name": "Category 1"
  int? id;
  String? name;

  GenreListItem.fromJson(json) {
    id = json["id"] ?? 0;
    name = json["name"] ?? "";
  }
}
