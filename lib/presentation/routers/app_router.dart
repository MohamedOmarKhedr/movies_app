 import 'package:flutter/material.dart';
import 'package:movies_app/core/screens.dart' as screens;
import 'package:movies_app/data/remote_data/responses/movies_response.dart';
import 'package:movies_app/data/remote_data/responses/tv_response.dart';
import 'package:movies_app/presentation/screens/home/home_layout.dart';
import 'package:movies_app/presentation/screens/movies/movies_details.dart';
import 'package:movies_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:movies_app/presentation/screens/tv_shows/tv_shows_details.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.moviesDatailsScreen:
        MovieResults movieModel = settings.arguments as MovieResults;
        return MaterialPageRoute(
            builder: (_) => MoviesDatailsScreen(movieModel: movieModel));
      case screens.tvShowsDatailsScreen:
        TVResults tvModel = settings.arguments as TVResults;
        return MaterialPageRoute(
            builder: (_) => TVShowsDatailsScreen(tvModel: tvModel));

      default:
        return null;
    }
  }
}
