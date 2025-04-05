import 'package:flutter/material.dart';
import 'package:islam_app/AppFontSize.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/quran%20resourse.dart';


class SuraList extends StatelessWidget {
  SuraList({super.key, required this.index});
  late int index;
  

  @override
  Widget build(BuildContext context) {
    
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetesImages.suraNumber),
              Text(
                "${index + 1}",
                style: AppFontSize.bold16white,
              )
            ],
          ),
          SizedBox(
            width: width * 0.018,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(QuranResurse.englishQuranList[index],
                  style: AppFontSize.bold16white),
              Text(QuranResurse.ayaNuberList[index],
                  style: AppFontSize.bold16white.copyWith(fontSize: 12))
            ],
          ),
          Spacer(),
          Text(QuranResurse.arabicQuranList[index],
              style: AppFontSize.bold16white),
        ],
      ),
    );
  }

}
