import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  String suraContent;
  int index;
  SuraContent({super.key, required this.suraContent, required this.index});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor, width: 2)),
      child: Center(
        child: Text(
          '$suraContent ${[index + 1]}',
          style: AppStyles.bold20Primary,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
