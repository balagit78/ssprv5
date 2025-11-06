# Theme Color & App Bar Color Guide

## 🎨 Where to Change Colors

### 1. **Main Theme Colors** (Global App Colors)

**File**: `lib/flutter_flow/flutter_flow_theme.dart`

#### Light Mode Colors (Lines 145-160)
```dart
class LightModeTheme extends FlutterFlowTheme {
  late Color primary = const Color(0xFF4B39EF);        // ← Main theme color (App bars, buttons)
  late Color secondary = const Color(0xFF39D2C0);     // ← Secondary color
  late Color tertiary = const Color(0xFFEE8B60);      // ← Tertiary color
  late Color primaryText = const Color(0xFF14181B);   // ← Text color
  late Color secondaryText = const Color(0xFF57636C); // ← Secondary text
  late Color primaryBackground = const Color(0xFFF1F4F8); // ← Background color
  late Color secondaryBackground = const Color(0xFFFFFFFF); // ← Card backgrounds
  // ... other colors
}
```

#### Dark Mode Colors (Lines 331-346)
```dart
class DarkModeTheme extends FlutterFlowTheme {
  late Color primary = const Color(0xFF4B39EF);        // ← Same structure
  // ... dark mode colors
}
```

**To Change**: Edit the hex color values (e.g., `0xFF4B39EF` = Purple)

---

### 2. **App Bar Colors** (Specific Pages)

#### WebView Page App Bar
**File**: `lib/pages/webview_page/webview_page_widget.dart`  
**Line**: 74

```dart
appBar: AppBar(
  backgroundColor: FlutterFlowTheme.of(context).primary,  // ← Uses theme primary color
  // ...
)
```

**To Change**:
- **Option 1**: Change globally by editing `primary` color in `flutter_flow_theme.dart`
- **Option 2**: Change only this AppBar by replacing with a specific color:
  ```dart
  backgroundColor: Colors.blue,  // Or any color like Color(0xFF123456)
  ```

#### Company Input Page (No App Bar)
- Currently has no AppBar, just background

---

## 🎨 Quick Color Change Examples

### Example 1: Change App Bar to Blue
**File**: `lib/flutter_flow/flutter_flow_theme.dart`  
**Line**: 145 (Light Mode) or 331 (Dark Mode)

```dart
// Change from purple to blue
late Color primary = const Color(0xFF2196F3);  // Blue
```

### Example 2: Change App Bar to Custom Color (e.g., Red)
**File**: `lib/pages/webview_page/webview_page_widget.dart`  
**Line**: 74

```dart
appBar: AppBar(
  backgroundColor: Colors.red,  // Direct color
  // OR
  backgroundColor: const Color(0xFFE53935),  // Custom hex
  // ...
)
```

### Example 3: Change Background Color
**File**: `lib/flutter_flow/flutter_flow_theme.dart`  
**Line**: 151 (Light) or 337 (Dark)

```dart
late Color primaryBackground = const Color(0xFFF5F5F5);  // Light gray
```

---

## 📋 Color Reference

### Current Colors:
- **Primary** (App Bars): `#4B39EF` (Purple)
- **Secondary**: `#39D2C0` (Teal)
- **Tertiary**: `#EE8B60` (Orange)
- **Background**: `#F1F4F8` (Light gray)
- **Text**: `#14181B` (Dark gray)

### Common Color Codes:
```dart
Colors.blue          // #2196F3
Colors.green         // #4CAF50
Colors.red           // #F44336
Colors.orange        // #FF9800
Colors.purple        // #9C27B0
Colors.teal          // #009688
Colors.indigo        // #3F51B5
Colors.cyan          // #00BCD4
```

### Custom Hex Colors:
```dart
Color(0xFF123456)    // Format: 0xFF + 6 hex digits
Color(0xFF000000)    // Black
Color(0xFFFFFFFF)    // White
```

---

## 🔧 Step-by-Step: Change App Bar Color

### Method 1: Change Globally (Recommended)
1. Open: `lib/flutter_flow/flutter_flow_theme.dart`
2. Find line 145 (Light Mode) or 331 (Dark Mode)
3. Change: `late Color primary = const Color(0xFF4B39EF);`
4. Replace with your color: `late Color primary = const Color(0xFF2196F3);`
5. Save and rebuild

**Result**: All AppBars using `primary` will change

### Method 2: Change Single AppBar
1. Open: `lib/pages/webview_page/webview_page_widget.dart`
2. Find line 74: `backgroundColor: FlutterFlowTheme.of(context).primary,`
3. Replace with: `backgroundColor: Colors.blue,` (or any color)
4. Save and rebuild

**Result**: Only WebView AppBar changes

---

## 🎯 Where Each Color is Used

| Color Variable | Used For |
|----------------|----------|
| `primary` | App bars, buttons, primary actions |
| `secondary` | Secondary buttons, accents |
| `tertiary` | Tertiary elements |
| `primaryText` | Main text color |
| `secondaryText` | Secondary text, hints |
| `primaryBackground` | Page backgrounds |
| `secondaryBackground` | Cards, containers |
| `error` | Error messages, validation |
| `success` | Success indicators |
| `warning` | Warning messages |

---

## 💡 Tips

1. **Use Theme Colors**: Always use `FlutterFlowTheme.of(context).primary` instead of hardcoded colors for consistency
2. **Test Both Themes**: Check light and dark mode when changing colors
3. **Contrast**: Ensure text is readable on background colors
4. **Brand Colors**: Match your company brand colors

---

## 📝 Quick Reference Locations

```
lib/flutter_flow/flutter_flow_theme.dart
├── Line 145: Light Mode Primary Color
├── Line 151: Light Mode Background
├── Line 331: Dark Mode Primary Color
└── Line 337: Dark Mode Background

lib/pages/webview_page/webview_page_widget.dart
└── Line 74: WebView AppBar Color

lib/pages/company_input_page/company_input_page_widget.dart
└── Line 100: Company Input Background
```

---

## 🎨 Example: Change to Blue Theme

**Step 1**: Edit `lib/flutter_flow/flutter_flow_theme.dart`

**Light Mode** (Line 145):
```dart
late Color primary = const Color(0xFF2196F3);  // Blue
```

**Dark Mode** (Line 331):
```dart
late Color primary = const Color(0xFF1976D2);  // Darker blue
```

**Step 2**: Rebuild app
```bash
flutter run
```

**Result**: All app bars and primary elements turn blue!

