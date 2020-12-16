import 'dart:async';
import 'dart:io';
import 'api.dart';
import 'cli.dart';
import 'dart:convert';
import 'package:douban_topmovies/models/movie.dart';
import 'package:douban_topmovies/models/topic/topics_list_entity.dart';

class RealAPI extends API {
  @override
  Future<MovieEnvelope> getMovieList(int start) async {
    var client = HttpClient();
    var request = await client.getUrl(Uri.parse(
        'https://api.douban.com/v2/movie/top250?start=$start&count=40'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    print(responseBody);
    Map data = json.decode(responseBody);
    return MovieEnvelope.fromJSON(data);
  }

  @override
  Future<Movie> getMovie(String movieID) async {
    var client = HttpClient();
    var request = await client
        .getUrl(Uri.parse('https://api.douban.com/v2/movie/subject/$movieID'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = json.decode(responseBody);
    return Movie.fromJSON(data);
  }

  Future<TopicsListEntity> getTopicsList(int page) async {
    var response = await dio.get(ApiPath().topicList,
        queryParameters: {"page": page, "pn": 15, "type": "all"});
    return TopicsListEntity().fromJson(response.data);
  }
}
