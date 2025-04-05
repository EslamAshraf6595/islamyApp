import 'package:flutter/material.dart';
import 'package:islam_app/utils/app_colors.dart';

import 'radio_details.dart';


class Radiotab extends StatefulWidget {
  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<Radiotab> {
  int index = 0;

  List<String> radio = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
  ];

  List<String> Reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik Shaibat Alhamed',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                height: 35,
                width: 160,
                decoration: BoxDecoration(
                  color: index == 0
                      ? AppColor.elevatedBg
                      : Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Radio',
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Container(
                height: 35,
                width: 160,
                decoration: BoxDecoration(
                  color: index == 1
                      ? AppColor.elevatedBg
                      : Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Reciters',
                  style: TextStyle(
                    color: index == 1 ? Colors.black : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: index == 0 ? radio.length : Reciters.length,
            padding: EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, i) {
              if (index == 0) {
                return RadioDetails(title: radio[i]);
              } else {
                return RadioDetails(title: Reciters[i]);
              }
            },
          ),
        ),
      ],
    );
  }
}
