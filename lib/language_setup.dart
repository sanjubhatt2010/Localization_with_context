import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localization_project/home_page.dart';
import 'dart:ui' as ui;
import 'package:localization_project/resources/app_preference_key.dart';
import 'package:localization_project/resources/app_translations.dart';
import 'package:localization_project/resources/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSetup extends StatefulWidget {
  @override
  LanguageSetupState createState() => LanguageSetupState();
}

class LanguageSetupState extends State<LanguageSetup> {
  @override
  initState() {
    super.initState();
    _getAppLanguage();
  }

  _getAppLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(AppPreferenceKey.languageCode);

    if (languageCode == null || languageCode.isEmpty) {
      languageCode = ui.window.locale.languageCode;
      if (!application.supportedLanguagesCodes.contains(languageCode)) {
        languageCode = "en";
      }
      prefs.setString(AppPreferenceKey.languageCode, languageCode);
      AppTranslations.load(Locale(languageCode));
      _goToHome();
    } else {
      AppTranslations.load(Locale(languageCode));
      _goToHome();
    }
  }

  _goToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MyHomePage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Default language setup"),
      ),
    );
  }
}
