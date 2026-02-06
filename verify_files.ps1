# File Verification Script for health-keeper
# Run this before transferring to Mac

Write-Host "🔍 Verifying health-keeper files..." -ForegroundColor Cyan
Write-Host ""

$errors = 0
$warnings = 0

# Core files
$coreFiles = @(
    "lib/main.dart",
    "lib/app/router.dart",
    "lib/core/providers/providers.dart",
    "lib/core/data/database/database.dart",
    "pubspec.yaml"
)

Write-Host "📁 Core Files:" -ForegroundColor Yellow
foreach ($file in $coreFiles) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "  ❌ MISSING: $file" -ForegroundColor Red
        $errors++
    }
}
Write-Host ""

# Agent system files (Phase A-C)
$agentFiles = @(
    "lib/core/services/agent_sync_service.dart",
    "lib/core/services/agent_chat_adapter.dart",
    "lib/core/services/protocol_notification_service.dart",
    "lib/features/coach_chat/data/repositories/agent_coach_chat_notifier.dart",
    "lib/features/coach_chat/presentation/modern_agent_chat_screen.dart",
    "lib/features/settings/presentation/screens/protocol_settings_screen.dart",
    "lib/features/home/presentation/widgets/daily_summary_card.dart",
    "lib/features/home/presentation/widgets/voice_command_widget.dart",
    "lib/features/home/presentation/widgets/agent_suggestions_widget.dart",
    "lib/features/home/presentation/widgets/weight_trend_chart.dart",
    "lib/features/home/presentation/widgets/photo_progress_card.dart"
)

Write-Host "🤖 Agent System Files (11):" -ForegroundColor Yellow
foreach ($file in $agentFiles) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "  ❌ MISSING: $file" -ForegroundColor Red
        $errors++
    }
}
Write-Host ""

# Check .env file
Write-Host "🔐 Environment:" -ForegroundColor Yellow
if (Test-Path "assets/.env") {
    Write-Host "  ✅ assets/.env exists" -ForegroundColor Green
    
    # Check if it has API key
    $envContent = Get-Content "assets/.env" -Raw
    if ($envContent -match "GEMINI_API_KEY=.+") {
        Write-Host "  ✅ GEMINI_API_KEY found" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  WARNING: GEMINI_API_KEY might be missing or empty" -ForegroundColor Yellow
        $warnings++
    }
} else {
    Write-Host "  ❌ MISSING: assets/.env" -ForegroundColor Red
    Write-Host "     Create it with: GEMINI_API_KEY=your_key" -ForegroundColor Red
    $errors++
}
Write-Host ""

# Documentation
$docs = @(
    "FINAL_IMPLEMENTATION_REPORT.md",
    "DEPLOYMENT_GUIDE.md",
    "PRE_TRANSFER_CHECKLIST.md"
)

Write-Host "📄 Documentation:" -ForegroundColor Yellow
foreach ($doc in $docs) {
    if (Test-Path $doc) {
        Write-Host "  ✅ $doc" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Missing: $doc" -ForegroundColor Yellow
        $warnings++
    }
}
Write-Host ""

# Check for generated files (should NOT exist before transfer)
Write-Host "🧹 Checking for files to clean:" -ForegroundColor Yellow
$shouldNotExist = @(
    "lib/core/data/database/database.g.dart",
    ".dart_tool",
    "build",
    "ios/Pods"
)

$needsClean = $false
foreach ($item in $shouldNotExist) {
    if (Test-Path $item) {
        Write-Host "  ⚠️  Found: $item (will regenerate on Mac)" -ForegroundColor Yellow
        $needsClean = $true
    }
}

if ($needsClean) {
    Write-Host ""
    Write-Host "  ℹ️  Run 'flutter clean' before transfer" -ForegroundColor Cyan
}
Write-Host ""

# Summary
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "📊 Summary:" -ForegroundColor Cyan
Write-Host "  Errors:   $errors" -ForegroundColor $(if ($errors -eq 0) { "Green" } else { "Red" })
Write-Host "  Warnings: $warnings" -ForegroundColor $(if ($warnings -eq 0) { "Green" } else { "Yellow" })
Write-Host ""

if ($errors -eq 0 -and $warnings -eq 0) {
    Write-Host "✅ All checks passed! Ready to transfer to Mac." -ForegroundColor Green
} elseif ($errors -eq 0) {
    Write-Host "⚠️  Ready to transfer, but check warnings above." -ForegroundColor Yellow
} else {
    Write-Host "❌ Fix errors before transferring!" -ForegroundColor Red
}
Write-Host ""

# Next steps
if ($errors -eq 0) {
    Write-Host "📋 Next Steps:" -ForegroundColor Cyan
    Write-Host "  1. Run: flutter clean" -ForegroundColor White
    Write-Host "  2. Transfer folder to Mac" -ForegroundColor White
    Write-Host "  3. On Mac: flutter pub get" -ForegroundColor White
    Write-Host "  4. On Mac: cd ios && pod install" -ForegroundColor White
    Write-Host "  5. On Mac: flutter pub run build_runner build" -ForegroundColor White
    Write-Host "  6. On Mac: flutter run --release" -ForegroundColor White
    Write-Host ""
    Write-Host "📖 Full guide: PRE_TRANSFER_CHECKLIST.md" -ForegroundColor Cyan
}

Write-Host ""
