import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/data/remote_data/requests/movies_request.dart';
import 'package:movies_app/data/remote_data/requests/stars_request.dart';
import 'package:movies_app/data/remote_data/requests/tv_request.dart';
import 'package:movies_app/data/remote_data/responses/movies_response.dart';
import 'package:movies_app/data/remote_data/responses/stars_response.dart';
import 'package:movies_app/data/remote_data/responses/tv_response.dart';
import 'package:movies_app/presentation/screens/movies/movies.dart';
import 'package:movies_app/presentation/screens/stars/stars.dart';
import 'package:movies_app/presentation/screens/tv_shows/tv_shows.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  MoviesResponse moviesResponse = MoviesResponse();
  TVResponse tvResponse = TVResponse();
  StarsResponse starsResponse = StarsResponse();

  int currentIndex = 0;

  List<Widget> screens = [
    const MoviesScreen(),
    const TVShowsScreen(),
    const StarsScreen()
  ];
  List<String> titles = ['Movies', 'TV Shows', 'Stars'];

  void changeScreensIndex(int index) {
    currentIndex = index;
    emit(ChangeScreensIndexState());
  }

  String imageURL({required String imagePath}) {
    return "$imagesBaseURL$imagePath";
  }

  void getMovies() {
    emit(AppMoviesLoadingState());

    MoviesRequest()
        .moviesRequest(apiKey: '234d4710ba5a52c971c9fa050f3b0738')
        .then((value) {
      moviesResponse = value;
      emit(AppMoviesSuccessState());
    }).catchError((error) {
      emit(AppMoviesErorrState());
    });
  }

  void getTV() {
    emit(AppTVLoadingState());

    TVRequest()
        .tvRequest(apiKey: '234d4710ba5a52c971c9fa050f3b0738')
        .then((value) {
      tvResponse = value;
      emit(AppTVSuccessState());
    }).catchError((error) {
      emit(AppTVErorrState());
    });
  }

  void getStars() {
    emit(AppStarsLoadingState());

    StarsRequest()
        .starsRequest(apiKey: '234d4710ba5a52c971c9fa050f3b0738')
        .then((value) {
      starsResponse = value;
      emit(AppStarsSuccessState());
    }).catchError((error) {
      emit(AppStarsErorrState());
    });
  }
}
