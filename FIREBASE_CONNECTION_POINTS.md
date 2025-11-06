# Firebase Backend Connection Points

## 🔗 Where Your App Connects to Firebase

### 1. **Firebase Initialization** (App Startup)
**File**: `lib/main.dart`  
**Line**: 15  
**Code**:
```dart
// Initialize Firebase
await Firebase.initializeApp();
```

**What it does**: 
- Connects your app to Firebase project when app starts
- Reads Firebase configuration from `google-services.json` (Android) or `GoogleService-Info.plist` (iOS)
- This is the FIRST connection point - establishes the link to your Firebase backend

---

### 2. **Firebase Service Connection** (Database Access)
**File**: `lib/services/firebase_service.dart`  
**Line**: 8  
**Code**:
```dart
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
```

**What it does**:
- Creates Firestore database instance
- Uses the Firebase project initialized in step 1
- This is your "database connection object"

---

### 3. **Actual Database Query** (Backend Request)
**File**: `lib/services/firebase_service.dart`  
**Lines**: 28-31  
**Code**:
```dart
var doc = await _firestore
    .collection('companies')        // ← Your Firestore collection
    .doc(normalizedName)            // ← Document ID (e.g., "admingloves1")
    .get();                         // ← Sends request to Firebase backend
```

**What it does**:
- **THIS IS WHERE IT CONNECTS TO YOUR FIREBASE BACKEND**
- Queries the `companies` collection in your Firestore database
- Looks for document with ID matching company name
- Gets the `url` field from that document
- Returns the URL to your app

---

### 4. **UI Integration Point** (User Interaction)
**File**: `lib/pages/company_input_page/company_input_page_widget.dart`  
**Lines**: 59-62  
**Code**:
```dart
final firebaseService = FirebaseService();
final url = await firebaseService.getCompanyUrl(companyName);
```

**What it does**:
- Called when user clicks "Continue" button
- Triggers the Firebase query (step 3)
- Gets the URL from your backend

---

## 📍 Complete Connection Flow

```
User enters "admingloves1"
    ↓
Company Input Page (_handleSubmit)
    ↓
FirebaseService.getCompanyUrl("admingloves1")
    ↓
_firestore.collection('companies').doc('admingloves1').get()
    ↓
🔥 **CONNECTS TO FIREBASE BACKEND HERE** 🔥
    ↓
Firebase Firestore Database
    Collection: companies
    Document: admingloves1
    Field: url = "https://admingloves.com"
    ↓
Returns URL to app
    ↓
App displays URL in WebView
```

---

## 🔧 Configuration Files (Where Backend Project is Specified)

### Android Configuration
**File Location**: `android/app/google-services.json` (You need to add this)

**What it contains**:
- Firebase project ID
- Database URL
- API keys
- Authentication credentials

**How to get it**:
1. Go to Firebase Console → Project Settings
2. Download `google-services.json`
3. Place it in `android/app/` folder

### iOS Configuration  
**File Location**: `ios/Runner/GoogleService-Info.plist` (You need to add this)

**Same process** but for iOS platform.

---

## 🎯 The Exact Backend Mapping

### Your Firebase Backend Structure:
```
Firebase Project: "AdminGloves"
    └── Firestore Database
        └── Collection: "companies"
            └── Document: "admingloves1"
                └── Field: "url" = "https://admingloves.com"
```

### How App Maps to It:

**Line 29 in `firebase_service.dart`**:
```dart
.collection('companies')  // ← Maps to your "companies" collection
```

**Line 30 in `firebase_service.dart`**:
```dart
.doc(normalizedName)      // ← Maps to document "admingloves1"
```

**Line 34 in `firebase_service.dart`**:
```dart
return doc.data()?['url'] // ← Gets the "url" field value
```

---

## ✅ To Complete the Connection:

1. **Add Firebase Config Files**:
   - Download `google-services.json` from Firebase Console
   - Place in `android/app/google-services.json`
   - Download `GoogleService-Info.plist`
   - Place in `ios/Runner/GoogleService-Info.plist`

2. **Update Android Build Files** (if needed):
   - `android/build.gradle` should have Firebase classpath
   - `android/app/build.gradle` should apply google-services plugin

3. **That's it!** The code connection is already done in:
   - `lib/main.dart` (line 15) - Initializes Firebase
   - `lib/services/firebase_service.dart` (line 8, 28-31) - Connects to Firestore

The app will automatically connect to your Firebase project specified in the config files!

