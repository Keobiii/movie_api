import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/domain/usecases/get_movie_usecase.dart';
import 'package:movie_api/domain/usecases/save_search_usecase.dart';
import 'package:movie_api/presentation/cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState>{
  final GetMovieUsecase getMovieUsecase;
  final SaveSearchUsecase saveSearchUsecase;

  MovieCubit(this.getMovieUsecase, this.saveSearchUsecase) : super(MovieInitial());

  Future<void> fetchMovie(String title) async {
    emit(MovieLoading());

    try {
      final movie = await getMovieUsecase(title);
      await saveSearchUsecase(title);

      emit(MovieLoaded(movie));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}