import 'genre_list_item.dart';

class Movies {
  int? id, is_upcoming, is_free, producer_id, language_id, movie_type_id;
  String? title,
      slug,
      release_date,
      description,
      directors,
      actors,
      trailer_url,
      meta_title,
      meta_description,
      meta_keywords,
      producer_name,
      language_name,
      movie_type,
      profile_pic,
      poster_pic;
  List<GenreListItem> genres = [];

  Movies.fromJson(json) {
    id = json['id'] ?? 0;
    is_upcoming = json['is_upcoming'] ?? 0;
    is_free = json['is_free'] ?? 0;
    producer_id = json['producer_id'] ?? 0;
    language_id = json['language_id'] ?? 0;
    movie_type_id = json['movie_type_id'] ?? 0;

    title = json['title'] ?? "";
    slug = json['slug'];
    release_date = json['release_date'];
    description = json['descriptions'];
    directors = json['directors'];
    actors = json['actors'];
    trailer_url = json['trailer_url'];
    meta_title = json['meta_title'];
    meta_description = json['meta_description'];
    meta_keywords = json['meta_keywords'];
    producer_name = json['producer_name'];
    language_name = json['language_name'];
    movie_type = json['movie_type'];
    profile_pic = json['profile_pic'];
    poster_pic = json['poster_pic'];
    genres = json['genre_list'] == null
        ? []
        : (json['genre_list'] as List)
            .map((e) => GenreListItem.fromJson(e))
            .toList();
  }
}
