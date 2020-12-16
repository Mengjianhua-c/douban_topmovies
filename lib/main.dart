import 'package:douban_topmovies/services/cli.dart';
import 'package:flutter/material.dart';
import 'env.dart';
import 'routes/routes.dart';
// ignore: unused_import
import 'services/real_api.dart';
import 'services/mock_api.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/movies/movies_bloc.dart';
// ignore: unused_import
import 'package:douban_topmovies/pages/home.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  dio.interceptors.add(CustomInterceptors());
  Env.apiClient = MockAPI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: MoviesBloc(),
        child: MaterialApp(
          title: 'Douban Movie Top 250',
          onGenerateRoute: onGenerateRoute,
          initialRoute: '/',
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
        ));
  }
}
