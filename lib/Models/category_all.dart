class CategoryAll{
  String? title,img,slug;
  CategoryAll.fromJson(json){
    title = json["title"]??"";
    img = json["img"]??"";
    slug = json["slug"]??"";
  }
}

//  "category_all": {
//             "title": "10",
//             "img": "https://test.niri9.com/public/assets/default/file-upload.png"
//         },