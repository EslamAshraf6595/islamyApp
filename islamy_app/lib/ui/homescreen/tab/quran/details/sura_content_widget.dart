import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_styles.dart';

class SuraContentWidget extends StatelessWidget {
  String suraContent;
  SuraContentWidget({super.key, required this.suraContent});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Text(
      suraContent,
      style: AppStyles.bold20Primary,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
