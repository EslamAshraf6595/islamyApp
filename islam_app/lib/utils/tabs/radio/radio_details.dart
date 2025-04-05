import 'package:flutter/material.dart';
import 'package:islam_app/AppFontSize.dart';
import 'package:islam_app/utils/app_assets.dart';
import 'package:islam_app/utils/app_colors.dart';

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
            color: AppColor.elevatedBg,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Image.asset(
            AssetesImages.botuniconSoura,
            color: Colors.black,
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
              style: AppFontSize.bold14Black,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 14,
          right: 10,
          child: Image.asset(
            AssetesImages.polygon,
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
            AssetesImages.volum,
            width: 130,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
