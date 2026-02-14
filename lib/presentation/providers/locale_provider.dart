import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  bool get isPersian => _locale.languageCode == 'fa';

  void toggleLocale() {
    _locale = isPersian ? const Locale('en') : const Locale('fa');
    notifyListeners();
  }
}
