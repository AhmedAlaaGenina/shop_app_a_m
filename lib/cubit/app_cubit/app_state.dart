part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeThemeModeState extends AppState {}

class AppGetThemeModeState extends AppState {}

class AppChangeCurrentIndexState extends AppState {}

class AppSuccessGetHomeDataState extends AppState {}

class AppFailedGetHomeDataState extends AppState {
  final String error;

  AppFailedGetHomeDataState(this.error);
}

class AppLoadingGetHomeDataState extends AppState {}

class AppSuccessGetCategoriesDataState extends AppState {}

class AppFailedGetCategoriesDataState extends AppState {
  final String error;

  AppFailedGetCategoriesDataState(this.error);
}

class AppLoadingGetCategoriesDataState extends AppState {}

class AppSuccessChangeFavoritesIconState extends AppState {}

class AppSuccessChangeFavoritesState extends AppState {
  final ChangeFavoritesModel model;

  AppSuccessChangeFavoritesState(this.model);
}

class AppFailedChangeFavoritesState extends AppState {
  final String error;

  AppFailedChangeFavoritesState(this.error);
}

class AppLoadingGetFavoritesDataState extends AppState {}

class AppSuccessGetFavoritesDataState extends AppState {}

class AppFailedGetFavoritesDataState extends AppState {
  final String error;

  AppFailedGetFavoritesDataState(this.error);
}

class AppLoadingGetUserDataState extends AppState {}

class AppSuccessGetUserDataState extends AppState {
  final LoginModel user;

  AppSuccessGetUserDataState(this.user);
}

class AppFailedGetUserDataState extends AppState {
  final String error;

  AppFailedGetUserDataState(this.error);
}

class AppLoadingUPDataUserDataState extends AppState {}

class AppSuccessUPDataUserDataState extends AppState {
  final LoginModel user;

  AppSuccessUPDataUserDataState(this.user);
}

class AppFailedUPDataUserDataState extends AppState {
  final String error;

  AppFailedUPDataUserDataState(this.error);
}
