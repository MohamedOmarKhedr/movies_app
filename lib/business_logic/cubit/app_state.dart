part of 'app_cubit.dart';

abstract class AppState {}

final class AppInitial extends AppState {}

final class ChangeScreensIndexState extends AppState {}

final class AppMoviesSuccessState extends AppState {}

final class AppMoviesLoadingState extends AppState {}

final class AppMoviesErorrState extends AppState {}

final class AppTVSuccessState extends AppState {}

final class AppTVLoadingState extends AppState {}

final class AppTVErorrState extends AppState {}

final class AppStarsSuccessState extends AppState {}

final class AppStarsLoadingState extends AppState {}

final class AppStarsErorrState extends AppState {}
