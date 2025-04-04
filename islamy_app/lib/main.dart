import 'package:flutter/material.dart';


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
      initialRoute: OnboardingScreens.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        OnboardingScreens.routeName: (context) => OnboardingScreens(),
        SuraDetailesScreen.routeName: (context) => SuraDetailesScreen(),
        SuraDetailesScreen1.routeName: (context) => SuraDetailesScreen1(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
