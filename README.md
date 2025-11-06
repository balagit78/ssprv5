# SSPR - Enterprise App

A Flutter Flow enterprise application that allows users to enter a company name, looks up the corresponding URL from Firebase, and displays it in a webview.

## Features

- **Company Name Input**: Enter company name on first launch
- **Firebase Integration**: Looks up company URL from Firestore database
- **Local Storage**: Saves company URL for subsequent app launches
- **WebView Display**: Displays company URL in an embedded webview
- **Error Handling**: Robust error handling with retry mechanisms
- **Reset Functionality**: Users can reset and enter a new company name

## Setup

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Firebase Configuration**
   - See `FIREBASE_SETUP.md` for detailed Firebase setup instructions
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)

3. **Firestore Database Structure**
   - Collection: `companies`
   - Fields: `name` (string), `url` (string)
   - Or use company name as document ID with `url` field

4. **Run the App**
   ```bash
   flutter run
   ```

## App Flow

1. App launches → Splash page checks for stored company URL
2. If no URL found → Shows company name input page
3. User enters company name → App queries Firebase
4. If company found → Saves URL and opens webview
5. If not found → Shows error with retry option
6. Subsequent launches → Automatically opens stored URL

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.
