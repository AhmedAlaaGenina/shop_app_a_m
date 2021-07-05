import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_a_m/data/remote/dio_helper.dart';
import 'package:shop_app_a_m/model/login_model.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  late String errorLogin;
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      // print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      token = loginModel!.data!.token!;
      print('Token cubit: $token');
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      errorLogin = error.toString();
      emit(LoginErrorState(error.toString()));
    });
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginChangeVisibilityState());
  }

  LoginModel? registerModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    ).then((value) {
      // print(value.data);
      registerModel = LoginModel.fromJson(value.data);
      token = registerModel!.data!.token!;
      print('Token cubit: $token');
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error) {
      print(error.toString());
      errorLogin = error.toString();
      emit(RegisterErrorState(error.toString()));
    });
  }
}
