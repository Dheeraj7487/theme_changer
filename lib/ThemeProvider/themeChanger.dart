import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  var _themeMode = ThemeMode.light;
  var color = Colors.red;
  ThemeMode get themeMode => _themeMode;

  setTheme(themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }
}