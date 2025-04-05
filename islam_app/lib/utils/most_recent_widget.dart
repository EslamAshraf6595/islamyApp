import 'package:flutter/material.dart';
import 'package:islam_app/AppFontSize.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/app_colors.dart';
import 'package:islam_app/utils/most_recent_provider.dart';
import 'package:islam_app/utils/quran%20resourse.dart';
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
            style: AppFontSize.bold16white,
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
                      color: AppColor.elevatedBg,
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
                                QuranResurse.englishQuranList[
                                    provider.mostRecentList[index]],
                                style: AppFontSize.bold14Black,
                              ),
                              Text(
                                QuranResurse.arabicQuranList[
                                    provider.mostRecentList[index]],
                                style: AppFontSize.bold14Black,
                              ),
                              Text(
                                QuranResurse.ayaNuberList[
                                    provider.mostRecentList[index]],
                                style: AppFontSize.bold14Black,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(AssetesImages.suraImage),
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
