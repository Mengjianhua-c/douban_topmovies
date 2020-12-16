import 'package:douban_topmovies/models/movie.dart';
import 'package:douban_topmovies/models/topic/topics_list_entity.dart';

// 抽象出这个类是为了方便测试
abstract class API {
  Future<MovieEnvelope> getMovieList(int start);
  Future<Movie> getMovie(String movieID);
  Future<TopicsListEntity> getTopicsList(int page);
}
