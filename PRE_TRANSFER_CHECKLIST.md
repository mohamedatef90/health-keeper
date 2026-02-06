# ✅ Pre-Transfer Checklist - health-keeper

**Before transferring to Mac for iPhone testing**

---

## 📋 Files Verification

### Core Files (must exist):
- [ ] `lib/main.dart`
- [ ] `lib/app/router.dart`
- [ ] `lib/core/providers/providers.dart`
- [ ] `lib/core/data/database/database.dart`
- [ ] `pubspec.yaml`
- [ ] `assets/.env` (with GEMINI_API_KEY)

### Agent System Files (11 files):
- [ ] `lib/core/services/agent_sync_service.dart`
- [ ] `lib/core/services/agent_chat_adapter.dart`
- [ ] `lib/core/services/protocol_notification_service.dart`
- [ ] `lib/features/coach_chat/data/repositories/agent_coach_chat_notifier.dart`
- [ ] `lib/features/coach_chat/presentation/modern_agent_chat_screen.dart`
- [ ] `lib/features/settings/presentation/screens/protocol_settings_screen.dart`
- [ ] `lib/features/home/presentation/widgets/daily_summary_card.dart`
- [ ] `lib/features/home/presentation/widgets/voice_command_widget.dart`
- [ ] `lib/features/home/presentation/widgets/agent_suggestions_widget.dart`
- [ ] `lib/features/home/presentation/widgets/weight_trend_chart.dart`
- [ ] `lib/features/home/presentation/widgets/photo_progress_card.dart`

### Documentation:
- [ ] `FINAL_IMPLEMENTATION_REPORT.md`
- [ ] `DEPLOYMENT_GUIDE.md`
- [ ] `README.md` (if exists)

---

## 🔧 On Windows (Before Transfer)

### Step 1: Clean Everything
```bash
cd C:\Users\Atef\Desktop\health-keeper
flutter clean
```

### Step 2: Verify pubspec.yaml
Check these dependencies exist:
- `drift: ^2.22.1`
- `google_generative_ai: ^0.4.6`
- `fl_chart: ^0.69.0`
- `flutter_local_notifications: ^18.0.1`
- `health: ^11.1.0`

### Step 3: Delete Generated Files (will regenerate on Mac)
```bash
# Delete these (they'll be regenerated):
rm -rf .dart_tool
rm -rf build
rm -rf ios/Pods
rm -rf ios/.symlinks
rm -rf ios/Flutter/Flutter.framework
rm -rf ios/Flutter/Flutter.podspec

# Keep:
# - lib/ (all source code)
# - assets/ (including .env)
# - pubspec.yaml
# - ios/ (except Pods)
# - Documentation
```

### Step 4: Create .env File (if not exists)
**File:** `assets/.env`

```env
GEMINI_API_KEY=your_actual_key_here
```

⚠️ **IMPORTANT:** Replace `your_actual_key_here` with real API key!

Get from: https://makersuite.google.com/app/apikey

### Step 5: Verify .gitignore
Ensure these are in `.gitignore`:
```
# Generated
.dart_tool/
build/
*.g.dart

# Environment
assets/.env
*.env

# iOS
ios/Pods/
ios/.symlinks/
ios/Flutter/
```

---

## 💾 Transfer to Mac

### Method 1: Git (Recommended)
```bash
# On Windows:
cd C:\Users\Atef\Desktop\health-keeper
git add .
git commit -m "feat: Complete implementation (90%)"
git push

# On Mac:
git clone <repository-url>
cd health-keeper
```

### Method 2: USB/AirDrop
1. Zip the folder (excluding build/, .dart_tool/, ios/Pods/)
2. Transfer to Mac
3. Unzip

### Method 3: Cloud (OneDrive/Dropbox)
1. Upload to cloud
2. Download on Mac

---

## 🍎 On Mac (After Transfer)

### Step 1: Verify Flutter Installation
```bash
flutter doctor -v
```

**Expected:**
- ✅ Flutter (Channel stable, 3.x or higher)
- ✅ Xcode (14.x or higher)
- ✅ iOS toolchain
- ✅ CocoaPods installed

If CocoaPods missing:
```bash
sudo gem install cocoapods
```

---

### Step 2: Get Dependencies
```bash
cd ~/path/to/health-keeper

# 1. Flutter dependencies
flutter pub get

# 2. iOS dependencies
cd ios
pod install --repo-update
cd ..
```

---

### Step 3: Generate Drift Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Expected Output:**
```
[INFO] Running build...
[INFO] Generating SDK summary...
[INFO] Succeeded after XXs with XXX outputs
```

**Verify:** `lib/core/data/database/database.g.dart` should exist (~2 MB)

---

### Step 4: Configure iOS

#### A. Open Xcode
```bash
open ios/Runner.xcworkspace
```

#### B. Select Development Team
1. Click on "Runner" in left sidebar
2. Go to "Signing & Capabilities"
3. Select your Team (Apple ID)

#### C. Add Capabilities
Click "+ Capability" and add:
- ✅ HealthKit
- ✅ Push Notifications
- ✅ Background Modes

#### D. Update Info.plist
File: `ios/Runner/Info.plist`

Add before `</dict>`:
```xml
<key>NSHealthShareUsageDescription</key>
<string>We need access to your health data to provide personalized coaching</string>
<key>NSHealthUpdateUsageDescription</key>
<string>We need to update your health data to track progress</string>

<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>processing</string>
</array>
```

---

### Step 5: Connect iPhone

1. Connect iPhone via USB
2. Trust computer on iPhone
3. Verify device:
```bash
flutter devices
```

**Expected:**
```
iPhone (mobile) • 00008030-XXXX • ios • iOS 17.x
```

---

