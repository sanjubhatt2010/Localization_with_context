import 'package:flutter/material.dart';
import 'package:localization_project/change_language.dart';
import 'package:localization_project/resources/app_string.dart';
import 'package:localization_project/resources/app_translations.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.of(context).text(AppStrings.appTitle),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppTranslations.of(context)
                  .text(AppStrings.youHaveTappedLanguageButton),
            ),
            SizedBox(height: 40),
            FlatButton(
              color: Colors.black,
              child: Text(
                AppTranslations.of(context).text(AppStrings.changeLanguage),
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ChangeLanguagePage();
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
