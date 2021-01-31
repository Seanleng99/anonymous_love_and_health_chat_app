import 'package:flutter/material.dart';

class Themes with ChangeNotifier {
  ThemeData _themeData;

  Themes(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}