import 'package:movie_api/data/datasource/movie_datasource.dart';
import 'package:movie_api/domain/entities/movie_entity.dart';
import 'package:movie_api/domain/repositories/imovie_repositories.dart';

class MovieRepository implements ImovieRepositories {
  final MovieDatasource datasource;

  MovieRepository(this.datasource);

  @override
  Future<MovieEntity> getMovie(String title) {
    return datasource.getMovie(title);
  }

  @override
  Future<void> saveSearch(String title) {
    return datasource.saveSearch(title);
  }
}