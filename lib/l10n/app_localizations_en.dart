// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'WINGA KIGANJANI';

  @override
  String get appTagline => 'Campus needs, all in one place';

  @override
  String greeting(String name) {
    return 'Hello, $name 👋';
  }

  @override
  String get welcomeBack => 'Welcome back to your campus network.';

  @override
  String get campus => 'Campus';

  @override
  String get searchHint =>
      'Search for food, accommodation, products or services...';

  @override
  String get dailyBudget => 'Today\'s Budget';

  @override
  String get budgetBalance => 'Balance';

  @override
  String get budgetSpent => 'Spent';

  @override
  String get budgetLimit => 'Daily Limit';

  @override
  String get manageBudget => 'Manage Budget';

  @override
  String get setBudget => 'Set Daily Budget';

  @override
  String get loginToBudget =>
      'Log in or create an account to view and manage your daily budget.';

  @override
  String get loginRegister => 'Log In / Register';

  @override
  String get quickServices => 'Quick Services';

  @override
  String get food => 'Food';

  @override
  String get accommodation => 'Accommodation';

  @override
  String get marketplace => 'Marketplace';

  @override
  String get research => 'Research';

  @override
  String get nearbyFood => 'Food Available Nearby';

  @override
  String get viewAllFood => 'View All Food';

  @override
  String get orderNow => 'Order Now';

  @override
  String get viewDetails => 'View Details';

  @override
  String get nearbyAccommodation => 'Accommodation Near Campus';

  @override
  String get viewAllAccommodation => 'View All Accommodation';

  @override
  String get rentNow => 'Rent Now';

  @override
  String get recommendedForYou => 'Recommended for You';

  @override
  String get researchCorner => 'Research Corner';

  @override
  String get researchTitle => 'Create or Answer Student Research';

  @override
  String get researchDescription =>
      'Participate in academic research or create your own questionnaire.';

  @override
  String get answerSurvey => 'Answer Survey';

  @override
  String get createSurvey => 'Create Survey';

  @override
  String get home => 'Home';

  @override
  String get explore => 'Explore';

  @override
  String get wingaCard => 'Winga Card';

  @override
  String get orders => 'Orders';

  @override
  String get profile => 'Profile';

  @override
  String get notifications => 'Notifications';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get english => 'English';

  @override
  String get swahili => 'Kiswahili';

  @override
  String get currency => 'TZS';

  @override
  String get perMonth => '/ month';

  @override
  String get perYear => '/ year';

  @override
  String get fromCampus => 'from campus';

  @override
  String get noData => 'No information available';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Something went wrong';

  @override
  String get retry => 'Retry';
}
