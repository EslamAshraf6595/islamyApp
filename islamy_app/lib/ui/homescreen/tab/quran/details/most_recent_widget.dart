import 'package:flutter/material.dart';
import 'package:islamiapp/providers/most_recent_provider.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/quran_resorces.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_styles.dart';
import 'package:islamiapp/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    provider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: provider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Recently',
            style: AppStyles.bold16White,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            width: double.infinity,
            height: height * 0.16,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: width * 0.02,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.78,
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                QuranResorces.englishQuranList[
                                    provider.mostRecentList[index]],
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                QuranResorces.arabicAuranList[
                                    provider.mostRecentList[index]],
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                QuranResorces.AyaNumberList[
                                    provider.mostRecentList[index]],
                                style: AppStyles.bold14Black,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(AppAssets.mostRecentlyImage),
                      ],
                    ),
                  );
                },
                itemCount: provider.mostRecentList.length),
          ),
        ],
      ),
    );
  }
}
