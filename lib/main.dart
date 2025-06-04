import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_api/app.dart';
import 'package:movie_api/core/network/dio_client.dart';
import 'package:movie_api/data/datasource/movie_datasource.dart';
import 'package:movie_api/data/repositories/movie_repositories.dart';
import 'package:movie_api/domain/usecases/get_movie_usecase.dart';
import 'package:movie_api/domain/usecases/save_search_usecase.dart';
import 'package:movie_api/presentation/cubit/movie_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  final dio = DioClient.configure();
  final datasource = MovieDatasource(dio);
  final repository = MovieRepository(datasource);

  final getMovie = GetMovieUsecase(repository);
  final saveSearch = SaveSearchUsecase(repository);

  runApp(
    BlocProvider(
      create: (_) => MovieCubit(getMovie, saveSearch),
      child: const MyApp(),
    ),
  );
}