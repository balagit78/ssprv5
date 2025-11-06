# Firebase Setup Instructions

This app requires Firebase to be configured to store company name to URL mappings.

## Firebase Configuration Steps

1. **Create a Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or select an existing one
   - Enable Firestore Database

2. **Set up Firestore Database**
   - Create a collection named `companies`
   - Each document should have:
     - Document ID: (can be company name in lowercase) OR
     - Fields:
       - `name` (string): Company name (case-insensitive matching)
       - `url` (string): The URL to load in webview

3. **Add Sample Data**
   Example document structure:
   ```
   Collection: companies
   Document ID: acme-corp (or use auto-generated ID)
   Fields:
     name: "Acme Corp"
     url: "https://www.acmecorp.com"
   ```

   OR using company name as document ID:
   ```
   Collection: companies
   Document ID: acme-corp
   Fields:
     url: "https://www.acmecorp.com"
   ```

4. **Firebase Configuration Files**
   - For Android: Add `google-services.json` to `android/app/`
   - For iOS: Add `GoogleService-Info.plist` to `ios/Runner/`
   - Download these files from Firebase Console → Project Settings

5. **Update Firebase Rules** (Security)
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /companies/{document} {
         allow read: if true; // Or restrict based on your security needs
         allow write: if false; // Prevent client-side writes
       }
     }
   }
   ```

## App Flow

1. **First Launch**: App asks for company name
2. **Company Lookup**: Checks Firebase for company name → URL mapping
3. **Save Locally**: Stores URL in local storage (SharedPreferences)
4. **WebView**: Opens the URL in a webview
5. **Subsequent Launches**: Automatically opens stored URL
6. **Reset**: Users can reset via settings icon in webview

## Testing

1. Add a test company in Firestore:
   - Collection: `companies`
   - Document: `test-company`
   - Fields: `name: "Test Company"`, `url: "https://example.com"`

2. Run the app and enter "Test Company" when prompted
3. The app should navigate to the webview with the mapped URL

