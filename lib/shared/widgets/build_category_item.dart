import 'package:flutter/material.dart';
import 'package:shop_app_a_m/model/categories_model.dart';

class BuildCategoryItemInHome extends StatelessWidget {
  final String img;
  final String title;

  const BuildCategoryItemInHome({required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.26,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              img,
            ),
            height: 100,
            width: 100,
            fit: BoxFit.fitHeight,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.26,
            color: Colors.black54,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildCategoryItem extends StatelessWidget {
  final DataInSide dataInSide;

  const BuildCategoryItem({required this.dataInSide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              dataInSide.image!,
            ),
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            dataInSide.name!,
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
            ),
          )
        ],
      ),
    );
  }
}
