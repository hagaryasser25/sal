import 'package:app_test/cubit/home/home_state.dart';
import 'package:app_test/dio/dio_helper.dart';
import 'package:app_test/models/categories_model.dart';
import 'package:app_test/models/favorites_model.dart';
import 'package:app_test/screens/home/categories_screen.dart';
import 'package:app_test/screens/home/favorits_screen.dart';
import 'package:app_test/screens/home/products_screen.dart';
import 'package:app_test/shared/consts/constatnt.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/change_favorite_model.dart';
import '../../models/home_model.dart';
import '../../screens/home/settings_screen.dart';
import '../../shared/network/end_points.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  HomeModel? homeModel;
  Map<dynamic, dynamic> favorite = {};

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritsScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  void getHomeData() {
    emit(LoadingHomeDataState());

    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJSON(value.data);
      homeModel!.data!.products.forEach((element) {
        favorite.addAll({element.id: element.inFavorites});
      });
      print(favorite.toString());
      emit(HomeDataSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeDataErrorState(error));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(url: CATEGORIES, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel!.status);
      emit(HomeDataSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeDataErrorState(error));
    });
  }

  FavoritesModel? favoritesModel;

  void getFavoritesData() {
    emit(HomeGetFavoritesLoadingState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(value.data.toString());
      emit(HomeGetFavoritesSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetFavoritesErrorState(error));
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavorites(int productId) {
    favorite[productId] = !favorite[productId];
    DioHelper.postData(
        url: FAVORITES,
        token: token,
        data: {'product_id': productId}).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (changeFavoriteModel!.status == false) {
        favorite[productId] = !favorite[productId];
      } else {
        getFavoritesData();
      }
      emit(HomeChangeFavoritesSucessState(changeFavoriteModel!));
    }).catchError((error) {
      favorite[productId] = !favorite[productId];
      emit(HomeFavoritesErrorState(error));
    });
  }
}
