import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/routes/search/search_screen.dart';
import 'package:shop_app_a_m/shared/functions/function.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: appCubit.screen[appCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: appCubit.bottomNavItems,
            onTap: appCubit.changeCurrentIndex,
            currentIndex: appCubit.currentIndex,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
