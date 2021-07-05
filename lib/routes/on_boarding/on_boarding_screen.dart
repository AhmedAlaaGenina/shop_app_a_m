import 'package:flutter/material.dart';
import 'package:shop_app_a_m/data/local/cash_helper.dart';
import 'package:shop_app_a_m/model/boarding_model.dart';
import 'package:shop_app_a_m/routes/login/login_screen.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';
import 'package:shop_app_a_m/shared/enums/help_data_enum.dart';
import 'package:shop_app_a_m/shared/functions/function.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingModel = [
    BoardingModel(
        img: 'assets/images/on_boarding/premium-quality.png',
        title: 'screenTitle1',
        body: 'screenBody1'),
    BoardingModel(
        img: 'assets/images/on_boarding/shopping-bag.png',
        title: 'screenTitle2',
        body: 'screenBody2'),
    BoardingModel(
        img: 'assets/images/on_boarding/products-delivery.png',
        title: 'screenTitle3',
        body: 'screenBody3'),
  ];

  var boardController = PageController();
  bool isLast = false;
  void submitOnBoarding() {
    CashHelper.setData(key: HelpDataEnum.onBoarding.toString(), value: true)
        .then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submitOnBoarding,
            child: Text(
              'SKIP',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: primarySwatchColor,
                  ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                itemBuilder: (context, index) => BoardingItem(
                  boardingModel: boardingModel[index],
                ),
                itemCount: boardingModel.length,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == boardingModel.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print('Last Screeen ?!!!!!!!!!!');
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    print('Not Last Screeen ?!!!!!!!!!!');
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: boardController, // PageController
                  count: boardingModel.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: primarySwatchColor,
                  ), // your preferred effect
                  // forcing the indicator to use a specific direction
                  // textDirection: TextDirection.rtl,
                  onDotClicked: (index) {},
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submitOnBoarding();
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
