import 'package:flutter/material.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/app_colors.dart';
import 'package:islam_app/utils/most_recent_provider.dart';
import 'package:islam_app/utils/quran%20resourse.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islam_app/utils/tabs/qurain/deteles/souracontant.dart';
import 'package:provider/provider.dart';

var provider;

class SouraQuranDetiles extends StatefulWidget {
  SouraQuranDetiles({super.key});
  static const String souraConttent = 'content';

  @override
  State<SouraQuranDetiles> createState() => _SouraQuranDetilesState();
}

class _SouraQuranDetilesState extends State<SouraQuranDetiles> {
  // List<String> verses = [];
  String souracontent = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    provider = Provider.of<MostRecentProvider>(context);
    // if (verses.isEmpty) {
    //   lodeSoure(index);
    // }

    if (souracontent.isEmpty) {
      lodeSoure(index);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blakeIconElevatedBg,
        title: Text(
          QuranResurse.englishQuranList[index],
          style: TextStyle(color: AppColor.elevatedBg),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.elevatedBg),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: hight * 0.01),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(AssetesImages.leftIconSoura),
                Text(
                  QuranResurse.arabicQuranList[index],
                  style: TextStyle(color: AppColor.elevatedBg, fontSize: 20),
                ),
                Image.asset(AssetesImages.righticonSoura),
              ],
            ),
            Expanded(
                // child: verses.isEmpty
                //     ? Center(child: CircularProgressIndicator())
                //     : ListView.separated(
                //         separatorBuilder: (context, index) {
                //           return SizedBox(
                //             height: hight * 0.01,
                //           );
                //         },
                //         itemBuilder: (context, index) {
                //           return SouraContent(
                //             souracontent: verses[index],
                //             index: index,
                //           );
                //         },
                //         itemCount: verses.length,
                //       ),

                child: souracontent.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: SouraContent(souracontent: souracontent))),
            SizedBox(height: hight * 0.01),
            Image.asset(AssetesImages.botuniconSoura),
          ],
        ),
      ),
    );
  }

  // void lodeSoure(int index) async {
  //   String soura = await rootBundle.loadString('assets/files/${index + 1}.txt');
  //   List<String> sourLines = soura.split('\n');
  //   for (int i = 0; i < sourLines.length; i++) {
  //     sourLines[i] += '${i + 1}';
  //   }
  //   verses = sourLines;

  //   Future.delayed(
  //       Duration(seconds: 1),
  //       () => {
  //             setState(() {}),
  //           });
  // },
  void dispose() {
    super.dispose();
    provider.refreshMostRecentList();
  }

  void lodeSoure(int index) async {
    String soura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> sourLines = soura
        .split('\n')
        .map((line) => line.trim()) // remove whitespace
        .where((line) => line.isNotEmpty) // filter out empty lines
        .toList();
    for (int i = 0; i < sourLines.length; i++) {
      sourLines[i] += '(${i + 1}) ';
    }
    souracontent = sourLines.join();

    Future.delayed(
        Duration(seconds: 1),
        () => {
              setState(() {}),
            });
  }
}