### Step 6: Run on Device
```bash
flutter run --release
```

**OR** in Xcode:
1. Select your iPhone as target
2. Product → Run (⌘R)

---

## 🧪 Testing Checklist (On iPhone)

### First Launch:
- [ ] App opens without crash
- [ ] Console shows: "🌱 First launch detected - seeding protocol..."
- [ ] Console shows: "✅ Protocol seeded successfully!"
- [ ] HealthKit permission prompt appears
- [ ] Notification permission prompt appears

### Home Screen:
- [ ] Daily Summary Card visible
- [ ] Greeting shows (صباح الخير / مساء الخير)
- [ ] Sync status indicator present
- [ ] Voice Command Widget visible
- [ ] Agent Suggestions may appear (if triggers met)
- [ ] Weight Trend Chart (if data exists)
- [ ] Photo Progress Card visible
- [ ] No layout overflow errors

### Voice Commands:
- [ ] Tap Voice Command input
- [ ] Type "وزني 75.3"
- [ ] Tap send
- [ ] Success message appears
- [ ] Message auto-hides after 3s

### Agent Chat:
- [ ] Tap "Chat" button on Daily Summary
- [ ] Chat screen opens
- [ ] Modern UI with glassmorphism
- [ ] Type "مرحبا"
- [ ] Agent responds (may take 3-5s)
- [ ] Agent badge shows (🤖 General Assistant)
- [ ] Quick replies appear at bottom
- [ ] Tap quick reply → sends message

### Protocol Settings:
- [ ] Tap "Protocol" button on Daily Summary
- [ ] Protocol Settings screen opens
- [ ] Rules grouped by category (💉🍽️⚽)
- [ ] Mounjaro rule visible (Mon/Wed/Fri @ 9AM)
- [ ] Football rule visible (Monday @ 6PM)
- [ ] Eating Window rule visible (11AM-8PM)
- [ ] Active/Inactive badges correct

### Weight Chart:
- [ ] Weight Trend Chart displays (if 2+ data points)
- [ ] Line chart renders smoothly
- [ ] Trend indicator shows (↑/↓)
- [ ] No render errors

### HealthKit Integration:
- [ ] Grant HealthKit permissions
- [ ] Go to iOS Settings → Health → Apps → Health Keeper
- [ ] Verify permissions granted
- [ ] Return to app
- [ ] Tap sync status → should sync
- [ ] Wait 3-5 seconds
- [ ] Sync status changes to green (Synced)
- [ ] Stats appear on Daily Summary (weight, sleep, HRV, steps)

---

## 🐛 Common Issues & Fixes

### Issue 1: Pod Install Fails
**Error:** `CocoaPods not installed`

**Fix:**
```bash
sudo gem install cocoapods
cd ios
pod install --repo-update
```

---

### Issue 2: Code Signing Error
**Error:** `No signing certificate found`

**Fix:**
1. Open Xcode
2. Runner → Signing & Capabilities
3. Select your Team
4. If no team, add Apple ID in Xcode Preferences

---

### Issue 3: HealthKit Not Working
**Error:** No health data showing

**Fix:**
1. HealthKit requires **real device** (not simulator)
2. Check Info.plist has usage descriptions
3. Check HealthKit capability enabled in Xcode
4. Grant permissions in iOS Settings → Health

---

### Issue 4: Drift Errors
**Error:** `database.g.dart not found`

**Fix:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

### Issue 5: Gemini API Not Working
**Error:** Empty/error responses from agents

**Fix:**
1. Verify `assets/.env` has `GEMINI_API_KEY=...`
2. Check API key is valid
3. Test API key at: https://makersuite.google.com/app/apikey
4. Ensure internet connection active

---

## 📊 Performance Targets (iPhone)

### App Launch:
- [ ] Cold start: < 3 seconds
- [ ] Hot start: < 1 second

### UI Performance:
- [ ] Home screen loads: < 2 seconds
- [ ] Chat opens: < 1 second
- [ ] Scroll at 60 FPS (smooth)

### Agent Response:
- [ ] User message → AI response: < 5 seconds
- [ ] Voice command: < 2 seconds

---

## 📸 Screenshots to Take (For Testing)

1. **Home Screen** - Daily summary visible
2. **Voice Command** - Success message showing
3. **Agent Chat** - Showing agent badge
4. **Protocol Settings** - All rules visible
5. **Weight Chart** - If data exists
6. **HealthKit Permissions** - Granted successfully

---

## ✅ Success Criteria

### Minimal (Must Work):
- [x] App opens without crash
- [x] Protocol seeds on first launch
- [x] Voice commands work
- [x] Agent chat responds
- [x] No Drift errors
- [x] No layout errors

### Ideal (Should Work):
- [x] HealthKit data syncs
- [x] Stats show on dashboard
- [x] Agent suggestions appear
- [x] Weight chart displays
- [x] Notifications setup (can verify later)

---

## 🚨 Emergency Rollback

If critical issues found:

1. **Check Console Logs:**
   - In Xcode: View → Debug Area → Console
   - Look for errors in red

2. **Common Fixes:**
   - Drift errors → re-run build_runner
   - UI errors → check imports
   - Data errors → check .env file

3. **Full Reset:**
```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --release
```

---

## 📞 Support

**Issues?** Check:
1. `FINAL_IMPLEMENTATION_REPORT.md` - Technical details
2. `DEPLOYMENT_GUIDE.md` - Full deployment guide
3. Console logs in Xcode - Error messages

---

## 🎉 You're Ready!

Once all checkboxes ✅:
- App is verified working on iPhone
- Ready for further testing
- Ready for TestFlight (optional)
- Ready for App Store (when polished)

**Good luck with testing! 📱**

---

*Created: 2026-02-06 03:30 PM PST*
