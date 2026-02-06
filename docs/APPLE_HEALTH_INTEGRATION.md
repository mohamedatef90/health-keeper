# Apple Health Integration - Full Data Types

## Overview
health-keeper يقرأ **كل** البيانات المتاحة من Apple Health كمصدر وحيد للبيانات.

## Data Categories & Types

### 1️⃣ Body Measurements (قياسات الجسم)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| الوزن | `HKQuantityTypeIdentifierBodyMass` | kg | 🔴 High |
| الطول | `HKQuantityTypeIdentifierHeight` | cm | 🟡 Medium |
| نسبة الدهون | `HKQuantityTypeIdentifierBodyFatPercentage` | % | 🔴 High |
| الكتلة العضلية | `HKQuantityTypeIdentifierLeanBodyMass` | kg | 🔴 High |
| BMI | `HKQuantityTypeIdentifierBodyMassIndex` | count | 🟡 Medium |
| محيط الخصر | `HKQuantityTypeIdentifierWaistCircumference` | cm | 🟢 Low |

### 2️⃣ Activity & Fitness (النشاط والتمارين)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| الخطوات | `HKQuantityTypeIdentifierStepCount` | count | 🔴 High |
| المسافة | `HKQuantityTypeIdentifierDistanceWalkingRunning` | km | 🟡 Medium |
| السعرات المحروقة (نشطة) | `HKQuantityTypeIdentifierActiveEnergyBurned` | kcal | 🔴 High |
| السعرات الكلية | `HKQuantityTypeIdentifierBasalEnergyBurned` | kcal | 🟡 Medium |
| دقائق التمرين | `HKQuantityTypeIdentifierAppleExerciseTime` | min | 🔴 High |
| دقائق الوقوف | `HKQuantityTypeIdentifierAppleStandTime` | min | 🟢 Low |
| الطوابق | `HKQuantityTypeIdentifierFlightsClimbed` | count | 🟢 Low |
| التمارين | `HKWorkoutTypeIdentifier` | - | 🔴 High |

### 3️⃣ Heart Health (صحة القلب)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| معدل القلب | `HKQuantityTypeIdentifierHeartRate` | bpm | 🔴 High |
| HRV | `HKQuantityTypeIdentifierHeartRateVariabilitySDNN` | ms | 🔴 High |
| معدل القلب أثناء الراحة | `HKQuantityTypeIdentifierRestingHeartRate` | bpm | 🔴 High |
| معدل القلب أثناء المشي | `HKQuantityTypeIdentifierWalkingHeartRateAverage` | bpm | 🟡 Medium |
| تعافي القلب | `HKQuantityTypeIdentifierHeartRateRecoveryOneMinute` | bpm | 🟡 Medium |
| ضغط الدم (انقباضي) | `HKQuantityTypeIdentifierBloodPressureSystolic` | mmHg | 🟡 Medium |
| ضغط الدم (انبساطي) | `HKQuantityTypeIdentifierBloodPressureDiastolic` | mmHg | 🟡 Medium |

### 4️⃣ Sleep (النوم)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| تحليل النوم | `HKCategoryTypeIdentifierSleepAnalysis` | - | 🔴 High |
| مدة النوم | Calculated from Sleep Analysis | hours | 🔴 High |
| جودة النوم | Derived from stages | score | 🔴 High |

### 5️⃣ Nutrition (التغذية)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| السعرات المستهلكة | `HKQuantityTypeIdentifierDietaryEnergyConsumed` | kcal | 🔴 High |
| البروتين | `HKQuantityTypeIdentifierDietaryProtein` | g | 🔴 High |
| الكربوهيدرات | `HKQuantityTypeIdentifierDietaryCarbohydrates` | g | 🔴 High |
| الدهون | `HKQuantityTypeIdentifierDietaryFatTotal` | g | 🔴 High |
| الألياف | `HKQuantityTypeIdentifierDietaryFiber` | g | 🟡 Medium |
| السكريات | `HKQuantityTypeIdentifierDietarySugar` | g | 🟡 Medium |
| الماء | `HKQuantityTypeIdentifierDietaryWater` | ml | 🔴 High |

