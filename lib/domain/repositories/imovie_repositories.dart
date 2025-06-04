import 'package:movie_api/domain/entities/movie_entity.dart';

abstract class ImovieRepositories {
  Future<MovieEntity> getMovie(String title);
  Future<void> saveSearch(String title);
}