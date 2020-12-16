import 'package:rxdart/rxdart.dart';
import 'package:douban_topmovies/models/movie.dart';
import 'package:douban_topmovies/blocs/bloc_base.dart';
import 'package:douban_topmovies/env.dart';

class MovieDetailBloc implements BlocBase {
  final _movie = ReplaySubject<Movie>(maxSize: 1);
  final String movieID;
  final Movie breifMovie;

  Stream<Movie> get movie {
    return _movie.stream;
  }

  MovieDetailBloc({this.movieID, this.breifMovie}) {
    if (this.breifMovie != null) {
      _movie.add(breifMovie);
    }

    Env.apiClient.getMovie(movieID).then((movie) {
      if (!_movie.isClosed) {
        _movie.add(movie);
      }
    });
  }

  dispose() {
    _movie.close();
  }
}
