import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/presentation/cubit/movie_cubit.dart';
import 'package:movie_api/presentation/cubit/movie_state.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Finder')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter movie name'),
            ),
            ElevatedButton(
              onPressed: () {
                final movie = _controller.text.trim();
                if (movie.isNotEmpty) {
                  context.read<MovieCubit>().fetchMovie(movie);
                }
              }, child: const Text('Find')
            ),
            const SizedBox(height: 20,),
            BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const CircularProgressIndicator();
                } else if (state is MovieLoaded) {
                  return Column(
                    children: [
                      Text('Title: ${state.movie.title}'),
                      Text('Release: ${state.movie.release_date}'),
                      Text('Plot: ${state.movie.plot}')
                    ],
                  );
                } else if (state is MovieError) {
                  return Text(state.message, style: const TextStyle(color: Colors.red),);
                }

                return const SizedBox();
              }
            )
          ],
        ),
      ),
    );
  }
}
