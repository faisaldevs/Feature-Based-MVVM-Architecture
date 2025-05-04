import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/app/localization/language_helper.dart';
import 'package:flutter/material.dart';

class CurrentData with ChangeNotifier {
  bool isEnglish = true;

  String? currentLanguage;
  Locale? locale;

  CurrentData({this.currentLanguage = 'English'}) {
    locale = LanguageHelper.convertLangNameToLocale(currentLanguage!);
  }

  void changeLocale(String newLocale) {
    currentLanguage = newLocale;
    locale = LanguageHelper.convertLangNameToLocale(newLocale);
    checkLanguage();
    notifyListeners();
  }

  String defineCurrentLanguage(BuildContext context) {
    if (currentLanguage != null) return currentLanguage!;
    checkLanguage();
    return LanguageHelper.convertLocaleToLangName(
      Localizations.localeOf(context).toString(),
    );
  }

  void checkLanguage() {
    if (locale == Locale(kKeyBangla)) {
      isEnglish = false;
    } else {
      isEnglish = true;
    }
    notifyListeners();
  }
}