### 6️⃣ Respiratory (الجهاز التنفسي)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| معدل التنفس | `HKQuantityTypeIdentifierRespiratoryRate` | breaths/min | 🟡 Medium |
| نسبة الأكسجين | `HKQuantityTypeIdentifierOxygenSaturation` | % | 🟡 Medium |
| VO2 Max | `HKQuantityTypeIdentifierVO2Max` | ml/kg/min | 🟡 Medium |

### 7️⃣ Mindfulness & Recovery (الذهن والتعافي)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| دقائق الذهن | `HKCategoryTypeIdentifierMindfulSession` | min | 🟢 Low |
| مستوى الإجهاد | Custom / Whoop integration | score | 🔴 High |
| Recovery Score | Custom / Whoop integration | score | 🔴 High |

### 8️⃣ Glucose & Medications (السكر والأدوية)
| Data Type | HealthKit Identifier | Unit | Priority |
|-----------|---------------------|------|----------|
| سكر الدم | `HKQuantityTypeIdentifierBloodGlucose` | mg/dL | 🟡 Medium |
| الأنسولين | Custom tracking | units | 🟡 Medium |
| Mounjaro | Custom protocol | dose | 🔴 High |

## Data Sync Strategy

### Real-time Sync
- الوزن، HRV، النوم (صباحاً)
- معدل القلب (continuous monitoring)
- التمارين (فور انتهائها)

### Batch Sync
- الخطوات، السعرات (كل ساعة)
- الطعام (عند إضافة وجبة)

### On-Demand
- الطول، BMI (نادراً)
- قياسات نادرة

## Permissions Required

```dart
final permissions = [
  // Body
  HealthDataType.WEIGHT,
  HealthDataType.HEIGHT,
  HealthDataType.BODY_FAT_PERCENTAGE,
  HealthDataType.LEAN_BODY_MASS,
  
  // Activity
  HealthDataType.STEPS,
  HealthDataType.ACTIVE_ENERGY_BURNED,
  HealthDataType.WORKOUT,
  
  // Heart
  HealthDataType.HEART_RATE,
  HealthDataType.HEART_RATE_VARIABILITY_SDNN,
  HealthDataType.RESTING_HEART_RATE,
  
  // Sleep
  HealthDataType.SLEEP_SESSION,
  HealthDataType.SLEEP_IN_BED,
  HealthDataType.SLEEP_ASLEEP,
  HealthDataType.SLEEP_AWAKE,
  HealthDataType.SLEEP_DEEP,
  HealthDataType.SLEEP_REM,
  
  // Nutrition
  HealthDataType.DIETARY_ENERGY_CONSUMED,
  HealthDataType.PROTEIN,
  HealthDataType.CARBS,
  HealthDataType.FAT_TOTAL,
  HealthDataType.WATER,
];
```

## Implementation Priority

**Phase 1: Core Metrics** (Week 1)
- ✅ الوزن، نسبة الدهون، الكتلة العضلية
- ✅ النوم (مدة، جودة، مراحل)
- ✅ HRV، معدل القلب
- ✅ السعرات، البروتين، الكربوهيدرات، الدهون

**Phase 2: Activity** (Week 2)
- الخطوات، السعرات المحروقة
- التمارين (نوع، مدة، شدة)
- دقائق النشاط

**Phase 3: Advanced Metrics** (Week 3+)
- VO2 Max
- معدلات التعافي
- ضغط الدم
- سكر الدم

## Notes
- كل البيانات تُخزن محلياً (SQLite encrypted)
- Apple Health = single source of truth
- Whoop, Smart Scale → Apple Health → health-keeper
- No direct integration with third-party APIs
