import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sw.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sw'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'WINGA KIGANJANI'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Campus needs, all in one place'**
  String get appTagline;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name} 👋'**
  String greeting(String name);

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back to your campus network.'**
  String get welcomeBack;

  /// No description provided for @campus.
  ///
  /// In en, this message translates to:
  /// **'Campus'**
  String get campus;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for food, accommodation, products or services...'**
  String get searchHint;

  /// No description provided for @dailyBudget.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Budget'**
  String get dailyBudget;

  /// No description provided for @budgetBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get budgetBalance;

  /// No description provided for @budgetSpent.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get budgetSpent;

  /// No description provided for @budgetLimit.
  ///
  /// In en, this message translates to:
  /// **'Daily Limit'**
  String get budgetLimit;

  /// No description provided for @manageBudget.
  ///
  /// In en, this message translates to:
  /// **'Manage Budget'**
  String get manageBudget;

  /// No description provided for @setBudget.
  ///
  /// In en, this message translates to:
  /// **'Set Daily Budget'**
  String get setBudget;

  /// No description provided for @loginToBudget.
  ///
  /// In en, this message translates to:
  /// **'Log in or create an account to view and manage your daily budget.'**
  String get loginToBudget;

  /// No description provided for @loginRegister.
  ///
  /// In en, this message translates to:
  /// **'Log In / Register'**
  String get loginRegister;

  /// No description provided for @quickServices.
  ///
  /// In en, this message translates to:
  /// **'Quick Services'**
  String get quickServices;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// No description provided for @accommodation.
  ///
  /// In en, this message translates to:
  /// **'Accommodation'**
  String get accommodation;

  /// No description provided for @marketplace.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get marketplace;

  /// No description provided for @research.
  ///
  /// In en, this message translates to:
  /// **'Research'**
  String get research;

  /// No description provided for @nearbyFood.
  ///
  /// In en, this message translates to:
  /// **'Food Available Nearby'**
  String get nearbyFood;

  /// No description provided for @viewAllFood.
  ///
  /// In en, this message translates to:
  /// **'View All Food'**
  String get viewAllFood;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @nearbyAccommodation.
  ///
  /// In en, this message translates to:
  /// **'Accommodation Near Campus'**
  String get nearbyAccommodation;

  /// No description provided for @viewAllAccommodation.
  ///
  /// In en, this message translates to:
  /// **'View All Accommodation'**
  String get viewAllAccommodation;

  /// No description provided for @rentNow.
  ///
  /// In en, this message translates to:
  /// **'Rent Now'**
  String get rentNow;

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended for You'**
  String get recommendedForYou;

  /// No description provided for @researchCorner.
  ///
  /// In en, this message translates to:
  /// **'Research Corner'**
  String get researchCorner;

  /// No description provided for @researchTitle.
  ///
  /// In en, this message translates to:
  /// **'Create or Answer Student Research'**
  String get researchTitle;

  /// No description provided for @researchDescription.
  ///
  /// In en, this message translates to:
  /// **'Participate in academic research or create your own questionnaire.'**
  String get researchDescription;

  /// No description provided for @answerSurvey.
  ///
  /// In en, this message translates to:
  /// **'Answer Survey'**
  String get answerSurvey;

  /// No description provided for @createSurvey.
  ///
  /// In en, this message translates to:
  /// **'Create Survey'**
  String get createSurvey;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @wingaCard.
  ///
  /// In en, this message translates to:
  /// **'Winga Card'**
  String get wingaCard;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @swahili.
  ///
  /// In en, this message translates to:
  /// **'Kiswahili'**
  String get swahili;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'TZS'**
  String get currency;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/ month'**
  String get perMonth;

  /// No description provided for @perYear.
  ///
  /// In en, this message translates to:
  /// **'/ year'**
  String get perYear;

  /// No description provided for @fromCampus.
  ///
  /// In en, this message translates to:
  /// **'from campus'**
  String get fromCampus;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No information available'**
  String get noData;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'sw'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sw':
      return AppLocalizationsSw();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
