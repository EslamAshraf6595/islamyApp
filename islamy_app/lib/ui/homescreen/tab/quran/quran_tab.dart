import 'package:flutter/material.dart';
import 'package:islamiapp/providers/most_recent_provider.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/details/most_recent_widget.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/quran_resorces.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/sura_detailes_screen.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/sura_detailes_screen1.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/sura_list_widget.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_styles.dart';
import 'package:islamiapp/utils/shared_prefs_utils.dart';
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
            style: AppStyles.bold20White,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.iconSearch),
                color: AppColors.primaryColor,
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
            style: AppStyles.bold16White,
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
                          SuraDetailesScreen.routeName,
                          arguments: filterIndicesList[index],
                        );
                      },
                      child: SuraListWidget(
                        index: filterIndicesList[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.whiteColor,
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
    for (int i = 0; i < QuranResorces.englishQuranList.length; i++) {
      if (QuranResorces.englishQuranList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterList.add(i);
      } else if (QuranResorces.arabicAuranList[i].contains(newText)) {
        filterList.add(i);
      }
      filterIndicesList = filterList;
      setState(() {});
    }
  }
}
