import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_api/data/models/movie_model.dart';

class MovieDatasource {
  final Dio dio;

  MovieDatasource(this.dio);

  Future<MovieModel> getMovie(String title) async {
    final apiKey = dotenv.env['OMDB_MOVIE_API'];
    if (apiKey == null) {
      throw Exception('API key not found in .env');
    }

    final response = await dio.get(
      '/',
      queryParameters: {
        't': title,
        'apikey': apiKey
      },
    );

    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<void> saveSearch(String title) async {
    print("Movie search saved: $title");
  }
}