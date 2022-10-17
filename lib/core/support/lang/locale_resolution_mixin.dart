import 'dart:ui';

import 'package:flutter/foundation.dart';

mixin LocaleResolution {
  final supportedLocales = const [
    Locale('pt', 'BR'),
    Locale('en', 'BR'),
  ];

  Locale? localeResolutionCallback(locale, supportedLocales) {
    debugPrint(locale.toString());
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode &&
          supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.first;
  }
}
