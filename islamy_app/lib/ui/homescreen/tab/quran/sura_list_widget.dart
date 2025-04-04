import 'package:flutter/material.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/quran_resorces.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  int index;

  SuraListWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.vectorImage,
                  height: MediaQuery.of(context).size.height * 0.07),
              Text(
                '${index + 1}',
                style: AppStyles.bold16White,
              ),
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResorces.englishQuranList[index],
                style: AppStyles.bold20White,
              ),
              Text(
                QuranResorces.AyaNumberList[index],
                style: AppStyles.bold14White,
              ),
            ],
          ),
          Spacer(),
          Text(
            QuranResorces.arabicAuranList[index],
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
