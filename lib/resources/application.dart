import 'dart:ui';

Application application = Application();
typedef void LocaleChangeCallback(Locale locale);

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  final List<String> supportedLanguages = [
    "german",
    "french",
    "italian",
    "english",
  ];

  final List<String> supportedLanguagesCodes = [
    "de",
    "fr",
    "it",
    "en",
  ];

  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));
  LocaleChangeCallback onLocaleChanged;
}
