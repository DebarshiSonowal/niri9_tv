class Types {
  int? id, sequence, status;
  String? name, slug, note;

  Types.fromJson(json) {
    id = json["id"] ?? 0;
    sequence = json["sequence"] ?? 0;
    status = json["status"] ?? 0;
    name = json["name"];
    slug = json["slug"];
    note = json["note"];
  }
}

class TypesResponse {
  bool? success;
  String? message;
  List<Types> types = [];

  TypesResponse.fromJson(json) {
    success = json["success"] ?? true;
    message = json["message"];
    types = json["result"] == null
        ? []
        : (json["result"] as List).map((e) => Types.fromJson(e)).toList();
  }

  TypesResponse.withError(msg){
    success = false;
    message = msg;
  }

}
