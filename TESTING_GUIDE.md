# Testing Guide

## ⚠️ Important: Platform Considerations

### **Web (Chrome) Testing:**
- ✅ Basic UI will work
- ❌ **WebView does NOT work on web** - webview_flutter package is for mobile only
- ⚠️ Firebase might have limited functionality on web
- 🔄 **Better for testing UI only**

### **Android/iOS Testing (Recommended):**
- ✅ Full functionality
- ✅ Firebase works perfectly
- ✅ WebView works
- 🔄 **Best for complete testing**

---

## 🧪 How to Test

### Option 1: Test on Android (Recommended)

1. **Connect Android Device or Start Emulator**:
   ```bash
   # List available devices
   flutter devices
   
   # Run on Android
   flutter run
   ```

2. **What to Test**:
   - App should show "Enter Company Name" screen
   - Enter: `admingloves1`
   - Click "Continue"
   - Should fetch URL from Firebase
   - Should open URL in WebView

### Option 2: Test on Web (Limited Functionality)

1. **Stop current Chrome session** (if running)
2. **Run on Web**:
   ```bash
   flutter run -d chrome
   ```

3. **What Works**:
   - ✅ Company input page
   - ✅ Firebase connection (should work)
   - ✅ Local storage
   - ❌ WebView will NOT work (mobile only)

4. **Expected Behavior**:
   - You can enter company name
   - Firebase should connect
   - Will get URL but WebView won't display it properly

---

## 🔍 Testing Checklist

### ✅ Step 1: Test Firebase Connection
- [ ] App launches without errors
- [ ] No Firebase initialization errors in console
- [ ] Can see "Enter Company Name" screen

### ✅ Step 2: Test Company Lookup
- [ ] Enter: `admingloves1`
- [ ] Click "Continue"
- [ ] Should show loading indicator
- [ ] Should fetch URL from Firebase
- [ ] Should navigate to WebView (on mobile) or show URL (on web)

### ✅ Step 3: Test Error Handling
- [ ] Enter: `nonexistent`
- [ ] Should show error: "Company not found. Please try again."
- [ ] Can try again

### ✅ Step 4: Test Local Storage
- [ ] After successful lookup, close app
- [ ] Reopen app
- [ ] Should skip company input and go directly to WebView

---

## 🐛 Troubleshooting

### Issue: "Waiting for connection from debug service"
**Solution**: 
- This is normal during startup
- Wait a few seconds
- If stuck, stop and restart: `flutter run`

### Issue: Firebase initialization error
**Solution**:
1. Check `google-services.json` is in `android/app/`
2. Verify package name matches: `com.admingloves.sspr`
3. Run `flutter clean && flutter pub get`

### Issue: "Company not found"
**Solution**:
1. Check Firestore has document `admingloves1`
2. Verify document has `url` field
3. Check Firebase console for any errors

### Issue: WebView not working on web
**Solution**:
- This is expected - WebView only works on mobile
- Test on Android/iOS device for full functionality

---

## 📱 Best Testing Approach

**For Full Testing:**
1. Use Android device/emulator
2. Run: `flutter run`
3. Test complete flow:
   - Company input → Firebase lookup → WebView display

**For Quick UI Testing:**
1. Use Chrome (web)
2. Run: `flutter run -d chrome`
3. Test UI and Firebase connection
4. Note: WebView won't work

---

## 🎯 Quick Test Commands

```bash
# Test on Android
flutter run

# Test on Chrome
flutter run -d chrome

# Clean and rebuild
flutter clean && flutter pub get && flutter run

# Check devices
flutter devices
```

---

## ✅ Success Indicators

**If everything works, you should see:**
1. App opens → Shows "Enter Company Name"
2. Enter `admingloves1` → Click Continue
3. Shows loading → Fetches from Firebase
4. Navigates to WebView → Displays your company URL

**If Firebase connects but WebView doesn't on web:**
- This is normal! WebView is mobile-only
- Switch to Android testing for full functionality

