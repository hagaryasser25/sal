
import '../../models/change_favorite_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class ChangeBottomNavBarState extends HomeState {}

class LoadingHomeDataState extends HomeState {}

class HomeDataSucessState extends HomeState {}

class HomeDataErrorState extends HomeState {
  final dynamic error;

  HomeDataErrorState(this.error);
}

class HomeCategoriesSucessState extends HomeState {}

class HomeCategoriesErrorState extends HomeState {
  final dynamic error;

  HomeCategoriesErrorState(this.error);
}

class HomeFavoritesSucessState extends HomeState {}

class HomeChangeFavoritesSucessState extends HomeState {
  final ChangeFavoriteModel model;
  HomeChangeFavoritesSucessState(this.model);
}



class HomeFavoritesErrorState extends HomeState {
  final dynamic error;

  HomeFavoritesErrorState(this.error);
}

class HomeGetFavoritesSucessState extends HomeState {
}

class HomeGetFavoritesLoadingState extends HomeState {
}

class HomeGetFavoritesErrorState extends HomeState {
  final dynamic error;

  HomeGetFavoritesErrorState(this.error);
}
