import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/model/home_model.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';
import 'package:shop_app_a_m/shared/enums/toast_enum.dart';
import 'package:shop_app_a_m/shared/functions/function.dart';

class BuildGridProduct extends StatelessWidget {
  const BuildGridProduct({
    required this.model,
  });

  final Products model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppSuccessChangeFavoritesState) {
          if (!state.model.status!) {
            showToast(text: state.model.message!, state: ToastStateEnum.ERROR);
          }
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                      model.image,
                    ),
                    width: double.infinity,
                    height: 200,
                  ),
                  model.discount != 0
                      ? Container(
                          color: Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'DISCOUNT',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${model.price.round()} \$',
                          style: TextStyle(
                            fontSize: 12,
                            color: primarySwatchColor,
                          ),
                        ),
                        model.discount != 0
                            ? Text(
                                'Old Price: ${model.oldPrice.round()} \$',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : Container(),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            AppCubit.get(context).changeFavorites(model.id);
                          },
                          icon: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                AppCubit.get(context).favourite[model.id]!
                                    ? primarySwatchColor
                                    : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
