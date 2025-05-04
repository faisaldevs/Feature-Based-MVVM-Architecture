import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/app/localization/languages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale) {
    // Cache this instance globally
    _instance = this;
  }

  static AppLocalization? _instance;

  // Access it from anywhere
  static AppLocalization get instance {
    if (_instance == null) {
      throw Exception(
        'AppLocalization instance not initialized. '
        'Call AppLocalization.of(context) at least once in the widget tree.',
      );
    }
    return _instance!;
  }

  static AppLocalization? of(BuildContext context) {
    final localization = Localizations.of<AppLocalization>(
      context,
      AppLocalization,
    );
    if (localization != null) _instance = localization;
    return localization;
  }

  static Map<String, Map<String, String>> get _localizedValues => translations;

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        '** $key not found **';
  }
}

// Localization delegate

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  static const List<String> supportedLocales = [kKeyEnglish, kKeyBangla];

  @override
  bool isSupported(Locale locale) =>
      supportedLocales.contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) =>
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
