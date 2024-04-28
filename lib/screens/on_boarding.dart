import 'package:app_test/screens/auth/shop_login.dart';
import 'package:app_test/shared/network/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/on_boarding_model.dart';
import '../shared/styles/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: 'assets/images/shopping.png',
        title: 'page1 title',
        body: 'page1'),
    OnBoardingModel(
        image: 'assets/images/shopping.png',
        title: 'page2 title',
        body: 'page2'),
    OnBoardingModel(
        image: 'assets/images/shopping.png',
        title: 'page2 title',
        body: 'page2')
  ];
  bool isLast = false;

  void onSubmit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) => {
          if (value)
            {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              onSubmit();
            },
            child: Text('SKIP'))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                      print('isLast');
                    } else {
                      setState(() {
                        isLast = false;
                      });
                      print('notLast');
                    }
                  },
                  itemCount: boarding.length,
                  itemBuilder: (context, index) {
                    return BuildBoradingItem(boarding[index]);
                  }),
            ),
            SizedBox(
              height: 40,
            ),
            Row(children: [
              SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: defaultColor,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5.0,
                ),
              ),
              Spacer(),
              FloatingActionButton(
                backgroundColor: defaultColor,
                onPressed: () {
                  if (isLast) {
                    onSubmit();

                    print(isLast);
                  } else {
                    boardController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: Icon(Icons.arrow_forward_ios),
              )
            ])
          ],
        ),
      ),
    );
  }
}

Widget BuildBoradingItem(OnBoardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image.asset('${model.image}')),
      Text(
        '${model.title}',
        style: TextStyle(fontSize: 20),
      ),
      SizedBox(
        height: 20,
      ),
      Text('${model.body}'),
    ],
  );
}
