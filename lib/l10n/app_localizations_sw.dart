// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appName => 'WINGA KIGANJANI';

  @override
  String get appTagline => 'Mahitaji ya Campus, Sehemu Moja';

  @override
  String greeting(String name) {
    return 'Habari, $name 👋';
  }

  @override
  String get welcomeBack => 'Karibu tena kwenye mtandao wako wa campus.';

  @override
  String get campus => 'Campus';

  @override
  String get searchHint => 'Tafuta chakula, malazi, bidhaa au huduma...';

  @override
  String get dailyBudget => 'Bajeti ya Leo';

  @override
  String get budgetBalance => 'Salio';

  @override
  String get budgetSpent => 'Iliyotumika';

  @override
  String get budgetLimit => 'Kikomo cha Siku';

  @override
  String get manageBudget => 'Simamia Bajeti';

  @override
  String get setBudget => 'Weka Bajeti ya Siku';

  @override
  String get loginToBudget =>
      'Ingia au fungua akaunti ili kuona na kusimamia bajeti yako ya kila siku.';

  @override
  String get loginRegister => 'Ingia / Jisajili';

  @override
  String get quickServices => 'Huduma za Haraka';

  @override
  String get food => 'Chakula';

  @override
  String get accommodation => 'Malazi';

  @override
  String get marketplace => 'Soko';

  @override
  String get research => 'Utafiti';

  @override
  String get nearbyFood => 'Chakula Kinachopatikana Karibu';

  @override
  String get viewAllFood => 'Ona Chakula Chote';

  @override
  String get orderNow => 'Agiza Sasa';

  @override
  String get viewDetails => 'Ona Maelezo';

  @override
  String get nearbyAccommodation => 'Malazi Karibu na Campus';

  @override
  String get viewAllAccommodation => 'Ona Malazi Yote';

  @override
  String get rentNow => 'Pangisha Sasa';

  @override
  String get recommendedForYou => 'Mapendekezo Kwako';

  @override
  String get researchCorner => 'Kituo cha Utafiti';

  @override
  String get researchTitle => 'Tengeneza au Jibu Utafiti wa Wanafunzi';

  @override
  String get researchDescription =>
      'Shiriki katika utafiti wa kitaaluma au tengeneza dodoso lako mwenyewe.';

  @override
  String get answerSurvey => 'Jibu Dodoso';

  @override
  String get createSurvey => 'Tengeneza Dodoso';

  @override
  String get home => 'Nyumbani';

  @override
  String get explore => 'Gundua';

  @override
  String get wingaCard => 'Winga Card';

  @override
  String get orders => 'Maagizo';

  @override
  String get profile => 'Wasifu';

  @override
  String get notifications => 'Arifa';

  @override
  String get settings => 'Mipangilio';

  @override
  String get language => 'Lugha';

  @override
  String get selectLanguage => 'Chagua Lugha';

  @override
  String get english => 'English';

  @override
  String get swahili => 'Kiswahili';

  @override
  String get currency => 'TZS';

  @override
  String get perMonth => '/ mwezi';

  @override
  String get perYear => '/ mwaka';

  @override
  String get fromCampus => 'kutoka campus';

  @override
  String get noData => 'Hakuna taarifa inayopatikana';

  @override
  String get loading => 'Inapakia...';

  @override
  String get error => 'Kuna tatizo limetokea';

  @override
  String get retry => 'Jaribu Tena';
}
