import 'package:flutter/material.dart';
import 'package:mshop/const/dark_theme_prefs.dart';

class ThemeProvider with ChangeNotifier{

   DarkThemePrefs darkThemePrefs = DarkThemePrefs();

   bool _darkTheme = false;
   bool get getDarkTheme => _darkTheme;

   set SetDarkTheme (bool value){
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();

   }
  
}