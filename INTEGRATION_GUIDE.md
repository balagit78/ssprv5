# Firebase Integration Guide

## How It Works

### Flow Diagram
```
User enters company name 
    ↓
Company Input Page (_handleSubmit method)
    ↓
FirebaseService.getCompanyUrl()
    ↓
Firebase Firestore Lookup (tries multiple strategies)
    ↓
Returns URL or null
    ↓
If URL found → Save to local storage → Open WebView
If not found → Show error message
```

## Integration Points

### 1. **Company Input Page** (`lib/pages/company_input_page/company_input_page_widget.dart`)

**Location**: Lines 57-85 in `_handleSubmit()` method

**What it does**:
- Gets the company name from the text field
- Calls `FirebaseService` to lookup the URL
- If URL is found:
  - Saves URL and company name to local storage (SharedPreferences)
  - Navigates to WebView page
- If not found:
  - Displays error message to user

```dart
final firebaseService = FirebaseService();
final url = await firebaseService.getCompanyUrl(companyName);
```

### 2. **Firebase Service** (`lib/services/firebase_service.dart`)

**Location**: `getCompanyUrl()` method

**What it does**: 
Tries multiple strategies to find the company URL:

1. **Exact Document ID Match**: Tries exact company name as document ID
2. **Normalized Document ID**: Tries lowercase, no spaces version
3. **Number Variations**: Tries with numbers 0-9 appended (e.g., "admingloves" → "admingloves1")
4. **Name Field Query**: If documents have a "name" field, queries by that
5. **Partial Match**: Searches all documents for partial matches in document IDs

**Firestore Structure It Expects**:
```
Collection: companies
├── Document ID: admingloves1
│   └── Field: url = "https://admingloves.com"
├── Document ID: companyname2
│   └── Field: url = "https://companyname.com"
└── ...
```

### 3. **Storage Service** (`lib/services/storage_service.dart`)

**What it does**: 
- Saves the URL locally so app doesn't need to query Firebase every time
- Stores both company name and URL
- Used on app launch to check if URL already exists

### 4. **Splash Page** (`lib/pages/splash_page/splash_page_widget.dart`)

**What it does**:
- Checks local storage on app launch
- If URL exists → Goes directly to WebView
- If no URL → Goes to Company Input Page

## How to Use with Your Firestore Database

### Option 1: Use Document IDs (Recommended - What you have now)

**Structure**:
```
Collection: companies
Document ID: admingloves1
Fields: url = "https://admingloves.com"
```

**User Experience**:
- User can enter: "admingloves", "AdminGloves", "admingloves1", etc.
- The app will match it to document "admingloves1" and return the URL

### Option 2: Add a "name" Field (More Flexible)

**Structure**:
```
Collection: companies
Document ID: admingloves1 (or any ID)
Fields: 
  - name = "AdminGloves"
  - url = "https://admingloves.com"
```

**User Experience**:
- User enters: "AdminGloves" or "admingloves"
- App queries by "name" field and finds the document
- Returns the URL

## Testing

1. **Test with your current structure**:
   - Enter "admingloves" or "AdminGloves" or "admingloves1"
   - Should find document `admingloves1` and return `https://admingloves.com`

2. **Add a test document**:
   - Create document ID: `testcompany1`
   - Add field: `url = "https://example.com"`
   - Enter "testcompany" or "TestCompany" in app
   - Should find and open the URL

## Troubleshooting

### Company not found
1. Check document ID matches (case-insensitive, spaces removed)
2. Verify `url` field exists in document
3. Check Firebase connection in console logs
4. Verify Firestore rules allow reads

### URL not opening
1. Check if URL is valid (starts with http:// or https://)
2. Verify URL is saved in local storage
3. Check WebView permissions in AndroidManifest.xml

## Next Steps

1. **Run `flutter pub get`** to ensure all dependencies are installed
2. **Configure Firebase**:
   - Add `google-services.json` to `android/app/`
   - Add `GoogleService-Info.plist` to `ios/Runner/`
3. **Test the flow**:
   - Enter a company name from your Firestore
   - Verify it finds and opens the URL

