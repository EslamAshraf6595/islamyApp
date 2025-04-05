import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_app/AppFontSize.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/app_colors.dart';

import 'hadeth_model.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  void initState() {
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      decoration: BoxDecoration(
          color: AppColor.elevatedBg,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(
            AssetesImages.hadithCardBackGround,
          ))),
      child: hadeth == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetesImages.leftIconSoura,
                      width: width * 0.16,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Text(
                        hadeth?.title ?? '',
                        style: AppFontSize.bold14Black.copyWith(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      AssetesImages.righticonSoura,
                      width: width * 0.16,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Text(hadeth?.content ?? '',
                            textAlign: TextAlign.center,
                            style: AppFontSize.bold14Black
                                .copyWith(fontSize: 16)))),
                Image.asset(
                  AssetesImages.botuniconSoura,
                  color: Colors.black,
                )
              ],
            ),
    );
  }

  Future<void> loadHadethFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/Hadeeth/h$index.txt');
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
  }
}
