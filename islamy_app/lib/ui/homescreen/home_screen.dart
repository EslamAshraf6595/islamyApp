import 'package:flutter/material.dart';
import 'package:islamiapp/ui/homescreen/tab/hadeth/hadeth_tab.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/quran_tab.dart';
import 'package:islamiapp/ui/homescreen/tab/radio/radio_tab.dart';
import 'package:islamiapp/ui/homescreen/tab/sebha/sebha_tab.dart';
import 'package:islamiapp/ui/homescreen/tab/time/time_tab.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
    AppAssets.taspehBg
  ];
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          getbackgroundImages(),
          // backgroundImages[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
                // backgroundColor: AppColors.primaryColor,
                // type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.blackColor1,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: buildItemsInBottomNavBar(
                          index: 0, imageName: AppAssets.iconQuran),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: buildItemsInBottomNavBar(
                          index: 1, imageName: AppAssets.iconHadeth),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: buildItemsInBottomNavBar(
                          index: 2, imageName: AppAssets.iconTaspeh),
                      label: 'Taspeh'),
                  BottomNavigationBarItem(
                      icon: buildItemsInBottomNavBar(
                          index: 3, imageName: AppAssets.iconRadio),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: buildItemsInBottomNavBar(
                          index: 4, imageName: AppAssets.iconTime),
                      label: 'Time'),
                ]),
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: EdgeInsets.all(12),
              child: Image.asset(
                AppAssets.logo,
                height: 180,
              ),
            ),
            Expanded(child: tabsList[selectedIndex])
          ]),
        ),
      ],
    );
  }

  Widget buildItemsInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackColor),
            child: ImageIcon(AssetImage(imageName)))
        : ImageIcon(AssetImage(imageName));
  }

  String getbackgroundImages() {
    switch (selectedIndex) {
      case 0:
        return AppAssets.quranBg;
      case 1:
        return AppAssets.hadethBg;

      case 2:
        return AppAssets.radioBg;
      case 3:
        return AppAssets.taspehBg;
      case 4:
        return AppAssets.timeBg;
      default:
        return AppAssets.quranBg;
    }
  }
}
