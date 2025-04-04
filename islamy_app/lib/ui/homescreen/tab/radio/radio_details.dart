import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_styles.dart';

class RadioDetails extends StatelessWidget {
  final String title;

  const RadioDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Image.asset(
            'assets/images/detailUnderScreen.png',
            width: 600,
            height: 83,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 18,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              title,
              style: AppStyles.bold20Black.copyWith(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 14,
          right: 10,
          child: Image.asset(
            'assets/images/Polygon.png',
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 110,
          right: 10,
          child: Image.asset(
            'assets/images/Volume.png',
            width: 130,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
