# 📱 Transfer to Mac - Quick Guide

**Goal:** Test health-keeper on iPhone

---

## ✅ Pre-Transfer (On Windows - Do Now)

### Step 1: Add Gemini API Key
**File:** `assets/.env`

```env
GEMINI_API_KEY=your_actual_api_key_here
```

⚠️ **Get API key from:** https://makersuite.google.com/app/apikey

---

### Step 2: Clean Project
```bash
cd C:\Users\Atef\Desktop\health-keeper
flutter clean
```

This removes:
- `.dart_tool/`
- `build/`
- `ios/Pods/`

(Will regenerate on Mac)

---

### Step 3: Transfer to Mac

**Option A: Git (Recommended)**
```bash
git add .
git commit -m "Ready for iPhone testing"
git push
```

**Option B: USB/AirDrop**
- Zip folder: `health-keeper.zip`
- Transfer via USB or AirDrop

**Option C: Cloud**
- Upload to OneDrive/Dropbox
- Download on Mac

---

## 🍎 On Mac (After Transfer)

### Step 1: Install Dependencies
```bash
cd ~/path/to/health-keeper

# Flutter dependencies
flutter pub get

# iOS dependencies
cd ios
pod install --repo-update
cd ..
```

**If pod install fails:**
```bash
sudo gem install cocoapods
pod setup
```

---

### Step 2: Generate Drift Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Expected:** `lib/core/data/database/database.g.dart` created (~2 MB)

---

### Step 3: Configure Xcode

```bash
# Open Xcode workspace
open ios/Runner.xcworkspace
```

#### A. Select Team
1. Click "Runner" in left panel
2. Go to "Signing & Capabilities"
3. Select your Team (Apple ID)

#### B. Add Capabilities
Click "+ Capability" → Add:
- ✅ HealthKit
- ✅ Push Notifications  
- ✅ Background Modes
  - Check "Background fetch"
  - Check "Background processing"

#### C. Update Info.plist
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

### Step 4: Connect iPhone & Run

```bash
# Connect iPhone via USB

# Verify device detected
flutter devices

# Run on device (Release mode)
flutter run --release
```

**OR** in Xcode:
1. Select your iPhone in device dropdown
2. Press ⌘R (Run)

---

## 🧪 Quick Test Checklist

### First Launch:
- [ ] App opens without crash ✅
- [ ] HealthKit permission prompt ✅
- [ ] Notification permission prompt ✅
- [ ] Console: "Protocol seeded successfully!" ✅

### Home Screen:
- [ ] Daily Summary Card visible ✅
- [ ] Voice Command Widget ✅
- [ ] No layout errors ✅

### Voice Command Test:
1. Tap Voice Command input
2. Type: `وزني 75.3`
3. Tap send
4. Should see: "✅ تمام! سجلت وزنك: 75.3 كيلو"

### Agent Chat Test:
1. Tap "Chat" button
2. Type: `مرحبا`
3. Wait 3-5 seconds
4. Should see: Agent response with badge (🤖)

### Protocol Test:
1. Tap "Protocol" button
2. Should see:
   - 💉 Mounjaro (Mon/Wed/Fri)
   - ⚽ Football (Monday)
   - 🍽️ Eating Window (11AM-8PM)

### HealthKit Test:
1. Grant HealthKit permissions
2. Tap sync status indicator
3. Wait 3-5 seconds
4. Should see stats appear (weight, sleep, etc.)

---

## 🐛 Common Issues

### Issue: Pod Install Fails
```bash
sudo gem install cocoapods
pod setup
cd ios
pod install --repo-update
```

### Issue: Code Signing Error
1. Xcode → Runner → Signing & Capabilities
2. Select your Team
3. If no team: Xcode → Preferences → Accounts → Add Apple ID

### Issue: Build Fails
```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --release
```

### Issue: HealthKit Not Working
- HealthKit requires **real device** (not simulator)
- Check Info.plist has usage descriptions
- Check capability enabled in Xcode

### Issue: Empty Agent Responses
- Check `assets/.env` has valid `GEMINI_API_KEY`
- Verify internet connection
- Check Console for API errors

---

## 📸 Take Screenshots (For Testing)

1. Home Screen (daily summary visible)
2. Voice Command (success message)
3. Agent Chat (with agent badge)
4. Protocol Settings (all rules)
5. Weight Chart (if data exists)

---

## ✅ Success = All Green Checkboxes!

If all tests pass:
- ✅ App is working on iPhone
- ✅ Ready for further development
- ✅ Ready for TestFlight (optional)

If issues found:
- Check Console logs in Xcode
- Review `PRE_TRANSFER_CHECKLIST.md`
- Check `DEPLOYMENT_GUIDE.md`

---

## 📞 Need Help?

**Documentation:**
- `FINAL_IMPLEMENTATION_REPORT.md` - Full technical details
- `DEPLOYMENT_GUIDE.md` - Complete deployment guide
- `PRE_TRANSFER_CHECKLIST.md` - Detailed checklist

**Xcode Logs:**
- View → Debug Area → Console
- Look for red error messages

---

## 🎉 You're Ready!

Follow these steps and health-keeper will run on your iPhone.

**Good luck! 📱**

---

*Quick reference: 2026-02-06*
