import 'package:movie_api/domain/entities/movie_entity.dart';
import 'package:movie_api/domain/repositories/imovie_repositories.dart';

class GetMovieUsecase {
  final ImovieRepositories repository;

  GetMovieUsecase(this.repository);

  Future<MovieEntity> call(String title) {
    return repository.getMovie(title);
  }
}