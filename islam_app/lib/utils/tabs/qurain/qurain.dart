import 'package:flutter/material.dart';
import 'package:islam_app/AppFontSize.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/app_colors.dart';
import 'package:islam_app/utils/most_recent_widget.dart';
import 'package:islam_app/utils/quran%20resourse.dart';
import 'package:islam_app/utils/tabs/qurain/quranListWidget.dart';
import 'package:islam_app/utils/tabs/qurain/souraQurandetels.dart';
import 'package:provider/provider.dart';

import '../../most_recent_provider.dart';

late var provider;

class QurainTab extends StatefulWidget {
  QurainTab({super.key});

  @override
  State<QurainTab> createState() => _QurainTabState();
}

class _QurainTabState extends State<QurainTab> {
  List<int> filterIndicesList = List.generate(
    114,
    (index) => index,
  );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    provider = Provider.of<MostRecentProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newText) {
              getTheuserSerche(newText);
            },
            style: AppFontSize.bold16white,
            cursorColor: AppColor.elevatedBg,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: width * 0.08, horizontal: height * 0.012),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColor.elevatedBg, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColor.elevatedBg, width: 2),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AssetesImages.iconQuran),
                color: AppColor.elevatedBg,
              ),
              hintText: 'Sura Name',
              hintStyle: AppFontSize.bold20yello,
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
                        child: SuraList(
                          index: filterIndicesList[index],
                        ));
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

  void dispose() {
    super.dispose();
    provider.refreshMostRecentList();
  }

  void getTheuserSerche(String userSerche) {
    List<int> resuletOfSerche = [];
    for (int i = 0; i < QuranResurse.arabicQuranList.length; i++) {
      if (QuranResurse.arabicQuranList[i].contains(userSerche)) {
        resuletOfSerche.add(i);
      } else if (QuranResurse.englishQuranList[i]
              .toLowerCase()
              .contains(userSerche) ||
          QuranResurse.englishQuranList[i].toUpperCase().contains(userSerche)) {
        resuletOfSerche.add(i);
      }
      filterIndicesList = resuletOfSerche;
      setState(() {});
    }
  }
}
