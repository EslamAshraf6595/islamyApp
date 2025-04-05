import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../homepage.dart';
import '../../app_colors.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';


class Display extends StatefulWidget {
  Display({super.key});
  static const String intialIntro = 'intro';

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  PageController controlePage = PageController();
  int lastpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controlePage,
            onPageChanged: (index) {
              lastpage = index;
              setState(() {});
            },
            children: [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
              Page5(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.79),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      controlePage.previousPage(
                          duration: Duration(microseconds: 600),
                          curve: Curves.bounceIn);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: AppColor.elevatedBg,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  //-----------------------------------------------
                  SmoothPageIndicator(
                    controller: controlePage,
                    count: 5,
                  ),

                  //-----------------------------------------------
                  lastpage == 4
                      ? GestureDetector(
                          onTap: () {
                            controlePage.nextPage(
                                duration: Duration(microseconds: 600),
                                curve: Curves.bounceInOut);
                            setState(() {
                              Navigator.pushNamed(context, Home.routHome);
                            });
                          },
                          child: Text(
                            'done',
                            style: TextStyle(
                                color: AppColor.elevatedBg,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            controlePage.nextPage(
                                duration: Duration(microseconds: 600),
                                curve: Curves.bounceInOut);
                            setState(() {});
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: AppColor.elevatedBg,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                ],
              ))
        ],
      ),
    );
  }
}
