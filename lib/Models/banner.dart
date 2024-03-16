
// import 'package:niri9/Models/rent.dart';

import 'package:niri9_tv/Models/rent.dart';

import 'genres.dart';

class BannerResponse {
  bool? _success;
  List<BannerResult>? _result;
  String? _message;
  int? _code;

  BannerResponse(
      {bool? success, List<BannerResult>? result, String? message, int? code}) {
    if (success != null) {
      this._success = success;
    }
    if (result != null) {
      this._result = result;
    }
    if (message != null) {
      this._message = message;
    }
    if (code != null) {
      this._code = code;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  List<BannerResult>? get result => _result;
  set result(List<BannerResult>? result) => _result = result;
  String? get message => _message;
  set message(String? message) => _message = message;
  int? get code => _code;
  set code(int? code) => _code = code;

  BannerResponse.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['result'] != null) {
      _result = <BannerResult>[];
      json['result'].forEach((v) {
        _result!.add(new BannerResult.fromJson(v));
      });
    }
    _message = json['message'];
    _code = json['code'];
  }

  BannerResponse.withError(msg){
    _success = false;
    _message = msg;
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['success'] = this._success;
  //   if (this._result != null) {
  //     data['result'] = this._result!.map((v) => v.toJson()).toList();
  //   }
  //   data['message'] = this._message;
  //   data['code'] = this._code;
  //   return data;
  // }
}

class BannerResult {
  int? _id;
  String? _title;
  String? _slug;
  int? _isUpcoming;
  int? _isFree;
  String? _releasedDate;
  String? _description;
  String? _directors;
  String? _actors;
  String? _imdbRating;
  Null? _trailerUrl;
  Null? _metaTitle;
  Null? _metaDescription;
  Null? _metaKeywords;
  int? _producerId;
  String? _producerName;
  int? _languageId;
  String? _languageName;
  int? _typeId;
  String? _typeName;
  String? _typeSlug;
  int? _categoryId;
  String? _categoryName;
  String? _categorySlug;
  List<Genres>? _genres;
  String? _webUrl;
  bool? _viewPermission;
  String? _readableTime;
  bool? _hasRent;
  List<Rent>? _rent;
  bool? _hasMyList;
  String? _trailerPlayer;
  String? _uniqueNo;
  String? _profilePic;
  String? _posterPic;

