import 'package:flutter/material.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';

class BuildButtonLogin extends StatelessWidget {
  const BuildButtonLogin({
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        height: 50.0,
        color: primarySwatchColor,
        onPressed: onTap,
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
    );
  }
}
