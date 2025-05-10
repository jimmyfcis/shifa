// // This is a utility script to help identify hardcoded strings in the codebase
// // You can run this from the command line with:
// // dart find_hardcoded_strings.dart
//
// import 'dart:io';
//
// // Patterns to search for in Dart files that might indicate hardcoded strings
// final List<RegExp> patterns = [
//   // Match strings in Text widgets
//   RegExp(r'Text\(\s*"[^"]+"\s*\)'),
//   RegExp(r"Text\(\s*'[^']+'\s*\)"),
//
//   // Match string literals in variable assignments
//   RegExp(r'=\s*"[^"]+"'),
//   RegExp(r"=\s*'[^']+'"),
//
//   // Match strings passed to methods or constructors (like title: "Something")
//   RegExp(r':\s*"[^"]+"'),
//   RegExp(r":\s*'[^']+'"),
// ];
//
// // Patterns to exclude (e.g., imports, assets paths, etc.)
// final List<RegExp> exclusions = [
//   RegExp(r'import\s+["\']'),
//   RegExp(r'assets/'),
//   RegExp(r'packages/'),
//   RegExp(r'http[s]?://'),
//   RegExp(r'context\.tr\.translate'),  // Skip strings already using translation
// ];
//
// void main() async {
//   print('Scanning for hardcoded strings...');
//
//   // Get list of all Dart files in the lib directory
//   final Directory libDir = Directory('lib');
//   final List<FileSystemEntity> entities = await libDir
//       .list(recursive: true)
//       .where((entity) => entity.path.endsWith('.dart'))
//       .toList();
//
//   int totalHardcodedCount = 0;
//
//   for (final entity in entities) {
//     final File file = File(entity.path);
//     final String content = await file.readAsString();
//     final List<String> lines = content.split('\n');
//
//     List<Map<String, dynamic>> matches = [];
//
//     for (int i = 0; i < lines.length; i++) {
//       final String line = lines[i];
//
//       for (final pattern in patterns) {
//         for (final match in pattern.allMatches(line)) {
//           // Check if this match should be excluded
//           bool shouldExclude = false;
//           for (final exclusion in exclusions) {
//             if (exclusion.hasMatch(line)) {
//               shouldExclude = true;
//               break;
//             }
//           }
//
//           if (!shouldExclude) {
//             matches.add({
//               'line': i + 1,
//               'content': line.trim(),
//               'match': match.group(0),
//             });
//           }
//         }
//       }
//     }
//
//     if (matches.isNotEmpty) {
//       print('\n${entity.path}:');
//       for (final match in matches) {
//         print('  Line ${match['line']}: ${match['content']}');
//       }
//       totalHardcodedCount += matches.length;
//     }
//   }
//
//   print('\n----------------------------------------');
//   print('Found $totalHardcodedCount potential hardcoded strings.');
//   print('----------------------------------------');
//   print('To localize these strings:');
//   print('1. Add translation keys to assets/languages/en.json and assets/languages/ar.json');
//   print('2. Replace hardcoded strings with context.tr.translate("key_name")');
//   print('3. Run this script again to verify all strings have been localized');
// }