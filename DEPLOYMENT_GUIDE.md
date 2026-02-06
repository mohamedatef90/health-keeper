# 🚀 health-keeper - Deployment Guide

**Status:** Ready for Production  
**Last Updated:** 2026-02-06

---

## 📋 Pre-Deployment Checklist

### ✅ Code Preparation
```bash
cd C:\Users\Atef\Desktop\health-keeper

# 1. Clean everything
flutter clean

# 2. Get dependencies
flutter pub get

# 3. Generate Drift code (CRITICAL!)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Run tests
flutter test

# 5. Analyze code
flutter analyze
# Should return: "No issues found!"

# 6. Check formatting
flutter format lib/ --set-exit-if-changed
```

---

## 🔑 Environment Setup

### 1. Gemini API Key
**File:** `assets/.env`

```env
GEMINI_API_KEY=your_actual_api_key_here
```

**Get Key:** https://makersuite.google.com/app/apikey

⚠️ **IMPORTANT:** Do NOT commit `.env` to git!

Add to `.gitignore`:
```
assets/.env
*.env
```

---

### 2. iOS Configuration

#### Info.plist Updates
**File:** `ios/Runner/Info.plist`

Add HealthKit permissions:
```xml
<key>NSHealthShareUsageDescription</key>
<string>We need access to your health data to provide personalized coaching</string>
<key>NSHealthUpdateUsageDescription</key>
<string>We need to update your health data to track your progress</string>

<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>processing</string>
</array>
```

#### Xcode Capabilities
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner target
3. Go to "Signing & Capabilities"
4. Add:
   - ✅ HealthKit
   - ✅ Push Notifications
   - ✅ Background Modes

---

### 3. Notification Setup

**No additional config needed** - `flutter_local_notifications` works out of the box.

For push notifications (future):
- Add Firebase
- Configure APNs certificates

---

## 📱 Build Commands

### iOS (Development)
```bash
# Debug build (for testing)
flutter build ios --debug

# Release build (for TestFlight/App Store)
flutter build ios --release
```

**Output:** `build/ios/iphoneos/Runner.app`

---

### iOS (Archive for App Store)
1. Open Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```

2. Select "Any iOS Device" as target

3. Product → Archive

4. Upload to App Store Connect

---

## 🧪 Testing on Device

### iOS Real Device (Recommended)
```bash
# List devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Example:
flutter run -d 00008030-001234567890000A
```

⚠️ **Note:** HealthKit requires real device (doesn't work on simulator)

---

## 🔐 Security Checklist

### Before Deployment:
- [ ] `.env` file NOT in git
- [ ] API keys NOT hardcoded in code
- [ ] Sensitive data encrypted in database
- [ ] HTTPS only for API calls
- [ ] User data stays local (no cloud sync yet)

### Privacy:
- [ ] Privacy policy URL in App Store listing
- [ ] HealthKit data usage clearly explained
- [ ] User can delete all data
- [ ] No analytics without consent

---

## 📊 Performance Targets

### App Launch:
- [ ] Cold start: < 3 seconds
- [ ] Hot start: < 1 second

### Dashboard Load:
- [ ] Home screen: < 2 seconds
- [ ] Agent chat: < 1 second
- [ ] Charts render: < 500ms

### Agent Response:
- [ ] User message → AI response: < 5 seconds
- [ ] Voice command processing: < 2 seconds

### Memory:
- [ ] RAM usage: < 200 MB
- [ ] No memory leaks (test with Instruments)

---

## 🐛 Known Issues & Workarounds

### Issue 1: HealthKit Permissions
**Problem:** User denies HealthKit permissions

**Workaround:**
- Show "Connect Health Banner" on home screen
- Provide deep link to iOS Settings
- App still functional without HealthKit (manual entry via voice commands)

---

### Issue 2: Gemini API Rate Limits
**Problem:** Too many requests in short time

**Workaround:**
- Implement request queuing
- Add retry logic with exponential backoff
- Cache recent responses (optional)

**Current Limits:**
- Free tier: 60 requests/minute
- Paid tier: Unlimited

---

### Issue 3: Drift Code Generation
**Problem:** `database.g.dart` not found after clean

**Solution:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Always run this after:
- `flutter clean`
- Pulling new code from git
- Changing database schema

---

## 📦 App Store Submission

### App Information:
- **Name:** Health Keeper
- **Subtitle:** AI-Powered Health Companion
- **Category:** Health & Fitness
- **Age Rating:** 12+ (health content)

### Description:
```
Health Keeper is your intelligent health companion with 4 specialized AI coaches:

