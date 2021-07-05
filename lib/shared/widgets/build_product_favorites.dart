import 'package:flutter/material.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/model/product.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';

class BuildProductsFavorites extends StatelessWidget {
  final Product data;
  final bool isSearch;

  const BuildProductsFavorites({required this.data, required this.isSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    data.image!,
                  ),
                  width: 120,
                  height: 120,
                ),
                data.discount != 0 && !isSearch
                    ? Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${data.price} \$',
                        style: TextStyle(
                          fontSize: 12,
                          color: primarySwatchColor,
                        ),
                      ),
                      1 != 0 && !isSearch
                          ? Text(
                              'Old Price: ${data.oldPrice} \$',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          : Container(),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          AppCubit.get(context).changeFavorites(data.id!);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              AppCubit.get(context).favourite[data.id] ?? false
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
      ),
    );
  }
}
