import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/details/sura_content_widget.dart';
import 'package:islamiapp/ui/homescreen/tab/quran/quran_resorces.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_styles.dart';

class SuraDetailesScreen1 extends StatefulWidget {
  static const String routeName = 'SuraDetailesScreen1';
  SuraDetailesScreen1({super.key});

  @override
  State<SuraDetailesScreen1> createState() => _SuraDetailesScreenState();
}

class _SuraDetailesScreenState extends State<SuraDetailesScreen1> {
  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (suraContent.isEmpty) {
      loadSuraFile1(index);
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
                child: suraContent.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : SuraContentWidget(suraContent: suraContent)),
            Image(
              image: AssetImage(AppAssets.detailUnderBg),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  void loadSuraFile1(index) async {
    String fileContent =
        await rootBundle.loadString('assets/Suras/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    for (var i = 0; i < suraLines.length; i++) {
      suraLines[i] += '${[i + 1]}';
    }
    suraContent = suraLines.join();
    Future.delayed(Duration(seconds: 2));
    setState(() {});
  }
}
