import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_a_m/data/local/cash_helper.dart';
import 'package:shop_app_a_m/data/remote/dio_helper.dart';
import 'package:shop_app_a_m/model/categories_model.dart';
import 'package:shop_app_a_m/model/change_favorites_model.dart';
import 'package:shop_app_a_m/model/favourites_model.dart';
import 'package:shop_app_a_m/model/home_model.dart';
import 'package:shop_app_a_m/model/login_model.dart';
import 'package:shop_app_a_m/routes/cateogries/categories_screen.dart';
import 'package:shop_app_a_m/routes/favorites/favorites_screen.dart';
import 'package:shop_app_a_m/routes/products/products_screen.dart';
import 'package:shop_app_a_m/routes/settings/Settings_screen.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';
import 'package:shop_app_a_m/shared/enums/help_data_enum.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  int currentIndex = 0;
  List<Widget> screen = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void getAppThemeMode() {
    isDark = CashHelper.getData(
          key: HelpDataEnum.isDarkMode.toString(),
        ) ??
        false;
    emit(AppGetThemeModeState());
  }

  void changeAppThemeMode() {
    isDark = !isDark;
    CashHelper.setData(
      key: HelpDataEnum.isDarkMode.toString(),
      value: isDark,
    );
    emit(AppChangeThemeModeState());
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(AppChangeCurrentIndexState());
  }

  HomeModel? homeModel;
  Map<int, bool> favourite = {};

  void getHomeData() {
    emit(AppLoadingGetHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favourite.addAll({
          element.id: element.inFavorites,
        });
      });
      emit(AppSuccessGetHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppFailedGetHomeDataState(error));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(AppLoadingGetCategoriesDataState());
    DioHelper.getData(
      url: CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(AppSuccessGetCategoriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppFailedGetCategoriesDataState(error));
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favourite[productId] = !favourite[productId]!;
    emit(AppSuccessChangeFavoritesIconState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        "product_id": productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel!.status!) {
        favourite[productId] = !favourite[productId]!;
      } else {
        getFavoritesData();
      }
      emit(AppSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      print(error);
      emit(AppFailedChangeFavoritesState(error));
    });
  }

  FavouritesModel? favouritesModel;

  void getFavoritesData() {
    emit(AppLoadingGetFavoritesDataState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);

      emit(AppSuccessGetFavoritesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppFailedGetFavoritesDataState(error));
    });
  }

  LoginModel? userModel;

  void getUserData() {
    print('getUserData');
    emit(AppLoadingGetUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print('getUserData: $userModel');

      emit(AppSuccessGetUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AppFailedGetUserDataState(error.toString()));
    });
  }

  void upDataUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    print('getUserData');
    emit(AppLoadingUPDataUserDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print('getUserData: $userModel');

      emit(AppSuccessUPDataUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AppFailedUPDataUserDataState(error.toString()));
    });
  }
}
