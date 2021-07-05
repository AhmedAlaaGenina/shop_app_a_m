import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_a_m/model/categories_model.dart';
import 'package:shop_app_a_m/model/categories_model.dart';
import 'package:shop_app_a_m/model/home_model.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

class ProductsBuilder extends StatelessWidget {
  final HomeModel homeModel;
  final CategoriesModel categoriesModel;

  const ProductsBuilder({
    required this.homeModel,
    required this.categoriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: homeModel.data!.banners.length,
            itemBuilder: (
              context,
              itemIndex,
              pageViewIndex,
            ) {
              return Image(
                image: NetworkImage(homeModel.data!.banners[itemIndex].image),
                width: double.infinity,
                fit: BoxFit.fitHeight,
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.3,
              initialPage: 0,
              viewportFraction: .95,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => BuildCategoryItemInHome(
                      title: categoriesModel.data!.dataInSide![index].name!,
                      img: categoriesModel.data!.dataInSide![index].image!,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemCount: categoriesModel.data!.dataInSide!.length,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'News Products',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1.68,
              children: List.generate(
                homeModel.data!.products.length,
                (index) => BuildGridProduct(
                  model: homeModel.data!.products[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
