import 'package:rxdart/rxdart.dart';
import 'package:douban_topmovies/models/movie.dart';
import 'package:douban_topmovies/env.dart';
import 'package:douban_topmovies/blocs/bloc_base.dart';

class MoviesBloc extends BlocBase {
  final BehaviorSubject<MovieEnvelope> _movieEnvelope = BehaviorSubject();
  var _currentStart = 0;
  var _displayedIndexes = List<int>();
  bool _isLoadingMore = false;

  Observable<MovieEnvelope> get movieEnvelope => _movieEnvelope.stream;

  MoviesBloc() {
    _getMovies();
  }

  _getMovies() {
    Env.apiClient.getTopicsList(1).then((value) {
      print(value.data.topics);
    });
    Env.apiClient.getMovieList(_currentStart).then((movieEnvelope) {
      var newMovieEnvelope = movieEnvelope;
      if (_movieEnvelope.value != null) {
        newMovieEnvelope.movies = _movieEnvelope.value.movies
          ..addAll(movieEnvelope.movies);
      }
      _movieEnvelope.add(newMovieEnvelope);
      _currentStart = movieEnvelope.movies.length;
      _isLoadingMore = false;
    });
  }

  displayingItemOfIndex(int index) {
    if (!_displayedIndexes.contains(index)) {
      _displayedIndexes.add(index);

      if (index == _currentStart - 1) {
        if (!_isLoadingMore) {
          _isLoadingMore = true;
          _getMovies();
        }
      }
    }
  }

  dispose() {
    _movieEnvelope.close();
  }
}
