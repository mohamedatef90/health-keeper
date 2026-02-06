@echo off
echo.
echo 🔍 Verifying health-keeper files...
echo.

set errors=0

echo 📁 Core Files:
if exist "lib\main.dart" (echo   ✅ lib\main.dart) else (echo   ❌ MISSING: lib\main.dart & set /a errors+=1)
if exist "lib\app\router.dart" (echo   ✅ lib\app\router.dart) else (echo   ❌ MISSING: lib\app\router.dart & set /a errors+=1)
if exist "lib\core\providers\providers.dart" (echo   ✅ lib\core\providers\providers.dart) else (echo   ❌ MISSING: lib\core\providers\providers.dart & set /a errors+=1)
if exist "pubspec.yaml" (echo   ✅ pubspec.yaml) else (echo   ❌ MISSING: pubspec.yaml & set /a errors+=1)
echo.

echo 🤖 Agent Files:
if exist "lib\core\services\agent_sync_service.dart" (echo   ✅ agent_sync_service.dart) else (echo   ❌ MISSING & set /a errors+=1)
if exist "lib\core\services\agent_chat_adapter.dart" (echo   ✅ agent_chat_adapter.dart) else (echo   ❌ MISSING & set /a errors+=1)
if exist "lib\features\coach_chat\presentation\modern_agent_chat_screen.dart" (echo   ✅ modern_agent_chat_screen.dart) else (echo   ❌ MISSING & set /a errors+=1)
if exist "lib\features\home\presentation\widgets\daily_summary_card.dart" (echo   ✅ daily_summary_card.dart) else (echo   ❌ MISSING & set /a errors+=1)
if exist "lib\features\home\presentation\widgets\voice_command_widget.dart" (echo   ✅ voice_command_widget.dart) else (echo   ❌ MISSING & set /a errors+=1)
if exist "lib\features\home\presentation\widgets\agent_suggestions_widget.dart" (echo   ✅ agent_suggestions_widget.dart) else (echo   ❌ MISSING & set /a errors+=1)
echo.

echo 🔐 Environment:
if exist "assets\.env" (echo   ✅ assets\.env exists) else (echo   ❌ MISSING: assets\.env & set /a errors+=1)
echo.

echo 📄 Documentation:
if exist "FINAL_IMPLEMENTATION_REPORT.md" (echo   ✅ FINAL_IMPLEMENTATION_REPORT.md) else (echo   ⚠️  Missing)
if exist "DEPLOYMENT_GUIDE.md" (echo   ✅ DEPLOYMENT_GUIDE.md) else (echo   ⚠️  Missing)
if exist "PRE_TRANSFER_CHECKLIST.md" (echo   ✅ PRE_TRANSFER_CHECKLIST.md) else (echo   ⚠️  Missing)
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
if %errors%==0 (
    echo ✅ All checks passed! Ready to transfer to Mac.
    echo.
    echo 📋 Next Steps:
    echo   1. Run: flutter clean
    echo   2. Transfer folder to Mac
    echo   3. Follow PRE_TRANSFER_CHECKLIST.md
) else (
    echo ❌ Found %errors% errors! Fix before transferring.
)
echo.
pause
