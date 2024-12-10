# Jasstafel

[![JassTafel CI](https://github.com/simonste/jasstafel/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/simonste/jasstafel/actions/workflows/test.yml?branch=main)
[![JassTafel CD](https://github.com/simonste/jasstafel/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/simonste/jasstafel/actions/workflows/build.yml?branch=main)
[![F-Droid release](https://img.shields.io/f-droid/v/ch.simonste.jasstafel.svg?logo=F-Droid)](https://f-droid.org/en/packages/ch.simonste.jasstafel/)
[![GitHub](https://img.shields.io/github/license/simonste/jasstafel)](https://github.com/simonste/jasstafel/blob/main/LICENSE)

Jasstafel for Android & iOS (& more)

## About

Jasstafel is an app to write points in the swiss card game Jass.

| Android | Android (F-Droid) | iOS |
|:-:|:-:|:-:|
[![Google Play](assets/badges/google-play-badge.png)](https://play.google.com/store/apps/details?id=ch.simonste.jasstafel) | [![F-Droid](assets/badges/f-droid-badge.png)](https://f-droid.org/en/packages/ch.simonste.jasstafel/) | [![App Store](assets/badges/appstore-badge.png)](https://apps.apple.com/ch/app/schweizer-jasstafel/id1672847164) |

## Getting Started

### Prerequisites

Before running the app, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Latest stable version recommended)
- Dart SDK (comes with Flutter)
- A code editor such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Setup Instructions

Follow these steps to set up the project and run it locally.

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Install dependencies:**
   Run the following command to fetch all the necessary packages:
   ```bash
   flutter pub get
   ```

3. **Generate required source files:**
   Use `build_runner` to generate files needed for the app:
   ```bash
   dart run build_runner build
   ```

4. **Generate app icons:**
   If app icons are not already generated, use the `flutter_launcher_icons` package:
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

5. **Run the app:**
   Start the app in your desired environment (e.g., Android, iOS, web):
   ```bash
   flutter run
   ```

### Additional Commands

- **Regenerate source files automatically during development:**
   ```bash
   dart run build_runner watch
   ```

- **Clean up generated files:**
   If you encounter issues with generated files, clean and rebuild:
   ```bash
   dart run build_runner clean
   dart run build_runner build
   ```

## Run tests

`flutter test`
`flutter test -d linux integration_test/`

## Build for web

`flutter build web`

## Troubleshooting 

If you encounter any issues during setup or development:

1. **Dependencies not installed:**
   Run `flutter pub get` to ensure all dependencies are fetched.

2. **Generated files missing or outdated:**
   Use the following commands to regenerate files:
   ```bash
   dart run build_runner build
   ```

3. **Icons missing:**
   Regenerate app icons:
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

4. **Clean build errors:**
   If you encounter build issues, clean the project and retry:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```
