# Firebase Configuration Setup Guide

## ⚠️ Important: What You Have vs What You Need

### ✅ What You Have (firebase/ folder)
The `firebase/` folder contains:
- `firebase.json` - Firebase CLI configuration
- `firestore.rules` - Firestore security rules
- `firestore.indexes.json` - Database indexes
- `functions/` - Cloud Functions code

**This is for Firebase deployment/deployment, NOT for the Flutter app!**

### ❌ What You Need (Missing - Need to Download)
You need these files to connect your Flutter app to Firebase:
1. **`google-services.json`** - For Android
2. **`GoogleService-Info.plist`** - For iOS

---

## 📥 How to Get the Config Files

### Step 1: Go to Firebase Console
1. Open [Firebase Console](https://console.firebase.google.com/)
2. Select your project: **AdminGloves**

### Step 2: Download Android Config File
1. Click on **⚙️ Project Settings** (gear icon at top)
2. Scroll down to **"Your apps"** section
3. If you see an Android app, click on it
4. If you DON'T see an Android app:
   - Click **"Add app"** → Select **Android** icon
   - Package name: `com.admingloves.sspr`
   - App nickname: `SSPR Android` (optional)
   - Click **"Register app"**
5. Download `google-services.json`
6. Place it in: `android/app/google-services.json`

### Step 3: Download iOS Config File
1. Still in Project Settings
2. Click **"Add app"** → Select **iOS** icon (if not already added)
3. Bundle ID: `com.example.myProject` (or your bundle ID)
4. Download `GoogleService-Info.plist`
5. Place it in: `ios/Runner/GoogleService-Info.plist`

---

## 📁 File Placement

### Android
```
sspr/
└── android/
    └── app/
        └── google-services.json  ← Place file here
```

### iOS
```
sspr/
└── ios/
    └── Runner/
        └── GoogleService-Info.plist  ← Place file here
```

---

## ✅ What I've Already Done for You

1. **Updated `android/build.gradle`**:
   - Added Firebase Google Services classpath
   
2. **Updated `android/app/build.gradle`**:
   - Added `com.google.gms.google-services` plugin

3. **Updated `lib/main.dart`**:
   - Added Firebase initialization (line 15)

4. **Created Firebase Service**:
   - `lib/services/firebase_service.dart` - Ready to connect

---

## 🧪 After Adding Config Files

Once you've placed the config files:

1. **Run Flutter clean and get**:
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Test the connection**:
   ```bash
   flutter run
   ```

3. **Enter a company name** from your Firestore:
   - Try: "admingloves1"
   - App should connect to Firebase and retrieve the URL

---

## 🔍 How to Verify Config Files are Correct

### Check google-services.json contains:
```json
{
  "project_info": {
    "project_id": "your-project-id",
    "project_number": "...",
    "storage_bucket": "..."
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "...",
        "android_client_info": {
          "package_name": "com.admingloves.sspr"
        }
      }
    }
  ]
}
```

### Check GoogleService-Info.plist contains:
```xml
<key>PROJECT_ID</key>
<string>your-project-id</string>
<key>BUNDLE_ID</key>
<string>com.example.myProject</string>
```

---

## 🚨 Common Issues

### Issue: "google-services.json not found"
**Solution**: Make sure file is in `android/app/` not `android/`

### Issue: "FirebaseApp is not initialized"
**Solution**: Check that `google-services.json` is correctly placed and build.gradle has the plugin

### Issue: "No Firebase App '[DEFAULT]' has been created"
**Solution**: Run `flutter clean` and rebuild

---

## 📞 Summary

**The `firebase/` folder you added is good for deployment**, but you still need to:
1. ✅ Download `google-services.json` from Firebase Console
2. ✅ Place it in `android/app/google-services.json`
3. ✅ Download `GoogleService-Info.plist` from Firebase Console  
4. ✅ Place it in `ios/Runner/GoogleService-Info.plist`

Once these 2 files are in place, your app will automatically connect to your Firebase backend!

