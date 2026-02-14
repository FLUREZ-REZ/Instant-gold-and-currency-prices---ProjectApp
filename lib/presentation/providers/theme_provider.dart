import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeProvider extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  static const _key = 'is_dark_mode';

  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeMode get themeMode =>
      _isDark ? ThemeMode.dark : ThemeMode.light;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final value = await _storage.read(key: _key);
    _isDark = value == 'true';
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    await _storage.write(key: _key, value: _isDark.toString());
    notifyListeners();
  }
}
