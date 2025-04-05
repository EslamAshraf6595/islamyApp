import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefkeys {
  static const mostRecentKey = 'most_recently_key';
}

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void refreshMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(Prefkeys.mostRecentKey) ?? [];
    mostRecentList =
        mostRecentIndicesAsString.map((element) => int.parse(element)).toList();
    notifyListeners();
  }

  void updateMostRecentIndicesList(int newSuraIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesList =
        prefs.getStringList(Prefkeys.mostRecentKey) ?? [];
    if (mostRecentIndicesList.contains('$newSuraIndex')) {
      mostRecentIndicesList.remove('$newSuraIndex');
      mostRecentIndicesList.insert(0, '$newSuraIndex');
    } else {
      mostRecentIndicesList.insert(0, '$newSuraIndex');
    }
    if (mostRecentIndicesList.length > 5) {
      mostRecentIndicesList.removeLast();
    }
    await prefs.setStringList(Prefkeys.mostRecentKey, mostRecentIndicesList);
  }
}
