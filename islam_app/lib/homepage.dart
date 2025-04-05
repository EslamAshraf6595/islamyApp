import 'package:flutter/material.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/app_colors.dart';
import 'package:islam_app/utils/tabs/hadeth/hadeth.dart';
import 'package:islam_app/utils/tabs/qurain/qurain.dart';
import 'package:islam_app/utils/tabs/taspeh/taspeh.dart';
import 'package:islam_app/utils/tabs/time/time.dart';

import 'utils/tabs/radio/radio.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  static const routHome = 'home';
  static int selected = 0;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> backGroundImage = [
    AssetesImages.qurainBG,
    AssetesImages.hadethBG,
    AssetesImages.taspehBG,
    AssetesImages.radioBG,
    AssetesImages.timeBG,
  ];
  List<Widget> TabsList = [
    QurainTab(),
    HadethTab(),
    Taspehtab(),
    Radiotab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backGroundImage[Home.selected],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColor.elevatedBg,
            ),
            child: BottomNavigationBar(
              currentIndex: Home.selected,
              onTap: (index) {
                Home.selected = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: BulidItemBottomNavBar(
                        index: 0, imageName: AssetesImages.quran),
                    label: ''),
                BottomNavigationBarItem(
                    icon: BulidItemBottomNavBar(
                        index: 1, imageName: AssetesImages.hadeth),
                    label: ''),
                BottomNavigationBarItem(
                    icon: BulidItemBottomNavBar(
                        index: 2, imageName: AssetesImages.taspeh),
                    label: ''),
                BottomNavigationBarItem(
                    icon: BulidItemBottomNavBar(
                        index: 3, imageName: AssetesImages.radio),
                    label: ''),
                BottomNavigationBarItem(
                    icon: BulidItemBottomNavBar(
                        index: 4, imageName: AssetesImages.time),
                    label: ''),
              ],
            ),
          ),
          body: Column(
            children: [
              Image.asset(AssetesImages.logo),
              Expanded(child: TabsList[Home.selected]),
            ],
          ),
        ),
      ],
    );
  }

  Widget BulidItemBottomNavBar(
      {required int index, required String imageName}) {
    return Home.selected == index
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Color.fromARGB(227, 80, 60, 25)),
            child: ImageIcon(
              AssetImage(imageName),
            ),
          )
        : ImageIcon(
            AssetImage(imageName),
          );
  }
}
//'assets/images/quran.png'