# food_delivery

A new Flutter project for G10

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Food Delivery App

A food delivery mobile application built with Flutter, utilizing Riverpod for state management. The app provides a user-friendly interface for browsing restaurants, managing orders, and making payments. Clean architecture principles are applied for better code maintainability.

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Technologies Used](#technologies-used)
- [License](#license)

## Features

- Browse restaurants and food items
- Add to favorites and manage orders
- User authentication (login, signup)
- Search functionality
- Localization support for multiple languages (e.g., English, Russian, Japanese, Arabic, Uzbek)
- Persistent user sessions with local storage

## Project Structure

```bash
        lib/
        ├── generated/           # Generated files
        │   └── assets.dart      # Assets configuration
        ├── l10n/                # Localization files
        │   ├── app_ar.arb       # Arabic language localization
        │   ├── app_en.arb       # English language localization
        │   ├── app_ja.arb       # Japanese language localization
        │   ├── app_ru.arb       # Russian language localization
        │   └── app_uz.arb       # Uzbek language localization
        ├── src/                 # Main source code
        │   ├── core/            # Core functionality
        │   │   ├── constants/   # Application constants
        │   │   ├── routes/      # Application routing (navigation)
        │   │   ├── widgets/     # Reusable widgets
        │   │   ├── style/       # Theme and styling definitions
        │   │   ├── storage/     # Local storage management
        │   │   ├── server/      # API services (e.g., Dio configuration)
        │   │   └── locale/      # Localization and language handling
        │   ├── data/            # Data layer
        │   │   ├── entity/      # Data entities
        │   │   └── repository/  # Repository pattern for data management
        │   ├── feature/         # Feature-specific modules
        │   │   ├── auth/        # User authentication (login, signup)
        │   │   ├── favorite/    # Favorite restaurants and items
        │   │   ├── home/        # Home screen and main browsing experience
        │   │   ├── profile/     # User profile management
        │   │   ├── restaurant/  # Restaurant details and menu
        │   │   ├── search/      # Search functionality
        │   │   ├── setting/     # App settings module
        │   │   ├── widgets/     # Widgets specific to the feature modules
        │   ├── app.dart         # App-level configurations and startup
        ├── main.dart            # Main entry point of the app
        ├── riverpod.dart        # Riverpod setup and state management
        ├── runner.dart          # Application runner
        └── setup.dart           # Application setup and dependency injection


ARB files are used to manage translations efficiently, allowing easy expansion to additional languages in the future.

## Screenshots

