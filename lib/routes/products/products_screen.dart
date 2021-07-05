import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/model/home_model.dart';
import 'package:shop_app_a_m/shared/constants/colorsConst.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return appCubit.homeModel != null && appCubit.categoriesModel != null
            ? ProductsBuilder(
                homeModel: appCubit.homeModel!,
                categoriesModel: appCubit.categoriesModel!,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
