import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @wateen.
  ///
  /// In en, this message translates to:
  /// **'Wateen'**
  String get wateen;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @alsalam.
  ///
  /// In en, this message translates to:
  /// **'Alsalam Alikom'**
  String get alsalam;

  /// No description provided for @courage.
  ///
  /// In en, this message translates to:
  /// **'Small consistent actions are better than big actions that don’t last'**
  String get courage;

  /// No description provided for @great.
  ///
  /// In en, this message translates to:
  /// **'You are doing great ✨'**
  String get great;

  /// No description provided for @keep.
  ///
  /// In en, this message translates to:
  /// **'Keep going 💪'**
  String get keep;

  /// No description provided for @habits.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Habits'**
  String get habits;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Progress'**
  String get progress;

  /// No description provided for @prayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get prayer;

  /// No description provided for @fajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajr;

  /// No description provided for @dhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In en, this message translates to:
  /// **'Eshaa'**
  String get isha;

  /// No description provided for @quran.
  ///
  /// In en, this message translates to:
  /// **'Quran'**
  String get quran;

  /// No description provided for @azkar.
  ///
  /// In en, this message translates to:
  /// **'Azkar'**
  String get azkar;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @not.
  ///
  /// In en, this message translates to:
  /// **'Not Yet'**
  String get not;

  /// No description provided for @surah.
  ///
  /// In en, this message translates to:
  /// **'Surah'**
  String get surah;

  /// No description provided for @pages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get pages;

  /// No description provided for @lastRead.
  ///
  /// In en, this message translates to:
  /// **'Last surah is {surah} page {page}'**
  String lastRead(Object page, Object surah);

  /// No description provided for @emptyField.
  ///
  /// In en, this message translates to:
  /// **'Please enter the page number'**
  String get emptyField;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @startReading.
  ///
  /// In en, this message translates to:
  /// **'Please start reading'**
  String get startReading;

  /// No description provided for @morningAzkar.
  ///
  /// In en, this message translates to:
  /// **'Morning Azkar'**
  String get morningAzkar;

  /// No description provided for @eveningAzkar.
  ///
  /// In en, this message translates to:
  /// **'Evening Azkar'**
  String get eveningAzkar;

  /// No description provided for @subhanAllah.
  ///
  /// In en, this message translates to:
  /// **'Subhan Allah'**
  String get subhanAllah;

  /// No description provided for @alhamdulilah.
  ///
  /// In en, this message translates to:
  /// **'Alhamdulilah'**
  String get alhamdulilah;

  /// No description provided for @allahAkbar.
  ///
  /// In en, this message translates to:
  /// **'Allah Akbar'**
  String get allahAkbar;

  /// No description provided for @laEllahEllaAllah.
  ///
  /// In en, this message translates to:
  /// **'La Ellah Ella Allah'**
  String get laEllahEllaAllah;

  /// No description provided for @astaghfarAllah.
  ///
  /// In en, this message translates to:
  /// **'Astaghfar Allah'**
  String get astaghfarAllah;

  /// No description provided for @press.
  ///
  /// In en, this message translates to:
  /// **'Press to count'**
  String get press;

  /// No description provided for @streak.
  ///
  /// In en, this message translates to:
  /// **'Streak 🔥'**
  String get streak;

  /// No description provided for @increase.
  ///
  /// In en, this message translates to:
  /// **'Streak increment'**
  String get increase;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @screens.
  ///
  /// In en, this message translates to:
  /// **'App Screens'**
  String get screens;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get light;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @morningDes.
  ///
  /// In en, this message translates to:
  /// **'O Allah, by You we enter the morning and by You we enter the evening, by You we live and by You we die, and to You is the final return.\nWe have entered the morning and at this very time the whole kingdom belongs to Allah. Praise be to Allah. There is no worthy of worship except Allah Alone, with no partner. To Him belongs the kingdom and to Him belongs the praise. He gives life and causes death, and He is Capable of all things.\nWe have entered the morning upon the natural religion of Islam, the word of sincere devotion, the religion of our Prophet Muhammad (PBUH), and the faith of our father Abraham, a man of pure belief and a Muslim, and he was not of those who associate others with Allah.\nO Allah, I have entered the morning in blessing, health, and protection from You, so complete Your blessing, health, and protection upon me in this world and the Hereafter.\nO Allah, whatever blessing has come to me or to any of Your creation, it is from You Alone, with no partner, so for You is all praise and to You is all thanks.\nO Allah, I have entered the morning calling You to witness, and calling the bearers of Your Throne, Your angels, and all of Your creation to witness, that You are Allah, there is no god but You, Alone with no partner, and that Muhammad is Your servant and Messenger.\nMy Lord, all praise is due to You as is fitting for the Majesty of Your Face and the Greatness of Your Power.\nO Allah, grant me health in my body. O Allah, grant me health in my hearing. O Allah, grant me health in my sight. There is no god but You.\nO Allah, I seek refuge in You from anxiety and sorrow, and I seek refuge in You from inability and laziness, and I seek refuge in You from cowardice and miserliness, and I seek refuge in You from being overwhelmed by debt and the oppression of men.\nO Allah, I seek refuge in You from disbelief and poverty, and I seek refuge in You from the punishment of the grave. There is no god but You.\nIn the Name of Allah, Who with His Name nothing can cause harm in the earth nor in the heavens, and He is the All-Hearing, the All-Knowing.\nO Lord, I ask You for the good of this day and the good of what follows it, and I seek refuge in You from the evil of this day and the evil of what follows it.\nI am pleased with Allah as my Lord, with Islam as my religion, and with Muhammad (PBUH) as my Prophet and Messenger.\nO Allah, You are my Lord, there is no god but You. You created me and I am Your servant, and I abide by Your covenant and promise as much as I am able. I seek refuge in You from the evil of what I have done. I acknowledge Your blessing upon me and I acknowledge my sin, so forgive me, for indeed none forgives sins except You.\nAllah is sufficient for me; there is no god but He. In Him I have put my trust, and He is the Lord of the Great Throne.'**
  String get morningDes;

  /// No description provided for @eveningDes.
  ///
  /// In en, this message translates to:
  /// **'O Allah, by You we enter the evening and by You we enter the morning, by You we live and by You we die, and to You is the final return.\nWe have entered the evening and at this very time the whole kingdom belongs to Allah. Praise be to Allah. There is no worthy of worship except Allah Alone, with no partner. To Him belongs the kingdom and to Him belongs the praise. He gives life and causes death, and He is Capable of all things.\nWe have entered the evening upon the natural religion of Islam, the word of sincere devotion, the religion of our Prophet Muhammad (PBUH), and the faith of our father Abraham, a man of pure belief and a Muslim, and he was not of those who associate others with Allah.\nO Allah, I have entered the evening in blessing, health, and protection from You, so complete Your blessing, health, and protection upon me in this world and the Hereafter.\nO Allah, whatever blessing has come to me or to any of Your creation, it is from You Alone, with no partner, so for You is all praise and to You is all thanks.\nO Allah, I have entered the evening calling You to witness, and calling the bearers of Your Throne, Your angels, and all of Your creation to witness, that You are Allah, there is no god but You, Alone with no partner, and that Muhammad is Your servant and Messenger.\nMy Lord, all praise is due to You as is fitting for the Majesty of Your Face and the Greatness of Your Power.\nO Allah, grant me health in my body. O Allah, grant me health in my hearing. O Allah, grant me health in my sight. There is no god but You.\nO Allah, I seek refuge in You from anxiety and sorrow, and I seek refuge in You from inability and laziness, and I seek refuge in You from cowardice and miserliness, and I seek refuge in You from being overwhelmed by debt and the oppression of men.\nO Allah, I seek refuge in You from disbelief and poverty, and I seek refuge in You from the punishment of the grave. There is no god but You.\nIn the Name of Allah, Who with His Name nothing can cause harm in the earth nor in the heavens, and He is the All-Hearing, the All-Knowing.\nO Lord, I ask You for the good of this night and the good of what follows it, and I seek refuge in You from the evil of this night and the evil of what follows it.\nI am pleased with Allah as my Lord, with Islam as my religion, and with Muhammad (PBUH) as my Prophet and Messenger.\nO Allah, You are my Lord, there is no god but You. You created me and I am Your servant, and I abide by Your covenant and promise as much as I am able. I seek refuge in You from the evil of what I have done. I acknowledge Your blessing upon me and I acknowledge my sin, so forgive me, for indeed none forgives sins except You.\nAllah is sufficient for me; there is no god but He. In Him I have put my trust, and He is the Lord of the Great Throne.'**
  String get eveningDes;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
