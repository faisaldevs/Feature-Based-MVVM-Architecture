import 'package:feature_based_mvvm_architecture/app/localization/app_localization.dart';
import 'package:flutter/material.dart';

class LanguageHelper {
  static const Map<String, String> _languages = {
    'en': 'English',
    'bn': 'বাংলা', // Added Bangla (Bengali)
  };

  /// Converts a locale code to its corresponding language name.
  static String convertLocaleToLangName(String locale) =>
      _languages[locale] ?? 'English';

  /// Converts a language name to its corresponding locale.
  static Locale convertLangNameToLocale(String langName) {
    final localeCode =
        _languages.entries
            .firstWhere(
              (entry) => entry.value == langName,
              orElse: () => const MapEntry('en', 'English'),
            )
            .key;

    return Locale(localeCode);
  }

  /// Returns a list of available language names.
  static List<String> get languages => _languages.values.toList();

  /// Returns a list of supported locales.
  static List<Locale> get supportedLocales =>
      _languages.keys.map((code) => Locale(code)).toList();
}

// localization_extension.dart

extension LocalizationExtension on BuildContext {
  String translate(String key) {
    return AppLocalization.of(this)?.translate(key) ?? key;
  }
}

extension LocalizationStringExtension on String {
  String get tr => AppLocalization.instance.translate(this);
}
