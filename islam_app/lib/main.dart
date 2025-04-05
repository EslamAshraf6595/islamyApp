import 'package:flutter/material.dart';
import 'package:islam_app/homepage.dart';
import 'package:islam_app/utils/appthems.dart';
import 'package:islam_app/utils/most_recent_provider.dart';
import 'package:islam_app/utils/tabs/introdction/displayImages.dart';
import 'package:islam_app/utils/tabs/qurain/souraQurandetels.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Display.intialIntro,
      routes: {
        Home.routHome: (context) => const Home(),
        Display.intialIntro: (context) => Display(),
        SouraQuranDetiles.souraConttent: (context) => SouraQuranDetiles(),
      },
      darkTheme: AppThems.apptheme,
      themeMode: ThemeMode.dark,
      // theme: AppThems.apptheme,
    );
  }
}