🏋️ Fitness Agent - Personalized workout plans
🍽️ Nutrition Agent - Meal planning & tracking  
🩺 Health Agent - Medication & sleep tracking
🤖 General Agent - Weekly plans & summaries

Features:
✓ Apple Health integration
✓ Voice command logging
✓ Proactive health tips
✓ Protocol-based reminders
✓ Weight & HRV tracking
✓ Progress photos

Perfect for anyone tracking Mounjaro, managing weight, or optimizing fitness.
```

### Keywords:
```
health, fitness, nutrition, AI coach, weight loss, Mounjaro, HRV, Apple Health, workout planner, meal tracker
```

### Screenshots Needed:
1. Home screen (daily summary)
2. Agent chat (showing agent badge)
3. Weight trend chart
4. Protocol settings
5. Voice command widget

---

## 🔄 Post-Launch Updates

### Week 1:
- [ ] Monitor crash reports (Firebase Crashlytics)
- [ ] Check API usage (Gemini dashboard)
- [ ] Review user feedback
- [ ] Fix critical bugs

### Month 1:
- [ ] Add requested features
- [ ] Optimize performance
- [ ] Improve AI responses based on feedback
- [ ] Add more protocol templates

---

## 📈 Analytics (Optional)

### Recommended Events:
- `app_open`
- `voice_command_used` (command type)
- `agent_message_sent` (agent type)
- `protocol_rule_created`
- `health_data_synced`
- `notification_received`

### Tools:
- Firebase Analytics (free, comprehensive)
- Mixpanel (advanced cohort analysis)
- Amplitude (user behavior tracking)

---

## 🆘 Support & Troubleshooting

### Common User Issues:

**Q: "Voice commands not working"**
A: Check database permissions, ensure AgentSync ran successfully

**Q: "No health data showing"**
A: Grant HealthKit permissions in iOS Settings → Privacy → Health

**Q: "Agents giving generic responses"**
A: Ensure daily sync ran (check sync status on home screen), tap to sync manually

**Q: "Mounjaro reminder not appearing"**
A: Check protocol settings, ensure rule is active, verify notification permissions

---

## 🎯 Success Metrics

### Technical:
- ✅ 0 crashes per session
- ✅ < 3s app launch time
- ✅ > 95% API success rate
- ✅ < 200 MB RAM usage

### User Engagement:
- ✅ Daily active users > 60%
- ✅ Voice commands used > 3x/day
- ✅ Agent chat opened > 2x/week
- ✅ Protocol adherence > 80%

### Business:
- ✅ App Store rating > 4.5 ⭐
- ✅ Retention (Day 7) > 70%
- ✅ Retention (Day 30) > 50%

---

## 🚀 Launch Day Checklist

### T-1 Day:
- [ ] Final build tested on real devices
- [ ] All team members have TestFlight access
- [ ] App Store listing complete
- [ ] Screenshots uploaded
- [ ] Privacy policy live
- [ ] Support email configured

### T-0 (Launch):
- [ ] Submit for App Store review
- [ ] Monitor review status
- [ ] Prepare social media posts
- [ ] Draft press release (optional)

### T+1 Day:
- [ ] Check for crash reports
- [ ] Monitor user reviews
- [ ] Respond to support emails
- [ ] Track download numbers

---

## 📞 Emergency Contacts

### Critical Issues:
- Gemini API down → Check Google Cloud Status
- HealthKit not syncing → Check iOS system status
- App crash on launch → Check Firebase Crashlytics

### Rollback Plan:
If critical bug found post-launch:
1. Submit expedited review with fix
2. Meanwhile, communicate with users via in-app message
3. If server-side issue, deploy fix immediately

---

## 🎉 You're Ready!

This app is **production-ready** and will genuinely help users achieve their health goals.

**Good luck with the launch! 🚀**

---

**Questions?** Review `FINAL_IMPLEMENTATION_REPORT.md` for technical details.
