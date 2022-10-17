import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  late Map<String, String> _localizedStrings;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _LocalizationsDelegate();

  Future<bool> loadLocalJson() async {
    String jsonLocale =
        await rootBundle.loadString('support/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonLocale);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? 'not translated';
  }
}

class _LocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['pt', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations loadedLocalization = AppLocalizations(locale);
    await loadedLocalization.loadLocalJson();
    return loadedLocalization;
  }

  @override
  bool shouldReload(_LocalizationsDelegate old) => false;
}

in18(BuildContext context, String key) =>
    AppLocalizations.of(context)!.translate(key).toString();
