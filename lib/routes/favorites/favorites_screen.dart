import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var favouritesModel = AppCubit.get(context).favouritesModel;
        return state is! AppLoadingGetFavoritesDataState
            ? ListView.separated(
                itemBuilder: (context, index) => BuildProductsFavorites(
                  isSearch: false,
                  data: favouritesModel!
                      .data!.dataInSideFavorites![index].product!,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: favouritesModel!.data!.dataInSideFavorites!.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
