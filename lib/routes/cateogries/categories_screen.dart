import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/model/categories_model.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => BuildCategoryItem(
            dataInSide:
                AppCubit.get(context).categoriesModel!.data!.dataInSide![index],
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount:
              AppCubit.get(context).categoriesModel!.data!.dataInSide!.length,
        );
      },
    );
  }
}
