# Shifa App Localization Checklist

Use this checklist to ensure all parts of the app are properly localized.

## Features to Localize

### Core Components
- [x] App name
- [x] Bottom navigation items
- [x] Error messages
- [x] Common buttons
- [x] Dialogs and alerts

### Authentication
- [x] Login screen
- [x] Registration screen
- [x] Password recovery screens
- [x] Verification screens
- [x] Error messages

### Home Feature
- [x] Headers and titles
- [x] Section titles
- [x] Information cards
- [x] Queue system
- [x] Appointment details

### Clinics Feature
- [x] Clinic names and descriptions
- [x] Search functionality
- [x] Filter options
- [x] Doctor information
- [x] Booking flow

### Settings
- [x] Settings labels
- [x] Language selection
- [x] Privacy policy
- [x] Terms and conditions
- [x] User preferences

### Contact Us
- [x] Form labels
- [x] Validation messages
- [x] Success messages
- [x] Contact information

## Implementation Steps

1. **Identify Hardcoded Strings**
   - [x] Use the `find_hardcoded_strings.dart` script
   - [ ] Review all screens manually

2. **Add Translation Keys**
   - [x] Add keys to English file (`en.json`)
   - [x] Add keys to Arabic file (`ar.json`)
   - [ ] Organize keys by feature

3. **Replace Hardcoded Strings**
   - [x] Use `context.tr.translate('key_name')` pattern
   - [ ] Check dynamic content (like formatted dates, numbers)
   - [ ] Ensure proper escaping of special characters

4. **RTL Support**
   - [x] Test UI in RTL mode
   - [ ] Fix layout issues specific to RTL
   - [ ] Ensure icons and images are correctly mirrored if necessary

5. **Testing**
   - [ ] Test all screens in English
   - [ ] Test all screens in Arabic
   - [ ] Check dynamic content
   - [ ] Verify text overflow is handled properly
   - [ ] Test on different screen sizes

## Common Issues to Watch For

1. **Concatenated Strings**
   - Replace: `"Hello " + userName` 
   - With: `context.tr.translate('hello_user').replaceAll('{name}', userName)`

2. **Pluralization**
   - Use separate keys for singular/plural forms

3. **Date/Time Formatting**
   - Use language-specific formatters

4. **Numeric Formatting**
   - Consider decimal separators and thousands separators

5. **UI Layout**
   - Ensure UI adapts to different text lengths
   - Test overflow scenarios
   - Ensure proper RTL support

## Testing Flow

1. Set app language to English
2. Navigate through all screens to verify English text
3. Change app language to Arabic
4. Navigate through all screens to verify Arabic text
5. Test all functionality in both language settings
6. Test language switching behavior 