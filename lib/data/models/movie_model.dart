import 'package:movie_api/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.title,
    required super.year,
    required super.release_date,
    required super.runtime,
    required super.genre,
    required super.plot,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['Title'],
      year: json['Year'],
      release_date: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      plot: json['Plot'],
    );
  }
}
