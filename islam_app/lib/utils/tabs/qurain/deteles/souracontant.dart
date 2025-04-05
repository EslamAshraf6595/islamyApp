import 'package:flutter/material.dart';
import 'package:islam_app/AppFontSize.dart';


class SouraContent extends StatefulWidget {
  SouraContent({super.key, required this.souracontent});
  String souracontent;
  

  @override
  State<SouraContent> createState() => _SouraContentState();
}

class _SouraContentState extends State<SouraContent> {
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    return Text(
    widget.souracontent,
      style: AppFontSize.bold20yello,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
