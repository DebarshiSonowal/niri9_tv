// {
// "id": 2,
// "name": "Web series",
// "slug": "web-series",
// "sequence": 1,
// "profile_icon": "http://test.niri9.com/doc/default/file-upload.png",
// "web_url": "http://test.niri9.com/web-series"
// },
class Category{
  int? id,sequence;
  String? name,slug,profile_icon,web_url;
  bool? has_festival;
  Category.fromJson(json){
    id = json['id']??0;
    sequence = json['sequence']??0;
    name = json['name']??"";
    slug = json['slug']??"";
    profile_icon = json['profile_icon']??"";
    web_url = json['web_url']??"";
    has_festival = json['has_festival']??false;
  }

}

class CategoryResponse{
  bool? success;
  String? message;
  List<Category> categories=[];

  CategoryResponse.fromJson(json){
    success = json['success']??false;
    message = json['message']??"";
    categories = json['result']==null?[]:(json['result']as List).map((e) => Category.fromJson(e)).toList();
  }
  CategoryResponse.withError(msg){
    success = false;
    message = msg ?? "Something is wrong";
  }
}