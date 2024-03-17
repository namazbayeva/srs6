import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srs5/pages/bottom_bar_page.dart';
import 'package:srs5/pages/language_selection_page.dart';
import 'package:srs5/service/shared_preference.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init().then((_) {
    bool isAuthenticated = SharedPreferenceHelper.isAuthenticated();
    runApp(MyApp(isAuthenticated: isAuthenticated));
  });
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  MyApp({required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: isAuthenticated ? BottomBarPage(name: 'Nazerke', email: 'naz@uib.kz', phoneNumber: '87777777777') : LanguageSelectionPage(),
    );
  }
}
