import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  String _fontSize = 'Medium';

  String get fontSize => _fontSize;

  SettingsProvider() {
    _loadFromPrefs();
  }

  //  To Set the font size
  void setFontSize(String newSize) async {
    _fontSize = newSize;
    notifyListeners(); // Tells the listeners in the app to rebuild when font is changed

    // Save to storage for future use
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('fontSize', _fontSize);
  }

  // Load saved setting from storage on startup
  void _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _fontSize = prefs.getString('fontSize') ?? 'Medium';
    notifyListeners();
  }
}
