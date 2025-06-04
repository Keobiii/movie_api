import 'package:dio/dio.dart';

class DioClient {
  static Dio configure() {
    return Dio(BaseOptions(
      baseUrl: 'https://www.omdbapi.com',
    ));
  }
}