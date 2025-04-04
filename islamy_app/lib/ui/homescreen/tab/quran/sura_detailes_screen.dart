import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/providers/most_recent_provider.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/details/sura_content.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/quran_resorces.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailesScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailesScreen';
  SuraDetailesScreen({super.key});

  @override
  State<SuraDetailesScreen> createState() => _SuraDetailesScreenState();
}

class _SuraDetailesScreenState extends State<SuraDetailesScreen> {
  List<String> verses = [];
  late MostRecentProvider provider;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentProvider>(context);
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackDetailsByColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.blackDetailsByColor,
          ),
        ),
        title: Text(
          QuranResorces.englishQuranList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.detailLeftBg),
                Text(
                  QuranResorces.arabicAuranList[index],
                  style: AppStyles.bold20Primary,
                ),
                Image.asset(AppAssets.detailRightBg),
              ],
            ),
            SizedBox(height: height * 0.03),
            Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: height * 0.02,
                          );
                        },
                        itemBuilder: (context, index) {
                          return SuraContent(
                            suraContent: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      )),
            Image(
              image: AssetImage(AppAssets.detailUnderBg),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    provider.refreshMostRecentList();
  }

  void loadSuraFile(index) async {
    String fileContent =
        await rootBundle.loadString('assets/Suras/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    verses = suraLines;
    Future.delayed(Duration(seconds: 2));
    setState(() {});
  }
}
