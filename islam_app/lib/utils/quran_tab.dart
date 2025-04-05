import 'package:flutter/material.dart';
import 'package:islam_app/AppFontSize.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/app_colors.dart';
import 'package:islam_app/utils/most_recent_provider.dart';
import 'package:islam_app/utils/most_recent_widget.dart';
import 'package:islam_app/utils/quran%20resourse.dart';
import 'package:islam_app/utils/tabs/qurain/quranListWidget.dart';
import 'package:islam_app/utils/tabs/qurain/souraQurandetels.dart';

import 'package:provider/provider.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterIndicesList = List.generate(
    114,
    (index) => index,
  );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<MostRecentProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newText) {
              filterListByNewText(newText);
            },
            style: AppFontSize.bold16white.copyWith(fontSize: 20),
            cursorColor: AppColor.elevatedBg,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.elevatedBg, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.elevatedBg, width: 2),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AssetesImages.iconQuran),
                color: AppColor.elevatedBg,
              ),
              hintText: 'Sura Name',
              hintStyle: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MostRecentWidget(),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'Suras List',
            style: AppFontSize.bold16white,
          ),
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          provider.updateMostRecentIndicesList(
                              filterIndicesList[index]);
                          Navigator.of(context).pushNamed(
                            SouraQuranDetiles.souraConttent,
                            arguments: filterIndicesList[index],
                          );
                        },
                        child: SuraList(index: index));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      thickness: 2,
                      indent: width * 0.11,
                      endIndent: width * 0.11,
                    );
                  },
                  itemCount: filterIndicesList.length))
        ],
      ),
    );
  }

  void filterListByNewText(String newText) {
    List<int> filterList = [];
    for (int i = 0; i < QuranResurse.englishQuranList.length; i++) {
      if (QuranResurse.englishQuranList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterList.add(i);
      } else if (QuranResurse.arabicQuranList[i].contains(newText)) {
        filterList.add(i);
      }
      filterIndicesList = filterList;
      setState(() {});
    }
  }
}
