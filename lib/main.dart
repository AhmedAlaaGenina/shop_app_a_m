import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/routes/home_page.dart';
import 'package:shop_app_a_m/routes/login/login_screen.dart';
import 'package:shop_app_a_m/routes/on_boarding/on_boarding_screen.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';
import 'package:shop_app_a_m/shared/enums/help_data_enum.dart';
import 'package:shop_app_a_m/shared/theme/theme.dart';

import 'cubit/app_cubit/app_cubit.dart';
import 'cubit/bloc_observer.dart';
import 'data/local/cash_helper.dart';
import 'data/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  Widget widget;
  bool onBoarding =
      CashHelper.getData(key: HelpDataEnum.onBoarding.toString()) ?? false;
  token = CashHelper.getData(key: HelpDataEnum.Token.toString()) ?? token;
  print('Token: $token');
  if (onBoarding) {
    if (token.isNotEmpty) {
      widget = HomePage();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget startWidget;

  const MyApp({
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getAppThemeMode()
            ..getHomeData()
            ..getCategoriesData()
            ..getFavoritesData()
            ..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return MaterialApp(
            title: 'Shop App',
            theme: lightThemeData(),
            darkTheme: darkThemeData(),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
