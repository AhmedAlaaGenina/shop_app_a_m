export 'navigation.dart';
import 'package:shop_app_a_m/data/local/cash_helper.dart';
import 'package:shop_app_a_m/routes/login/login_screen.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';
import 'package:shop_app_a_m/shared/enums/help_data_enum.dart';
import 'function.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_a_m/shared/enums/toast_enum.dart';

/// Show Toast With Color
void showToast({
  required String text,
  required ToastStateEnum state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

/// Pick Color for showToast()
Color chooseColor(
  ToastStateEnum state,
) {
  Color color;
  switch (state) {
    case ToastStateEnum.SUCCESS:
      color = Colors.green;
      break;

    case ToastStateEnum.ERROR:
      color = Colors.red;
      break;

    case ToastStateEnum.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

///Sign Out From the App
void signOut(context) {
  CashHelper.remove(key: HelpDataEnum.Token.toString()).then((value) {
    if (value) {
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}
