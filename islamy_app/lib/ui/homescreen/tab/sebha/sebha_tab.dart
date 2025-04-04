import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double lastAngle = 0;
  String displayedText = 'سبحان الله';

  void changeText() {
    setState(() {
      counter++;
      lastAngle += 180;

      if (counter == 31) {
        counter = 0;
        if (displayedText == 'سبحان الله') {
          displayedText = 'الله أكبر';
        } else if (displayedText == 'الله أكبر') {
          displayedText = 'الحمد لله';
        } else if (displayedText == 'الحمد لله') {
          displayedText = 'سبحان الله';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى',
          style: AppStyles.bold20White.copyWith(fontSize: 28),
        ),
        SizedBox(height: height * 0.01),
        Container(
          margin: EdgeInsets.only(left: 60),
          height: 90,
          width: 90,
          child: Image.asset(AppAssets.sephahead),
        ),
        GestureDetector(
          onTap: changeText,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              AnimatedRotation(
                turns: lastAngle / 360,
                duration: Duration(seconds: 1),
                curve: Curves.easeOut,
                child: Container(
                  height: 350,
                  width: 350,
                  child: Image.asset(
                    AppAssets.sebhaBody,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 130,
                child: Text(
                  displayedText,
                  style: AppStyles.bold20White.copyWith(fontSize: 32),
                ),
              ),
              Positioned(
                top: 200,
                child: Text(
                  '$counter',
                  style: AppStyles.bold20White.copyWith(fontSize: 31),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
