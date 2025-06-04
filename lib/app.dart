import 'package:flutter/material.dart';
import 'package:movie_api/presentation/pages/movie_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoviePage(),
    );
  }
}
