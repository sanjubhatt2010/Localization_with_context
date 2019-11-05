import 'package:flutter/material.dart';
import 'package:localization_project/resources/app_preference_key.dart';
import 'package:localization_project/resources/app_string.dart';
import 'package:localization_project/resources/app_translations.dart';
import 'package:localization_project/resources/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguagePage> {
  String _selectedLangCode = 'en';

  @override
  void initState() {
    super.initState();
    this._fetchLocale().then((locale) {
      setState(() {
        _selectedLangCode = locale;
      });
    });
  }

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    String code = prefs.getString(AppPreferenceKey.languageCode);
    return (code == null || code.isEmpty ? 'en' : code);
  }

  _changeLanguage(int pos) async {
    String languageCode = application.supportedLanguagesCodes[pos];
    AppTranslations.load(Locale(languageCode));
    setState(() {
      _selectedLangCode = languageCode;
    });
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(AppPreferenceKey.languageCode, languageCode);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text(AppStrings.appTitle)),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: application.supportedLanguages.length,
        itemBuilder: ((context, position) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: GestureDetector(
              child: Container(
                height: 60,
                color: (_selectedLangCode ==
                        application.supportedLanguagesCodes[position])
                    ? Colors.black
                    : Colors.grey,
                alignment: Alignment.center,
                child: Text(
                  AppTranslations.of(context)
                      .text(application.supportedLanguages[position]),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: () => _changeLanguage(position),
            ),
          );
        }),
      ),
    );
  }
}
