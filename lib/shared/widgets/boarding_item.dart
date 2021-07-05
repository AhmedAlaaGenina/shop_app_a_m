import 'package:flutter/material.dart';
import 'package:shop_app_a_m/model/boarding_model.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({required this.boardingModel});
  final BoardingModel boardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(boardingModel.img),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          boardingModel.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          boardingModel.body,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