  Result(
      {int? id,
        String? title,
        String? slug,
        int? isUpcoming,
        int? isFree,
        String? releasedDate,
        String? description,
        String? directors,
        String? actors,
        String? imdbRating,
        Null? trailerUrl,
        Null? metaTitle,
        Null? metaDescription,
        Null? metaKeywords,
        int? producerId,
        String? producerName,
        int? languageId,
        String? languageName,
        int? typeId,
        String? typeName,
        String? typeSlug,
        int? categoryId,
        String? categoryName,
        String? categorySlug,
        List<Genres>? genres,
        String? webUrl,
        bool? viewPermission,
        String? readableTime,
        bool? hasRent,
        List<Rent>? rent,
        bool? hasMyList,
        String? trailerPlayer,
        String? uniqueNo,
        String? profilePic,
        String? posterPic}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (isUpcoming != null) {
      this._isUpcoming = isUpcoming;
    }
    if (isFree != null) {
      this._isFree = isFree;
    }
    if (releasedDate != null) {
      this._releasedDate = releasedDate;
    }
    if (description != null) {
      this._description = description;
    }
    if (directors != null) {
      this._directors = directors;
    }
    if (actors != null) {
      this._actors = actors;
    }
    if (imdbRating != null) {
      this._imdbRating = imdbRating;
    }
    if (trailerUrl != null) {
      this._trailerUrl = trailerUrl;
    }
    if (metaTitle != null) {
      this._metaTitle = metaTitle;
    }
    if (metaDescription != null) {
      this._metaDescription = metaDescription;
    }
    if (metaKeywords != null) {
      this._metaKeywords = metaKeywords;
    }
    if (producerId != null) {
      this._producerId = producerId;
    }
    if (producerName != null) {
      this._producerName = producerName;
    }
    if (languageId != null) {
      this._languageId = languageId;
    }
    if (languageName != null) {
      this._languageName = languageName;
    }
    if (typeId != null) {
      this._typeId = typeId;
    }
    if (typeName != null) {
      this._typeName = typeName;
    }
    if (typeSlug != null) {
      this._typeSlug = typeSlug;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (categoryName != null) {
      this._categoryName = categoryName;
    }
    if (categorySlug != null) {
      this._categorySlug = categorySlug;
    }
    if (genres != null) {
      this._genres = genres;
    }
    if (webUrl != null) {
      this._webUrl = webUrl;
    }
    if (viewPermission != null) {
      this._viewPermission = viewPermission;
    }
    if (readableTime != null) {
      this._readableTime = readableTime;
    }
    if (hasRent != null) {
      this._hasRent = hasRent;
    }
    if (rent != null) {
      this._rent = rent;
    }
    if (hasMyList != null) {
      this._hasMyList = hasMyList;
    }
    if (trailerPlayer != null) {
      this._trailerPlayer = trailerPlayer;
    }
    if (uniqueNo != null) {
      this._uniqueNo = uniqueNo;
    }
    if (profilePic != null) {
      this._profilePic = profilePic;
    }
    if (posterPic != null) {
      this._posterPic = posterPic;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  int? get isUpcoming => _isUpcoming;
  set isUpcoming(int? isUpcoming) => _isUpcoming = isUpcoming;
  int? get isFree => _isFree;
  set isFree(int? isFree) => _isFree = isFree;
  String? get releasedDate => _releasedDate;
  set releasedDate(String? releasedDate) => _releasedDate = releasedDate;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get directors => _directors;
  set directors(String? directors) => _directors = directors;
  String? get actors => _actors;
  set actors(String? actors) => _actors = actors;
  String? get imdbRating => _imdbRating;
  set imdbRating(String? imdbRating) => _imdbRating = imdbRating;
  Null? get trailerUrl => _trailerUrl;
  set trailerUrl(Null? trailerUrl) => _trailerUrl = trailerUrl;
  Null? get metaTitle => _metaTitle;
  set metaTitle(Null? metaTitle) => _metaTitle = metaTitle;
  Null? get metaDescription => _metaDescription;
  set metaDescription(Null? metaDescription) =>
      _metaDescription = metaDescription;
  Null? get metaKeywords => _metaKeywords;
  set metaKeywords(Null? metaKeywords) => _metaKeywords = metaKeywords;
  int? get producerId => _producerId;
  set producerId(int? producerId) => _producerId = producerId;
  String? get producerName => _producerName;
  set producerName(String? producerName) => _producerName = producerName;
  int? get languageId => _languageId;
  set languageId(int? languageId) => _languageId = languageId;
  String? get languageName => _languageName;
  set languageName(String? languageName) => _languageName = languageName;
  int? get typeId => _typeId;
  set typeId(int? typeId) => _typeId = typeId;
  String? get typeName => _typeName;
  set typeName(String? typeName) => _typeName = typeName;
  String? get typeSlug => _typeSlug;
  set typeSlug(String? typeSlug) => _typeSlug = typeSlug;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  String? get categoryName => _categoryName;
  set categoryName(String? categoryName) => _categoryName = categoryName;
  String? get categorySlug => _categorySlug;
  set categorySlug(String? categorySlug) => _categorySlug = categorySlug;
  List<Genres>? get genres => _genres;
  set genres(List<Genres>? genres) => _genres = genres;
  String? get webUrl => _webUrl;
  set webUrl(String? webUrl) => _webUrl = webUrl;
  bool? get viewPermission => _viewPermission;
  set viewPermission(bool? viewPermission) => _viewPermission = viewPermission;
  String? get readableTime => _readableTime;
  set readableTime(String? readableTime) => _readableTime = readableTime;
  bool? get hasRent => _hasRent;
  set hasRent(bool? hasRent) => _hasRent = hasRent;
  List<Rent>? get rent => _rent;
  set rent(List<Rent>? rent) => _rent = rent;
  bool? get hasMyList => _hasMyList;
  set hasMyList(bool? hasMyList) => _hasMyList = hasMyList;
  String? get trailerPlayer => _trailerPlayer;
  set trailerPlayer(String? trailerPlayer) => _trailerPlayer = trailerPlayer;
  String? get uniqueNo => _uniqueNo;
  set uniqueNo(String? uniqueNo) => _uniqueNo = uniqueNo;
  String? get profilePic => _profilePic;
  set profilePic(String? profilePic) => _profilePic = profilePic;
  String? get posterPic => _posterPic;
  set posterPic(String? posterPic) => _posterPic = posterPic;

  BannerResult.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _isUpcoming = json['is_upcoming'];
    _isFree = json['is_free'];
    _releasedDate = json['released_date'];
    _description = json['description'];
    _directors = json['directors'];
    _actors = json['actors'];
    _imdbRating = json['imdb_rating'];
    _trailerUrl = json['trailer_url'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _metaKeywords = json['meta_keywords'];
    _producerId = json['producer_id'];
    _producerName = json['producer_name'];
    _languageId = json['language_id'];
    _languageName = json['language_name'];
    _typeId = json['type_id'];
    _typeName = json['type_name'];
    _typeSlug = json['type_slug'];
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _categorySlug = json['category_slug'];
    if (json['genres'] != null) {
      _genres = <Genres>[];
      json['genres'].forEach((v) {
        _genres!.add(new Genres.fromJson(v));
      });
    }
    _webUrl = json['web_url'];
    _viewPermission = json['view_permission'];
    _readableTime = json['readable_time'];
    _hasRent = json['has_rent'];
    if (json['rent'] != null) {
      _rent = <Rent>[];
      json['rent'].forEach((v) {
        _rent!.add(new Rent.fromJson(v));
      });
    }
    _hasMyList = json['has_my_list'];
    _trailerPlayer = json['trailer_player'];
    _uniqueNo = json['unique_no'];
    _profilePic = json['profile_pic'];
    _posterPic = json['poster_pic'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this._id;
  //   data['title'] = this._title;
  //   data['slug'] = this._slug;
  //   data['is_upcoming'] = this._isUpcoming;
  //   data['is_free'] = this._isFree;
  //   data['released_date'] = this._releasedDate;
  //   data['description'] = this._description;
  //   data['directors'] = this._directors;
  //   data['actors'] = this._actors;
  //   data['imdb_rating'] = this._imdbRating;
  //   data['trailer_url'] = this._trailerUrl;
  //   data['meta_title'] = this._metaTitle;
  //   data['meta_description'] = this._metaDescription;
  //   data['meta_keywords'] = this._metaKeywords;
  //   data['producer_id'] = this._producerId;
  //   data['producer_name'] = this._producerName;
  //   data['language_id'] = this._languageId;
  //   data['language_name'] = this._languageName;
  //   data['type_id'] = this._typeId;
  //   data['type_name'] = this._typeName;
  //   data['type_slug'] = this._typeSlug;
  //   data['category_id'] = this._categoryId;
  //   data['category_name'] = this._categoryName;
  //   data['category_slug'] = this._categorySlug;
  //   if (this._genres != null) {
  //     data['genres'] = this._genres!.map((v) => v.toJson()).toList();
  //   }
  //   data['web_url'] = this._webUrl;
  //   data['view_permission'] = this._viewPermission;
  //   data['readable_time'] = this._readableTime;
  //   data['has_rent'] = this._hasRent;
  //   if (this._rent != null) {
  //     data['rent'] = this._rent!.map((v) => v.toJson()).toList();
  //   }
  //   data['has_my_list'] = this._hasMyList;
  //   data['trailer_player'] = this._trailerPlayer;
  //   data['unique_no'] = this._uniqueNo;
  //   data['profile_pic'] = this._profilePic;
  //   data['poster_pic'] = this._posterPic;
  //   return data;
  // }
}




