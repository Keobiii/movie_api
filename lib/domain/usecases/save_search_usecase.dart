import 'package:movie_api/domain/repositories/imovie_repositories.dart';

class SaveSearchUsecase {
  final ImovieRepositories repository;

  SaveSearchUsecase(this.repository);

  Future<void> call(String title) {
    return repository.saveSearch(title);
  }
}