# Shifa App Localization Guide

This document provides information on how the localization system works in the Shifa app and how to add support for new languages.

## How Localization Works

The Shifa app uses a custom localization system built on Flutter's localization infrastructure. The key components are:

1. **AppLocalizations**: The main class that loads and provides translations.
2. **LocaleProvider**: A ChangeNotifier class that manages the current locale state.
3. **Language JSON files**: Located in `assets/languages/` directory with language codes as filenames (e.g., `en.json`, `ar.json`).
4. **TokenStorage**: Used to persist the user's language preference.
5. **Context extensions**: Convenient methods to access translations from any widget using BuildContext.

## Currently Supported Languages

- English (`en`)
- Arabic (`ar`)

## Adding Translations

To add new strings that need translation:

1. Add the string key and value to `assets/languages/en.json` for English
2. Add the same key with translated value to `assets/languages/ar.json` for Arabic

Example:
```json
// en.json
{
  "my_new_string": "My new string in English"
}

// ar.json
{
  "my_new_string": "نص جديد باللغة العربية"
}
```

## Using Translations in Code

To use translated strings in your widgets:

```dart
// Import the extension
import 'package:shifa/core/localization/app_extensions.dart';

// Then use it in your widget
Text(context.tr.translate('my_string_key'))
```

## Finding Hardcoded Strings

The project includes a utility script to help identify remaining hardcoded strings in the codebase:

```bash
# Run from the project root
dart find_hardcoded_strings.dart
```

This script scans all Dart files in the `lib` directory and identifies potential hardcoded strings that should be localized. It provides file names and line numbers to make it easier to locate and replace them.

## RTL Support

Arabic language is right-to-left (RTL). The app automatically handles RTL layout when the locale is set to Arabic. You can check the current direction using:

```dart
// Check if current locale is RTL
bool isRtl = context.isRtl;

// Get the current text direction
TextDirection direction = context.textDirection;
```

## Adding a New Language

To add support for a new language:

1. Create a new JSON file in `assets/languages/` with the language code as the filename (e.g., `fr.json` for French)
2. Copy all keys from `en.json` and translate the values
3. Add the new locale to the supported locales list in `AppLocalizations`:

```dart
static const List<Locale> supportedLocales = [
  Locale('en', ''), // English
  Locale('ar', ''), // Arabic
  Locale('fr', ''), // French - New language
];
```

4. Add the language code to the supported languages check in `_AppLocalizationsDelegate`:

```dart
@override
bool isSupported(Locale locale) {
  return ['en', 'ar', 'fr'].contains(locale.languageCode);
}
```

5. Add methods to switch to the new language in `LocaleProvider`:

```dart
Future<void> setFrench() async {
  await setLocale(const Locale('fr'));
}
```

## Best Practices

1. **Use String Keys**: Always use descriptive, lowercase, underscore-separated string keys.
2. **Organize by Feature**: Group related keys together in the JSON files.
3. **Avoid Hardcoded Strings**: Never use hardcoded strings in UI components; always use the translation system.
4. **Handle Plurals**: For strings with count-dependent variations, use different keys (e.g., `item_singular`, `item_plural`).
5. **Dynamic Content**: For strings with dynamic content, use placeholder patterns like `{name}` and replace them at runtime.

## Complete Localization Process

Follow this process to ensure complete localization of new features:

1. **Development Phase**:
   - Use the translation system from the start when adding new UI elements
   - Use descriptive key names that match the feature

2. **Pre-release Check**:
   - Run `dart find_hardcoded_strings.dart` to identify missed strings
   - Update language files with any missing keys
   - Test UI in both languages to ensure everything is properly translated

3. **Post-release Maintenance**:
   - When adding new text, always add it to both language files
   - Review user feedback for translation issues

## Testing Localization

To test the app in different languages:
1. Go to the Settings screen
2. Select a different language
3. The app should immediately update to show all strings in the selected language.

For a complete testing checklist, see `LOCALIZATION_CHECKLIST.md`. 