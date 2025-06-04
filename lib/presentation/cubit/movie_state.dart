import 'package:movie_api/domain/entities/movie_entity.dart';

sealed class MovieState {}

class MovieInitial extends MovieState{}

class MovieLoading extends MovieState{}

class MovieLoaded extends MovieState{
  final MovieEntity movie;

  MovieLoaded(this.movie);
}

class MovieError extends MovieState{
  final String message;

  MovieError(this.message);
}