import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/ui/homescreen/tab/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.04),
      child: CarouselSlider(
        options: CarouselOptions(
            height: height * 0.9,
            enableInfiniteScroll: true,
            enlargeCenterPage: true),
        items: List.generate(50, (index) => index + 1).map((i) {
          return HadethItem(
            index: i,
          );
        }).toList(),
      ),
    );
  }
}
