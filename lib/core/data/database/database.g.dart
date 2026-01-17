// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalsJsonMeta = const VerificationMeta(
    'goalsJson',
  );
  @override
  late final GeneratedColumn<String> goalsJson = GeneratedColumn<String>(
    'goals_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aiPreferencesJsonMeta = const VerificationMeta(
    'aiPreferencesJson',
  );
  @override
  late final GeneratedColumn<String> aiPreferencesJson =
      GeneratedColumn<String>(
        'ai_preferences_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _hasCompletedOnboardingMeta =
      const VerificationMeta('hasCompletedOnboarding');
  @override
  late final GeneratedColumn<bool> hasCompletedOnboarding =
      GeneratedColumn<bool>(
        'has_completed_onboarding',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_completed_onboarding" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _hasGrantedHealthKitPermissionMeta =
      const VerificationMeta('hasGrantedHealthKitPermission');
  @override
  late final GeneratedColumn<bool> hasGrantedHealthKitPermission =
      GeneratedColumn<bool>(
        'has_granted_health_kit_permission',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_granted_health_kit_permission" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _hasGrantedAiConsentMeta =
      const VerificationMeta('hasGrantedAiConsent');
  @override
  late final GeneratedColumn<bool> hasGrantedAiConsent = GeneratedColumn<bool>(
    'has_granted_ai_consent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_granted_ai_consent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hasGrantedPhotoConsentMeta =
      const VerificationMeta('hasGrantedPhotoConsent');
  @override
  late final GeneratedColumn<bool> hasGrantedPhotoConsent =
      GeneratedColumn<bool>(
        'has_granted_photo_consent',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_granted_photo_consent" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    height,
    age,
    gender,
    timezone,
    goalsJson,
    aiPreferencesJson,
    hasCompletedOnboarding,
    hasGrantedHealthKitPermission,
    hasGrantedAiConsent,
    hasGrantedPhotoConsent,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('goals_json')) {
      context.handle(
        _goalsJsonMeta,
        goalsJson.isAcceptableOrUnknown(data['goals_json']!, _goalsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_goalsJsonMeta);
    }
    if (data.containsKey('ai_preferences_json')) {
      context.handle(
        _aiPreferencesJsonMeta,
        aiPreferencesJson.isAcceptableOrUnknown(
          data['ai_preferences_json']!,
          _aiPreferencesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_aiPreferencesJsonMeta);
    }
    if (data.containsKey('has_completed_onboarding')) {
      context.handle(
        _hasCompletedOnboardingMeta,
        hasCompletedOnboarding.isAcceptableOrUnknown(
          data['has_completed_onboarding']!,
          _hasCompletedOnboardingMeta,
        ),
      );
    }
    if (data.containsKey('has_granted_health_kit_permission')) {
      context.handle(
        _hasGrantedHealthKitPermissionMeta,
        hasGrantedHealthKitPermission.isAcceptableOrUnknown(
          data['has_granted_health_kit_permission']!,
          _hasGrantedHealthKitPermissionMeta,
        ),
      );
    }
    if (data.containsKey('has_granted_ai_consent')) {
      context.handle(
        _hasGrantedAiConsentMeta,
        hasGrantedAiConsent.isAcceptableOrUnknown(
          data['has_granted_ai_consent']!,
          _hasGrantedAiConsentMeta,
        ),
      );
    }
    if (data.containsKey('has_granted_photo_consent')) {
      context.handle(
        _hasGrantedPhotoConsentMeta,
        hasGrantedPhotoConsent.isAcceptableOrUnknown(
          data['has_granted_photo_consent']!,
          _hasGrantedPhotoConsentMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      goalsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goals_json'],
      )!,
      aiPreferencesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ai_preferences_json'],
      )!,
      hasCompletedOnboarding: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_completed_onboarding'],
      )!,
      hasGrantedHealthKitPermission: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_granted_health_kit_permission'],
      )!,
      hasGrantedAiConsent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_granted_ai_consent'],
      )!,
      hasGrantedPhotoConsent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_granted_photo_consent'],
      )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double? height;
  final int? age;
  final String? gender;
  final String timezone;
  final String goalsJson;
  final String aiPreferencesJson;
  final bool hasCompletedOnboarding;
  final bool hasGrantedHealthKitPermission;
  final bool hasGrantedAiConsent;
  final bool hasGrantedPhotoConsent;
  const UserProfile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.height,
    this.age,
    this.gender,
    required this.timezone,
    required this.goalsJson,
    required this.aiPreferencesJson,
    required this.hasCompletedOnboarding,
    required this.hasGrantedHealthKitPermission,
    required this.hasGrantedAiConsent,
    required this.hasGrantedPhotoConsent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    map['timezone'] = Variable<String>(timezone);
    map['goals_json'] = Variable<String>(goalsJson);
    map['ai_preferences_json'] = Variable<String>(aiPreferencesJson);
    map['has_completed_onboarding'] = Variable<bool>(hasCompletedOnboarding);
    map['has_granted_health_kit_permission'] = Variable<bool>(
      hasGrantedHealthKitPermission,
    );
    map['has_granted_ai_consent'] = Variable<bool>(hasGrantedAiConsent);
    map['has_granted_photo_consent'] = Variable<bool>(hasGrantedPhotoConsent);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      timezone: Value(timezone),
      goalsJson: Value(goalsJson),
      aiPreferencesJson: Value(aiPreferencesJson),
      hasCompletedOnboarding: Value(hasCompletedOnboarding),
      hasGrantedHealthKitPermission: Value(hasGrantedHealthKitPermission),
      hasGrantedAiConsent: Value(hasGrantedAiConsent),
      hasGrantedPhotoConsent: Value(hasGrantedPhotoConsent),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      height: serializer.fromJson<double?>(json['height']),
      age: serializer.fromJson<int?>(json['age']),
      gender: serializer.fromJson<String?>(json['gender']),
      timezone: serializer.fromJson<String>(json['timezone']),
      goalsJson: serializer.fromJson<String>(json['goalsJson']),
      aiPreferencesJson: serializer.fromJson<String>(json['aiPreferencesJson']),
      hasCompletedOnboarding: serializer.fromJson<bool>(
        json['hasCompletedOnboarding'],
      ),
      hasGrantedHealthKitPermission: serializer.fromJson<bool>(
        json['hasGrantedHealthKitPermission'],
      ),
      hasGrantedAiConsent: serializer.fromJson<bool>(
        json['hasGrantedAiConsent'],
      ),
      hasGrantedPhotoConsent: serializer.fromJson<bool>(
        json['hasGrantedPhotoConsent'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'height': serializer.toJson<double?>(height),
      'age': serializer.toJson<int?>(age),
      'gender': serializer.toJson<String?>(gender),
      'timezone': serializer.toJson<String>(timezone),
      'goalsJson': serializer.toJson<String>(goalsJson),
      'aiPreferencesJson': serializer.toJson<String>(aiPreferencesJson),
      'hasCompletedOnboarding': serializer.toJson<bool>(hasCompletedOnboarding),
      'hasGrantedHealthKitPermission': serializer.toJson<bool>(
        hasGrantedHealthKitPermission,
      ),
      'hasGrantedAiConsent': serializer.toJson<bool>(hasGrantedAiConsent),
      'hasGrantedPhotoConsent': serializer.toJson<bool>(hasGrantedPhotoConsent),
    };
  }

  UserProfile copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<double?> height = const Value.absent(),
    Value<int?> age = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    String? timezone,
    String? goalsJson,
    String? aiPreferencesJson,
    bool? hasCompletedOnboarding,
    bool? hasGrantedHealthKitPermission,
    bool? hasGrantedAiConsent,
    bool? hasGrantedPhotoConsent,
  }) => UserProfile(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    height: height.present ? height.value : this.height,
    age: age.present ? age.value : this.age,
    gender: gender.present ? gender.value : this.gender,
    timezone: timezone ?? this.timezone,
    goalsJson: goalsJson ?? this.goalsJson,
    aiPreferencesJson: aiPreferencesJson ?? this.aiPreferencesJson,
    hasCompletedOnboarding:
        hasCompletedOnboarding ?? this.hasCompletedOnboarding,
    hasGrantedHealthKitPermission:
        hasGrantedHealthKitPermission ?? this.hasGrantedHealthKitPermission,
    hasGrantedAiConsent: hasGrantedAiConsent ?? this.hasGrantedAiConsent,
    hasGrantedPhotoConsent:
        hasGrantedPhotoConsent ?? this.hasGrantedPhotoConsent,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      height: data.height.present ? data.height.value : this.height,
      age: data.age.present ? data.age.value : this.age,
      gender: data.gender.present ? data.gender.value : this.gender,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      goalsJson: data.goalsJson.present ? data.goalsJson.value : this.goalsJson,
      aiPreferencesJson: data.aiPreferencesJson.present
          ? data.aiPreferencesJson.value
          : this.aiPreferencesJson,
      hasCompletedOnboarding: data.hasCompletedOnboarding.present
          ? data.hasCompletedOnboarding.value
          : this.hasCompletedOnboarding,
      hasGrantedHealthKitPermission: data.hasGrantedHealthKitPermission.present
          ? data.hasGrantedHealthKitPermission.value
          : this.hasGrantedHealthKitPermission,
      hasGrantedAiConsent: data.hasGrantedAiConsent.present
          ? data.hasGrantedAiConsent.value
          : this.hasGrantedAiConsent,
      hasGrantedPhotoConsent: data.hasGrantedPhotoConsent.present
          ? data.hasGrantedPhotoConsent.value
          : this.hasGrantedPhotoConsent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('height: $height, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('timezone: $timezone, ')
          ..write('goalsJson: $goalsJson, ')
          ..write('aiPreferencesJson: $aiPreferencesJson, ')
          ..write('hasCompletedOnboarding: $hasCompletedOnboarding, ')
          ..write(
            'hasGrantedHealthKitPermission: $hasGrantedHealthKitPermission, ',
          )
          ..write('hasGrantedAiConsent: $hasGrantedAiConsent, ')
          ..write('hasGrantedPhotoConsent: $hasGrantedPhotoConsent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    height,
    age,
    gender,
    timezone,
    goalsJson,
    aiPreferencesJson,
    hasCompletedOnboarding,
    hasGrantedHealthKitPermission,
    hasGrantedAiConsent,
    hasGrantedPhotoConsent,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.height == this.height &&
          other.age == this.age &&
          other.gender == this.gender &&
          other.timezone == this.timezone &&
          other.goalsJson == this.goalsJson &&
          other.aiPreferencesJson == this.aiPreferencesJson &&
          other.hasCompletedOnboarding == this.hasCompletedOnboarding &&
          other.hasGrantedHealthKitPermission ==
              this.hasGrantedHealthKitPermission &&
          other.hasGrantedAiConsent == this.hasGrantedAiConsent &&
          other.hasGrantedPhotoConsent == this.hasGrantedPhotoConsent);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<double?> height;
  final Value<int?> age;
  final Value<String?> gender;
  final Value<String> timezone;
  final Value<String> goalsJson;
  final Value<String> aiPreferencesJson;
  final Value<bool> hasCompletedOnboarding;
  final Value<bool> hasGrantedHealthKitPermission;
  final Value<bool> hasGrantedAiConsent;
  final Value<bool> hasGrantedPhotoConsent;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.height = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.timezone = const Value.absent(),
    this.goalsJson = const Value.absent(),
    this.aiPreferencesJson = const Value.absent(),
    this.hasCompletedOnboarding = const Value.absent(),
    this.hasGrantedHealthKitPermission = const Value.absent(),
    this.hasGrantedAiConsent = const Value.absent(),
    this.hasGrantedPhotoConsent = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.height = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    required String timezone,
    required String goalsJson,
    required String aiPreferencesJson,
    this.hasCompletedOnboarding = const Value.absent(),
    this.hasGrantedHealthKitPermission = const Value.absent(),
    this.hasGrantedAiConsent = const Value.absent(),
    this.hasGrantedPhotoConsent = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       timezone = Value(timezone),
       goalsJson = Value(goalsJson),
       aiPreferencesJson = Value(aiPreferencesJson);
  static Insertable<UserProfile> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<double>? height,
    Expression<int>? age,
    Expression<String>? gender,
    Expression<String>? timezone,
    Expression<String>? goalsJson,
    Expression<String>? aiPreferencesJson,
    Expression<bool>? hasCompletedOnboarding,
    Expression<bool>? hasGrantedHealthKitPermission,
    Expression<bool>? hasGrantedAiConsent,
    Expression<bool>? hasGrantedPhotoConsent,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (height != null) 'height': height,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (timezone != null) 'timezone': timezone,
      if (goalsJson != null) 'goals_json': goalsJson,
      if (aiPreferencesJson != null) 'ai_preferences_json': aiPreferencesJson,
      if (hasCompletedOnboarding != null)
        'has_completed_onboarding': hasCompletedOnboarding,
      if (hasGrantedHealthKitPermission != null)
        'has_granted_health_kit_permission': hasGrantedHealthKitPermission,
      if (hasGrantedAiConsent != null)
        'has_granted_ai_consent': hasGrantedAiConsent,
      if (hasGrantedPhotoConsent != null)
        'has_granted_photo_consent': hasGrantedPhotoConsent,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<double?>? height,
    Value<int?>? age,
    Value<String?>? gender,
    Value<String>? timezone,
    Value<String>? goalsJson,
    Value<String>? aiPreferencesJson,
    Value<bool>? hasCompletedOnboarding,
    Value<bool>? hasGrantedHealthKitPermission,
    Value<bool>? hasGrantedAiConsent,
    Value<bool>? hasGrantedPhotoConsent,
    Value<int>? rowid,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      height: height ?? this.height,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      timezone: timezone ?? this.timezone,
      goalsJson: goalsJson ?? this.goalsJson,
      aiPreferencesJson: aiPreferencesJson ?? this.aiPreferencesJson,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      hasGrantedHealthKitPermission:
          hasGrantedHealthKitPermission ?? this.hasGrantedHealthKitPermission,
      hasGrantedAiConsent: hasGrantedAiConsent ?? this.hasGrantedAiConsent,
      hasGrantedPhotoConsent:
          hasGrantedPhotoConsent ?? this.hasGrantedPhotoConsent,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (goalsJson.present) {
      map['goals_json'] = Variable<String>(goalsJson.value);
    }
    if (aiPreferencesJson.present) {
      map['ai_preferences_json'] = Variable<String>(aiPreferencesJson.value);
    }
    if (hasCompletedOnboarding.present) {
      map['has_completed_onboarding'] = Variable<bool>(
        hasCompletedOnboarding.value,
      );
    }
    if (hasGrantedHealthKitPermission.present) {
      map['has_granted_health_kit_permission'] = Variable<bool>(
        hasGrantedHealthKitPermission.value,
      );
    }
    if (hasGrantedAiConsent.present) {
      map['has_granted_ai_consent'] = Variable<bool>(hasGrantedAiConsent.value);
    }
    if (hasGrantedPhotoConsent.present) {
      map['has_granted_photo_consent'] = Variable<bool>(
        hasGrantedPhotoConsent.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('height: $height, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('timezone: $timezone, ')
          ..write('goalsJson: $goalsJson, ')
          ..write('aiPreferencesJson: $aiPreferencesJson, ')
          ..write('hasCompletedOnboarding: $hasCompletedOnboarding, ')
          ..write(
            'hasGrantedHealthKitPermission: $hasGrantedHealthKitPermission, ',
          )
          ..write('hasGrantedAiConsent: $hasGrantedAiConsent, ')
          ..write('hasGrantedPhotoConsent: $hasGrantedPhotoConsent, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProtocolsTable extends Protocols
    with TableInfo<$ProtocolsTable, Protocol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProtocolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_profiles (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eatingWindowStartHourMeta =
      const VerificationMeta('eatingWindowStartHour');
  @override
  late final GeneratedColumn<int> eatingWindowStartHour = GeneratedColumn<int>(
    'eating_window_start_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eatingWindowStartMinuteMeta =
      const VerificationMeta('eatingWindowStartMinute');
  @override
  late final GeneratedColumn<int> eatingWindowStartMinute =
      GeneratedColumn<int>(
        'eating_window_start_minute',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _eatingWindowEndHourMeta =
      const VerificationMeta('eatingWindowEndHour');
  @override
  late final GeneratedColumn<int> eatingWindowEndHour = GeneratedColumn<int>(
    'eating_window_end_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eatingWindowEndMinuteMeta =
      const VerificationMeta('eatingWindowEndMinute');
  @override
  late final GeneratedColumn<int> eatingWindowEndMinute = GeneratedColumn<int>(
    'eating_window_end_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicationScheduleJsonMeta =
      const VerificationMeta('medicationScheduleJson');
  @override
  late final GeneratedColumn<String> medicationScheduleJson =
      GeneratedColumn<String>(
        'medication_schedule_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _weeklyActivityPlanJsonMeta =
      const VerificationMeta('weeklyActivityPlanJson');
  @override
  late final GeneratedColumn<String> weeklyActivityPlanJson =
      GeneratedColumn<String>(
        'weekly_activity_plan_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _constraintsJsonMeta = const VerificationMeta(
    'constraintsJson',
  );
  @override
  late final GeneratedColumn<String> constraintsJson = GeneratedColumn<String>(
    'constraints_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lockedUntilMeta = const VerificationMeta(
    'lockedUntil',
  );
  @override
  late final GeneratedColumn<DateTime> lockedUntil = GeneratedColumn<DateTime>(
    'locked_until',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    eatingWindowStartHour,
    eatingWindowStartMinute,
    eatingWindowEndHour,
    eatingWindowEndMinute,
    medicationScheduleJson,
    weeklyActivityPlanJson,
    constraintsJson,
    lockedUntil,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'protocols';
  @override
  VerificationContext validateIntegrity(
    Insertable<Protocol> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('eating_window_start_hour')) {
      context.handle(
        _eatingWindowStartHourMeta,
        eatingWindowStartHour.isAcceptableOrUnknown(
          data['eating_window_start_hour']!,
          _eatingWindowStartHourMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eatingWindowStartHourMeta);
    }
    if (data.containsKey('eating_window_start_minute')) {
      context.handle(
        _eatingWindowStartMinuteMeta,
        eatingWindowStartMinute.isAcceptableOrUnknown(
          data['eating_window_start_minute']!,
          _eatingWindowStartMinuteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eatingWindowStartMinuteMeta);
    }
    if (data.containsKey('eating_window_end_hour')) {
      context.handle(
        _eatingWindowEndHourMeta,
        eatingWindowEndHour.isAcceptableOrUnknown(
          data['eating_window_end_hour']!,
          _eatingWindowEndHourMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eatingWindowEndHourMeta);
    }
    if (data.containsKey('eating_window_end_minute')) {
      context.handle(
        _eatingWindowEndMinuteMeta,
        eatingWindowEndMinute.isAcceptableOrUnknown(
          data['eating_window_end_minute']!,
          _eatingWindowEndMinuteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eatingWindowEndMinuteMeta);
    }
    if (data.containsKey('medication_schedule_json')) {
      context.handle(
        _medicationScheduleJsonMeta,
        medicationScheduleJson.isAcceptableOrUnknown(
          data['medication_schedule_json']!,
          _medicationScheduleJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationScheduleJsonMeta);
    }
    if (data.containsKey('weekly_activity_plan_json')) {
      context.handle(
        _weeklyActivityPlanJsonMeta,
        weeklyActivityPlanJson.isAcceptableOrUnknown(
          data['weekly_activity_plan_json']!,
          _weeklyActivityPlanJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weeklyActivityPlanJsonMeta);
    }
    if (data.containsKey('constraints_json')) {
      context.handle(
        _constraintsJsonMeta,
        constraintsJson.isAcceptableOrUnknown(
          data['constraints_json']!,
          _constraintsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_constraintsJsonMeta);
    }
    if (data.containsKey('locked_until')) {
      context.handle(
        _lockedUntilMeta,
        lockedUntil.isAcceptableOrUnknown(
          data['locked_until']!,
          _lockedUntilMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Protocol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Protocol(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      eatingWindowStartHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}eating_window_start_hour'],
      )!,
      eatingWindowStartMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}eating_window_start_minute'],
      )!,
      eatingWindowEndHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}eating_window_end_hour'],
      )!,
      eatingWindowEndMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}eating_window_end_minute'],
      )!,
      medicationScheduleJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_schedule_json'],
      )!,
      weeklyActivityPlanJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weekly_activity_plan_json'],
      )!,
      constraintsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}constraints_json'],
      )!,
      lockedUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}locked_until'],
      ),
    );
  }

  @override
  $ProtocolsTable createAlias(String alias) {
    return $ProtocolsTable(attachedDatabase, alias);
  }
}

class Protocol extends DataClass implements Insertable<Protocol> {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int eatingWindowStartHour;
  final int eatingWindowStartMinute;
  final int eatingWindowEndHour;
  final int eatingWindowEndMinute;
  final String medicationScheduleJson;
  final String weeklyActivityPlanJson;
  final String constraintsJson;
  final DateTime? lockedUntil;
  const Protocol({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.eatingWindowStartHour,
    required this.eatingWindowStartMinute,
    required this.eatingWindowEndHour,
    required this.eatingWindowEndMinute,
    required this.medicationScheduleJson,
    required this.weeklyActivityPlanJson,
    required this.constraintsJson,
    this.lockedUntil,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['eating_window_start_hour'] = Variable<int>(eatingWindowStartHour);
    map['eating_window_start_minute'] = Variable<int>(eatingWindowStartMinute);
    map['eating_window_end_hour'] = Variable<int>(eatingWindowEndHour);
    map['eating_window_end_minute'] = Variable<int>(eatingWindowEndMinute);
    map['medication_schedule_json'] = Variable<String>(medicationScheduleJson);
    map['weekly_activity_plan_json'] = Variable<String>(weeklyActivityPlanJson);
    map['constraints_json'] = Variable<String>(constraintsJson);
    if (!nullToAbsent || lockedUntil != null) {
      map['locked_until'] = Variable<DateTime>(lockedUntil);
    }
    return map;
  }

  ProtocolsCompanion toCompanion(bool nullToAbsent) {
    return ProtocolsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      eatingWindowStartHour: Value(eatingWindowStartHour),
      eatingWindowStartMinute: Value(eatingWindowStartMinute),
      eatingWindowEndHour: Value(eatingWindowEndHour),
      eatingWindowEndMinute: Value(eatingWindowEndMinute),
      medicationScheduleJson: Value(medicationScheduleJson),
      weeklyActivityPlanJson: Value(weeklyActivityPlanJson),
      constraintsJson: Value(constraintsJson),
      lockedUntil: lockedUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(lockedUntil),
    );
  }

  factory Protocol.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Protocol(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      eatingWindowStartHour: serializer.fromJson<int>(
        json['eatingWindowStartHour'],
      ),
      eatingWindowStartMinute: serializer.fromJson<int>(
        json['eatingWindowStartMinute'],
      ),
      eatingWindowEndHour: serializer.fromJson<int>(
        json['eatingWindowEndHour'],
      ),
      eatingWindowEndMinute: serializer.fromJson<int>(
        json['eatingWindowEndMinute'],
      ),
      medicationScheduleJson: serializer.fromJson<String>(
        json['medicationScheduleJson'],
      ),
      weeklyActivityPlanJson: serializer.fromJson<String>(
        json['weeklyActivityPlanJson'],
      ),
      constraintsJson: serializer.fromJson<String>(json['constraintsJson']),
      lockedUntil: serializer.fromJson<DateTime?>(json['lockedUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'eatingWindowStartHour': serializer.toJson<int>(eatingWindowStartHour),
      'eatingWindowStartMinute': serializer.toJson<int>(
        eatingWindowStartMinute,
      ),
      'eatingWindowEndHour': serializer.toJson<int>(eatingWindowEndHour),
      'eatingWindowEndMinute': serializer.toJson<int>(eatingWindowEndMinute),
      'medicationScheduleJson': serializer.toJson<String>(
        medicationScheduleJson,
      ),
      'weeklyActivityPlanJson': serializer.toJson<String>(
        weeklyActivityPlanJson,
      ),
      'constraintsJson': serializer.toJson<String>(constraintsJson),
      'lockedUntil': serializer.toJson<DateTime?>(lockedUntil),
    };
  }

  Protocol copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? eatingWindowStartHour,
    int? eatingWindowStartMinute,
    int? eatingWindowEndHour,
    int? eatingWindowEndMinute,
    String? medicationScheduleJson,
    String? weeklyActivityPlanJson,
    String? constraintsJson,
    Value<DateTime?> lockedUntil = const Value.absent(),
  }) => Protocol(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    eatingWindowStartHour: eatingWindowStartHour ?? this.eatingWindowStartHour,
    eatingWindowStartMinute:
        eatingWindowStartMinute ?? this.eatingWindowStartMinute,
    eatingWindowEndHour: eatingWindowEndHour ?? this.eatingWindowEndHour,
    eatingWindowEndMinute: eatingWindowEndMinute ?? this.eatingWindowEndMinute,
    medicationScheduleJson:
        medicationScheduleJson ?? this.medicationScheduleJson,
    weeklyActivityPlanJson:
        weeklyActivityPlanJson ?? this.weeklyActivityPlanJson,
    constraintsJson: constraintsJson ?? this.constraintsJson,
    lockedUntil: lockedUntil.present ? lockedUntil.value : this.lockedUntil,
  );
  Protocol copyWithCompanion(ProtocolsCompanion data) {
    return Protocol(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      eatingWindowStartHour: data.eatingWindowStartHour.present
          ? data.eatingWindowStartHour.value
          : this.eatingWindowStartHour,
      eatingWindowStartMinute: data.eatingWindowStartMinute.present
          ? data.eatingWindowStartMinute.value
          : this.eatingWindowStartMinute,
      eatingWindowEndHour: data.eatingWindowEndHour.present
          ? data.eatingWindowEndHour.value
          : this.eatingWindowEndHour,
      eatingWindowEndMinute: data.eatingWindowEndMinute.present
          ? data.eatingWindowEndMinute.value
          : this.eatingWindowEndMinute,
      medicationScheduleJson: data.medicationScheduleJson.present
          ? data.medicationScheduleJson.value
          : this.medicationScheduleJson,
      weeklyActivityPlanJson: data.weeklyActivityPlanJson.present
          ? data.weeklyActivityPlanJson.value
          : this.weeklyActivityPlanJson,
      constraintsJson: data.constraintsJson.present
          ? data.constraintsJson.value
          : this.constraintsJson,
      lockedUntil: data.lockedUntil.present
          ? data.lockedUntil.value
          : this.lockedUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Protocol(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('eatingWindowStartHour: $eatingWindowStartHour, ')
          ..write('eatingWindowStartMinute: $eatingWindowStartMinute, ')
          ..write('eatingWindowEndHour: $eatingWindowEndHour, ')
          ..write('eatingWindowEndMinute: $eatingWindowEndMinute, ')
          ..write('medicationScheduleJson: $medicationScheduleJson, ')
          ..write('weeklyActivityPlanJson: $weeklyActivityPlanJson, ')
          ..write('constraintsJson: $constraintsJson, ')
          ..write('lockedUntil: $lockedUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    eatingWindowStartHour,
    eatingWindowStartMinute,
    eatingWindowEndHour,
    eatingWindowEndMinute,
    medicationScheduleJson,
    weeklyActivityPlanJson,
    constraintsJson,
    lockedUntil,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Protocol &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.eatingWindowStartHour == this.eatingWindowStartHour &&
          other.eatingWindowStartMinute == this.eatingWindowStartMinute &&
          other.eatingWindowEndHour == this.eatingWindowEndHour &&
          other.eatingWindowEndMinute == this.eatingWindowEndMinute &&
          other.medicationScheduleJson == this.medicationScheduleJson &&
          other.weeklyActivityPlanJson == this.weeklyActivityPlanJson &&
          other.constraintsJson == this.constraintsJson &&
          other.lockedUntil == this.lockedUntil);
}

class ProtocolsCompanion extends UpdateCompanion<Protocol> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> eatingWindowStartHour;
  final Value<int> eatingWindowStartMinute;
  final Value<int> eatingWindowEndHour;
  final Value<int> eatingWindowEndMinute;
  final Value<String> medicationScheduleJson;
  final Value<String> weeklyActivityPlanJson;
  final Value<String> constraintsJson;
  final Value<DateTime?> lockedUntil;
  final Value<int> rowid;
  const ProtocolsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.eatingWindowStartHour = const Value.absent(),
    this.eatingWindowStartMinute = const Value.absent(),
    this.eatingWindowEndHour = const Value.absent(),
    this.eatingWindowEndMinute = const Value.absent(),
    this.medicationScheduleJson = const Value.absent(),
    this.weeklyActivityPlanJson = const Value.absent(),
    this.constraintsJson = const Value.absent(),
    this.lockedUntil = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProtocolsCompanion.insert({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int eatingWindowStartHour,
    required int eatingWindowStartMinute,
    required int eatingWindowEndHour,
    required int eatingWindowEndMinute,
    required String medicationScheduleJson,
    required String weeklyActivityPlanJson,
    required String constraintsJson,
    this.lockedUntil = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       eatingWindowStartHour = Value(eatingWindowStartHour),
       eatingWindowStartMinute = Value(eatingWindowStartMinute),
       eatingWindowEndHour = Value(eatingWindowEndHour),
       eatingWindowEndMinute = Value(eatingWindowEndMinute),
       medicationScheduleJson = Value(medicationScheduleJson),
       weeklyActivityPlanJson = Value(weeklyActivityPlanJson),
       constraintsJson = Value(constraintsJson);
  static Insertable<Protocol> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? eatingWindowStartHour,
    Expression<int>? eatingWindowStartMinute,
    Expression<int>? eatingWindowEndHour,
    Expression<int>? eatingWindowEndMinute,
    Expression<String>? medicationScheduleJson,
    Expression<String>? weeklyActivityPlanJson,
    Expression<String>? constraintsJson,
    Expression<DateTime>? lockedUntil,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (eatingWindowStartHour != null)
        'eating_window_start_hour': eatingWindowStartHour,
      if (eatingWindowStartMinute != null)
        'eating_window_start_minute': eatingWindowStartMinute,
      if (eatingWindowEndHour != null)
        'eating_window_end_hour': eatingWindowEndHour,
      if (eatingWindowEndMinute != null)
        'eating_window_end_minute': eatingWindowEndMinute,
      if (medicationScheduleJson != null)
        'medication_schedule_json': medicationScheduleJson,
      if (weeklyActivityPlanJson != null)
        'weekly_activity_plan_json': weeklyActivityPlanJson,
      if (constraintsJson != null) 'constraints_json': constraintsJson,
      if (lockedUntil != null) 'locked_until': lockedUntil,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProtocolsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? eatingWindowStartHour,
    Value<int>? eatingWindowStartMinute,
    Value<int>? eatingWindowEndHour,
    Value<int>? eatingWindowEndMinute,
    Value<String>? medicationScheduleJson,
    Value<String>? weeklyActivityPlanJson,
    Value<String>? constraintsJson,
    Value<DateTime?>? lockedUntil,
    Value<int>? rowid,
  }) {
    return ProtocolsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      eatingWindowStartHour:
          eatingWindowStartHour ?? this.eatingWindowStartHour,
      eatingWindowStartMinute:
          eatingWindowStartMinute ?? this.eatingWindowStartMinute,
      eatingWindowEndHour: eatingWindowEndHour ?? this.eatingWindowEndHour,
      eatingWindowEndMinute:
          eatingWindowEndMinute ?? this.eatingWindowEndMinute,
      medicationScheduleJson:
          medicationScheduleJson ?? this.medicationScheduleJson,
      weeklyActivityPlanJson:
          weeklyActivityPlanJson ?? this.weeklyActivityPlanJson,
      constraintsJson: constraintsJson ?? this.constraintsJson,
      lockedUntil: lockedUntil ?? this.lockedUntil,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (eatingWindowStartHour.present) {
      map['eating_window_start_hour'] = Variable<int>(
        eatingWindowStartHour.value,
      );
    }
    if (eatingWindowStartMinute.present) {
      map['eating_window_start_minute'] = Variable<int>(
        eatingWindowStartMinute.value,
      );
    }
    if (eatingWindowEndHour.present) {
      map['eating_window_end_hour'] = Variable<int>(eatingWindowEndHour.value);
    }
    if (eatingWindowEndMinute.present) {
      map['eating_window_end_minute'] = Variable<int>(
        eatingWindowEndMinute.value,
      );
    }
    if (medicationScheduleJson.present) {
      map['medication_schedule_json'] = Variable<String>(
        medicationScheduleJson.value,
      );
    }
    if (weeklyActivityPlanJson.present) {
      map['weekly_activity_plan_json'] = Variable<String>(
        weeklyActivityPlanJson.value,
      );
    }
    if (constraintsJson.present) {
      map['constraints_json'] = Variable<String>(constraintsJson.value);
    }
    if (lockedUntil.present) {
      map['locked_until'] = Variable<DateTime>(lockedUntil.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProtocolsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('eatingWindowStartHour: $eatingWindowStartHour, ')
          ..write('eatingWindowStartMinute: $eatingWindowStartMinute, ')
          ..write('eatingWindowEndHour: $eatingWindowEndHour, ')
          ..write('eatingWindowEndMinute: $eatingWindowEndMinute, ')
          ..write('medicationScheduleJson: $medicationScheduleJson, ')
          ..write('weeklyActivityPlanJson: $weeklyActivityPlanJson, ')
          ..write('constraintsJson: $constraintsJson, ')
          ..write('lockedUntil: $lockedUntil, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProtocolSnapshotsTable extends ProtocolSnapshots
    with TableInfo<$ProtocolSnapshotsTable, ProtocolSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProtocolSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<String> protocolId = GeneratedColumn<String>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _effectiveDateMeta = const VerificationMeta(
    'effectiveDate',
  );
  @override
  late final GeneratedColumn<DateTime> effectiveDate =
      GeneratedColumn<DateTime>(
        'effective_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _serializedProtocolMeta =
      const VerificationMeta('serializedProtocol');
  @override
  late final GeneratedColumn<String> serializedProtocol =
      GeneratedColumn<String>(
        'serialized_protocol',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _changeReasonMeta = const VerificationMeta(
    'changeReason',
  );
  @override
  late final GeneratedColumn<String> changeReason = GeneratedColumn<String>(
    'change_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    effectiveDate,
    serializedProtocol,
    changeReason,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'protocol_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProtocolSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('effective_date')) {
      context.handle(
        _effectiveDateMeta,
        effectiveDate.isAcceptableOrUnknown(
          data['effective_date']!,
          _effectiveDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_effectiveDateMeta);
    }
    if (data.containsKey('serialized_protocol')) {
      context.handle(
        _serializedProtocolMeta,
        serializedProtocol.isAcceptableOrUnknown(
          data['serialized_protocol']!,
          _serializedProtocolMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serializedProtocolMeta);
    }
    if (data.containsKey('change_reason')) {
      context.handle(
        _changeReasonMeta,
        changeReason.isAcceptableOrUnknown(
          data['change_reason']!,
          _changeReasonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProtocolSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProtocolSnapshot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protocol_id'],
      )!,
      effectiveDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}effective_date'],
      )!,
      serializedProtocol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serialized_protocol'],
      )!,
      changeReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}change_reason'],
      ),
    );
  }

  @override
  $ProtocolSnapshotsTable createAlias(String alias) {
    return $ProtocolSnapshotsTable(attachedDatabase, alias);
  }
}

class ProtocolSnapshot extends DataClass
    implements Insertable<ProtocolSnapshot> {
  final String id;
  final String protocolId;
  final DateTime effectiveDate;
  final String serializedProtocol;
  final String? changeReason;
  const ProtocolSnapshot({
    required this.id,
    required this.protocolId,
    required this.effectiveDate,
    required this.serializedProtocol,
    this.changeReason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['protocol_id'] = Variable<String>(protocolId);
    map['effective_date'] = Variable<DateTime>(effectiveDate);
    map['serialized_protocol'] = Variable<String>(serializedProtocol);
    if (!nullToAbsent || changeReason != null) {
      map['change_reason'] = Variable<String>(changeReason);
    }
    return map;
  }

  ProtocolSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return ProtocolSnapshotsCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      effectiveDate: Value(effectiveDate),
      serializedProtocol: Value(serializedProtocol),
      changeReason: changeReason == null && nullToAbsent
          ? const Value.absent()
          : Value(changeReason),
    );
  }

  factory ProtocolSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProtocolSnapshot(
      id: serializer.fromJson<String>(json['id']),
      protocolId: serializer.fromJson<String>(json['protocolId']),
      effectiveDate: serializer.fromJson<DateTime>(json['effectiveDate']),
      serializedProtocol: serializer.fromJson<String>(
        json['serializedProtocol'],
      ),
      changeReason: serializer.fromJson<String?>(json['changeReason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'protocolId': serializer.toJson<String>(protocolId),
      'effectiveDate': serializer.toJson<DateTime>(effectiveDate),
      'serializedProtocol': serializer.toJson<String>(serializedProtocol),
      'changeReason': serializer.toJson<String?>(changeReason),
    };
  }

  ProtocolSnapshot copyWith({
    String? id,
    String? protocolId,
    DateTime? effectiveDate,
    String? serializedProtocol,
    Value<String?> changeReason = const Value.absent(),
  }) => ProtocolSnapshot(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    effectiveDate: effectiveDate ?? this.effectiveDate,
    serializedProtocol: serializedProtocol ?? this.serializedProtocol,
    changeReason: changeReason.present ? changeReason.value : this.changeReason,
  );
  ProtocolSnapshot copyWithCompanion(ProtocolSnapshotsCompanion data) {
    return ProtocolSnapshot(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      effectiveDate: data.effectiveDate.present
          ? data.effectiveDate.value
          : this.effectiveDate,
      serializedProtocol: data.serializedProtocol.present
          ? data.serializedProtocol.value
          : this.serializedProtocol,
      changeReason: data.changeReason.present
          ? data.changeReason.value
          : this.changeReason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProtocolSnapshot(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('effectiveDate: $effectiveDate, ')
          ..write('serializedProtocol: $serializedProtocol, ')
          ..write('changeReason: $changeReason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    protocolId,
    effectiveDate,
    serializedProtocol,
    changeReason,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProtocolSnapshot &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.effectiveDate == this.effectiveDate &&
          other.serializedProtocol == this.serializedProtocol &&
          other.changeReason == this.changeReason);
}

class ProtocolSnapshotsCompanion extends UpdateCompanion<ProtocolSnapshot> {
  final Value<String> id;
  final Value<String> protocolId;
  final Value<DateTime> effectiveDate;
  final Value<String> serializedProtocol;
  final Value<String?> changeReason;
  final Value<int> rowid;
  const ProtocolSnapshotsCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.effectiveDate = const Value.absent(),
    this.serializedProtocol = const Value.absent(),
    this.changeReason = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProtocolSnapshotsCompanion.insert({
    required String id,
    required String protocolId,
    required DateTime effectiveDate,
    required String serializedProtocol,
    this.changeReason = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       protocolId = Value(protocolId),
       effectiveDate = Value(effectiveDate),
       serializedProtocol = Value(serializedProtocol);
  static Insertable<ProtocolSnapshot> custom({
    Expression<String>? id,
    Expression<String>? protocolId,
    Expression<DateTime>? effectiveDate,
    Expression<String>? serializedProtocol,
    Expression<String>? changeReason,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (effectiveDate != null) 'effective_date': effectiveDate,
      if (serializedProtocol != null) 'serialized_protocol': serializedProtocol,
      if (changeReason != null) 'change_reason': changeReason,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProtocolSnapshotsCompanion copyWith({
    Value<String>? id,
    Value<String>? protocolId,
    Value<DateTime>? effectiveDate,
    Value<String>? serializedProtocol,
    Value<String?>? changeReason,
    Value<int>? rowid,
  }) {
    return ProtocolSnapshotsCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      serializedProtocol: serializedProtocol ?? this.serializedProtocol,
      changeReason: changeReason ?? this.changeReason,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<String>(protocolId.value);
    }
    if (effectiveDate.present) {
      map['effective_date'] = Variable<DateTime>(effectiveDate.value);
    }
    if (serializedProtocol.present) {
      map['serialized_protocol'] = Variable<String>(serializedProtocol.value);
    }
    if (changeReason.present) {
      map['change_reason'] = Variable<String>(changeReason.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProtocolSnapshotsCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('effectiveDate: $effectiveDate, ')
          ..write('serializedProtocol: $serializedProtocol, ')
          ..write('changeReason: $changeReason, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyLogsTable extends DailyLogs
    with TableInfo<$DailyLogsTable, DailyLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodEnergyMeta = const VerificationMeta(
    'moodEnergy',
  );
  @override
  late final GeneratedColumn<int> moodEnergy = GeneratedColumn<int>(
    'mood_energy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hungerMeta = const VerificationMeta('hunger');
  @override
  late final GeneratedColumn<int> hunger = GeneratedColumn<int>(
    'hunger',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stressMeta = const VerificationMeta('stress');
  @override
  late final GeneratedColumn<int> stress = GeneratedColumn<int>(
    'stress',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _symptomsJsonMeta = const VerificationMeta(
    'symptomsJson',
  );
  @override
  late final GeneratedColumn<String> symptomsJson = GeneratedColumn<String>(
    'symptoms_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    createdAt,
    updatedAt,
    weight,
    notes,
    moodEnergy,
    hunger,
    stress,
    symptomsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('mood_energy')) {
      context.handle(
        _moodEnergyMeta,
        moodEnergy.isAcceptableOrUnknown(data['mood_energy']!, _moodEnergyMeta),
      );
    }
    if (data.containsKey('hunger')) {
      context.handle(
        _hungerMeta,
        hunger.isAcceptableOrUnknown(data['hunger']!, _hungerMeta),
      );
    }
    if (data.containsKey('stress')) {
      context.handle(
        _stressMeta,
        stress.isAcceptableOrUnknown(data['stress']!, _stressMeta),
      );
    }
    if (data.containsKey('symptoms_json')) {
      context.handle(
        _symptomsJsonMeta,
        symptomsJson.isAcceptableOrUnknown(
          data['symptoms_json']!,
          _symptomsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_symptomsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      moodEnergy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood_energy'],
      ),
      hunger: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hunger'],
      ),
      stress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stress'],
      ),
      symptomsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symptoms_json'],
      )!,
    );
  }

  @override
  $DailyLogsTable createAlias(String alias) {
    return $DailyLogsTable(attachedDatabase, alias);
  }
}

class DailyLog extends DataClass implements Insertable<DailyLog> {
  final String id;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double? weight;
  final String? notes;
  final int? moodEnergy;
  final int? hunger;
  final int? stress;
  final String symptomsJson;
  const DailyLog({
    required this.id,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    this.weight,
    this.notes,
    this.moodEnergy,
    this.hunger,
    this.stress,
    required this.symptomsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || moodEnergy != null) {
      map['mood_energy'] = Variable<int>(moodEnergy);
    }
    if (!nullToAbsent || hunger != null) {
      map['hunger'] = Variable<int>(hunger);
    }
    if (!nullToAbsent || stress != null) {
      map['stress'] = Variable<int>(stress);
    }
    map['symptoms_json'] = Variable<String>(symptomsJson);
    return map;
  }

  DailyLogsCompanion toCompanion(bool nullToAbsent) {
    return DailyLogsCompanion(
      id: Value(id),
      date: Value(date),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      moodEnergy: moodEnergy == null && nullToAbsent
          ? const Value.absent()
          : Value(moodEnergy),
      hunger: hunger == null && nullToAbsent
          ? const Value.absent()
          : Value(hunger),
      stress: stress == null && nullToAbsent
          ? const Value.absent()
          : Value(stress),
      symptomsJson: Value(symptomsJson),
    );
  }

  factory DailyLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyLog(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      weight: serializer.fromJson<double?>(json['weight']),
      notes: serializer.fromJson<String?>(json['notes']),
      moodEnergy: serializer.fromJson<int?>(json['moodEnergy']),
      hunger: serializer.fromJson<int?>(json['hunger']),
      stress: serializer.fromJson<int?>(json['stress']),
      symptomsJson: serializer.fromJson<String>(json['symptomsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'weight': serializer.toJson<double?>(weight),
      'notes': serializer.toJson<String?>(notes),
      'moodEnergy': serializer.toJson<int?>(moodEnergy),
      'hunger': serializer.toJson<int?>(hunger),
      'stress': serializer.toJson<int?>(stress),
      'symptomsJson': serializer.toJson<String>(symptomsJson),
    };
  }

  DailyLog copyWith({
    String? id,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<double?> weight = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<int?> moodEnergy = const Value.absent(),
    Value<int?> hunger = const Value.absent(),
    Value<int?> stress = const Value.absent(),
    String? symptomsJson,
  }) => DailyLog(
    id: id ?? this.id,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    weight: weight.present ? weight.value : this.weight,
    notes: notes.present ? notes.value : this.notes,
    moodEnergy: moodEnergy.present ? moodEnergy.value : this.moodEnergy,
    hunger: hunger.present ? hunger.value : this.hunger,
    stress: stress.present ? stress.value : this.stress,
    symptomsJson: symptomsJson ?? this.symptomsJson,
  );
  DailyLog copyWithCompanion(DailyLogsCompanion data) {
    return DailyLog(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      weight: data.weight.present ? data.weight.value : this.weight,
      notes: data.notes.present ? data.notes.value : this.notes,
      moodEnergy: data.moodEnergy.present
          ? data.moodEnergy.value
          : this.moodEnergy,
      hunger: data.hunger.present ? data.hunger.value : this.hunger,
      stress: data.stress.present ? data.stress.value : this.stress,
      symptomsJson: data.symptomsJson.present
          ? data.symptomsJson.value
          : this.symptomsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyLog(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('weight: $weight, ')
          ..write('notes: $notes, ')
          ..write('moodEnergy: $moodEnergy, ')
          ..write('hunger: $hunger, ')
          ..write('stress: $stress, ')
          ..write('symptomsJson: $symptomsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    createdAt,
    updatedAt,
    weight,
    notes,
    moodEnergy,
    hunger,
    stress,
    symptomsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyLog &&
          other.id == this.id &&
          other.date == this.date &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.weight == this.weight &&
          other.notes == this.notes &&
          other.moodEnergy == this.moodEnergy &&
          other.hunger == this.hunger &&
          other.stress == this.stress &&
          other.symptomsJson == this.symptomsJson);
}

class DailyLogsCompanion extends UpdateCompanion<DailyLog> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<double?> weight;
  final Value<String?> notes;
  final Value<int?> moodEnergy;
  final Value<int?> hunger;
  final Value<int?> stress;
  final Value<String> symptomsJson;
  final Value<int> rowid;
  const DailyLogsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.weight = const Value.absent(),
    this.notes = const Value.absent(),
    this.moodEnergy = const Value.absent(),
    this.hunger = const Value.absent(),
    this.stress = const Value.absent(),
    this.symptomsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyLogsCompanion.insert({
    required String id,
    required DateTime date,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.weight = const Value.absent(),
    this.notes = const Value.absent(),
    this.moodEnergy = const Value.absent(),
    this.hunger = const Value.absent(),
    this.stress = const Value.absent(),
    required String symptomsJson,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       symptomsJson = Value(symptomsJson);
  static Insertable<DailyLog> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<double>? weight,
    Expression<String>? notes,
    Expression<int>? moodEnergy,
    Expression<int>? hunger,
    Expression<int>? stress,
    Expression<String>? symptomsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (weight != null) 'weight': weight,
      if (notes != null) 'notes': notes,
      if (moodEnergy != null) 'mood_energy': moodEnergy,
      if (hunger != null) 'hunger': hunger,
      if (stress != null) 'stress': stress,
      if (symptomsJson != null) 'symptoms_json': symptomsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<double?>? weight,
    Value<String?>? notes,
    Value<int?>? moodEnergy,
    Value<int?>? hunger,
    Value<int?>? stress,
    Value<String>? symptomsJson,
    Value<int>? rowid,
  }) {
    return DailyLogsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      weight: weight ?? this.weight,
      notes: notes ?? this.notes,
      moodEnergy: moodEnergy ?? this.moodEnergy,
      hunger: hunger ?? this.hunger,
      stress: stress ?? this.stress,
      symptomsJson: symptomsJson ?? this.symptomsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (moodEnergy.present) {
      map['mood_energy'] = Variable<int>(moodEnergy.value);
    }
    if (hunger.present) {
      map['hunger'] = Variable<int>(hunger.value);
    }
    if (stress.present) {
      map['stress'] = Variable<int>(stress.value);
    }
    if (symptomsJson.present) {
      map['symptoms_json'] = Variable<String>(symptomsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyLogsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('weight: $weight, ')
          ..write('notes: $notes, ')
          ..write('moodEnergy: $moodEnergy, ')
          ..write('hunger: $hunger, ')
          ..write('stress: $stress, ')
          ..write('symptomsJson: $symptomsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MeasurementLogsTable extends MeasurementLogs
    with TableInfo<$MeasurementLogsTable, MeasurementLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeasurementLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyLogIdMeta = const VerificationMeta(
    'dailyLogId',
  );
  @override
  late final GeneratedColumn<String> dailyLogId = GeneratedColumn<String>(
    'daily_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES daily_logs (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waistMeta = const VerificationMeta('waist');
  @override
  late final GeneratedColumn<double> waist = GeneratedColumn<double>(
    'waist',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chestMeta = const VerificationMeta('chest');
  @override
  late final GeneratedColumn<double> chest = GeneratedColumn<double>(
    'chest',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hipMeta = const VerificationMeta('hip');
  @override
  late final GeneratedColumn<double> hip = GeneratedColumn<double>(
    'hip',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thighMeta = const VerificationMeta('thigh');
  @override
  late final GeneratedColumn<double> thigh = GeneratedColumn<double>(
    'thigh',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _armMeta = const VerificationMeta('arm');
  @override
  late final GeneratedColumn<double> arm = GeneratedColumn<double>(
    'arm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyLogId,
    date,
    waist,
    chest,
    hip,
    thigh,
    arm,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'measurement_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MeasurementLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('daily_log_id')) {
      context.handle(
        _dailyLogIdMeta,
        dailyLogId.isAcceptableOrUnknown(
          data['daily_log_id']!,
          _dailyLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyLogIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('waist')) {
      context.handle(
        _waistMeta,
        waist.isAcceptableOrUnknown(data['waist']!, _waistMeta),
      );
    }
    if (data.containsKey('chest')) {
      context.handle(
        _chestMeta,
        chest.isAcceptableOrUnknown(data['chest']!, _chestMeta),
      );
    }
    if (data.containsKey('hip')) {
      context.handle(
        _hipMeta,
        hip.isAcceptableOrUnknown(data['hip']!, _hipMeta),
      );
    }
    if (data.containsKey('thigh')) {
      context.handle(
        _thighMeta,
        thigh.isAcceptableOrUnknown(data['thigh']!, _thighMeta),
      );
    }
    if (data.containsKey('arm')) {
      context.handle(
        _armMeta,
        arm.isAcceptableOrUnknown(data['arm']!, _armMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MeasurementLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeasurementLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dailyLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_log_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      waist: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}waist'],
      ),
      chest: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}chest'],
      ),
      hip: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hip'],
      ),
      thigh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}thigh'],
      ),
      arm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}arm'],
      ),
    );
  }

  @override
  $MeasurementLogsTable createAlias(String alias) {
    return $MeasurementLogsTable(attachedDatabase, alias);
  }
}

class MeasurementLog extends DataClass implements Insertable<MeasurementLog> {
  final String id;
  final String dailyLogId;
  final DateTime date;
  final double? waist;
  final double? chest;
  final double? hip;
  final double? thigh;
  final double? arm;
  const MeasurementLog({
    required this.id,
    required this.dailyLogId,
    required this.date,
    this.waist,
    this.chest,
    this.hip,
    this.thigh,
    this.arm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['daily_log_id'] = Variable<String>(dailyLogId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || waist != null) {
      map['waist'] = Variable<double>(waist);
    }
    if (!nullToAbsent || chest != null) {
      map['chest'] = Variable<double>(chest);
    }
    if (!nullToAbsent || hip != null) {
      map['hip'] = Variable<double>(hip);
    }
    if (!nullToAbsent || thigh != null) {
      map['thigh'] = Variable<double>(thigh);
    }
    if (!nullToAbsent || arm != null) {
      map['arm'] = Variable<double>(arm);
    }
    return map;
  }

  MeasurementLogsCompanion toCompanion(bool nullToAbsent) {
    return MeasurementLogsCompanion(
      id: Value(id),
      dailyLogId: Value(dailyLogId),
      date: Value(date),
      waist: waist == null && nullToAbsent
          ? const Value.absent()
          : Value(waist),
      chest: chest == null && nullToAbsent
          ? const Value.absent()
          : Value(chest),
      hip: hip == null && nullToAbsent ? const Value.absent() : Value(hip),
      thigh: thigh == null && nullToAbsent
          ? const Value.absent()
          : Value(thigh),
      arm: arm == null && nullToAbsent ? const Value.absent() : Value(arm),
    );
  }

  factory MeasurementLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeasurementLog(
      id: serializer.fromJson<String>(json['id']),
      dailyLogId: serializer.fromJson<String>(json['dailyLogId']),
      date: serializer.fromJson<DateTime>(json['date']),
      waist: serializer.fromJson<double?>(json['waist']),
      chest: serializer.fromJson<double?>(json['chest']),
      hip: serializer.fromJson<double?>(json['hip']),
      thigh: serializer.fromJson<double?>(json['thigh']),
      arm: serializer.fromJson<double?>(json['arm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dailyLogId': serializer.toJson<String>(dailyLogId),
      'date': serializer.toJson<DateTime>(date),
      'waist': serializer.toJson<double?>(waist),
      'chest': serializer.toJson<double?>(chest),
      'hip': serializer.toJson<double?>(hip),
      'thigh': serializer.toJson<double?>(thigh),
      'arm': serializer.toJson<double?>(arm),
    };
  }

  MeasurementLog copyWith({
    String? id,
    String? dailyLogId,
    DateTime? date,
    Value<double?> waist = const Value.absent(),
    Value<double?> chest = const Value.absent(),
    Value<double?> hip = const Value.absent(),
    Value<double?> thigh = const Value.absent(),
    Value<double?> arm = const Value.absent(),
  }) => MeasurementLog(
    id: id ?? this.id,
    dailyLogId: dailyLogId ?? this.dailyLogId,
    date: date ?? this.date,
    waist: waist.present ? waist.value : this.waist,
    chest: chest.present ? chest.value : this.chest,
    hip: hip.present ? hip.value : this.hip,
    thigh: thigh.present ? thigh.value : this.thigh,
    arm: arm.present ? arm.value : this.arm,
  );
  MeasurementLog copyWithCompanion(MeasurementLogsCompanion data) {
    return MeasurementLog(
      id: data.id.present ? data.id.value : this.id,
      dailyLogId: data.dailyLogId.present
          ? data.dailyLogId.value
          : this.dailyLogId,
      date: data.date.present ? data.date.value : this.date,
      waist: data.waist.present ? data.waist.value : this.waist,
      chest: data.chest.present ? data.chest.value : this.chest,
      hip: data.hip.present ? data.hip.value : this.hip,
      thigh: data.thigh.present ? data.thigh.value : this.thigh,
      arm: data.arm.present ? data.arm.value : this.arm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeasurementLog(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('date: $date, ')
          ..write('waist: $waist, ')
          ..write('chest: $chest, ')
          ..write('hip: $hip, ')
          ..write('thigh: $thigh, ')
          ..write('arm: $arm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, dailyLogId, date, waist, chest, hip, thigh, arm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeasurementLog &&
          other.id == this.id &&
          other.dailyLogId == this.dailyLogId &&
          other.date == this.date &&
          other.waist == this.waist &&
          other.chest == this.chest &&
          other.hip == this.hip &&
          other.thigh == this.thigh &&
          other.arm == this.arm);
}

class MeasurementLogsCompanion extends UpdateCompanion<MeasurementLog> {
  final Value<String> id;
  final Value<String> dailyLogId;
  final Value<DateTime> date;
  final Value<double?> waist;
  final Value<double?> chest;
  final Value<double?> hip;
  final Value<double?> thigh;
  final Value<double?> arm;
  final Value<int> rowid;
  const MeasurementLogsCompanion({
    this.id = const Value.absent(),
    this.dailyLogId = const Value.absent(),
    this.date = const Value.absent(),
    this.waist = const Value.absent(),
    this.chest = const Value.absent(),
    this.hip = const Value.absent(),
    this.thigh = const Value.absent(),
    this.arm = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MeasurementLogsCompanion.insert({
    required String id,
    required String dailyLogId,
    required DateTime date,
    this.waist = const Value.absent(),
    this.chest = const Value.absent(),
    this.hip = const Value.absent(),
    this.thigh = const Value.absent(),
    this.arm = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dailyLogId = Value(dailyLogId),
       date = Value(date);
  static Insertable<MeasurementLog> custom({
    Expression<String>? id,
    Expression<String>? dailyLogId,
    Expression<DateTime>? date,
    Expression<double>? waist,
    Expression<double>? chest,
    Expression<double>? hip,
    Expression<double>? thigh,
    Expression<double>? arm,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyLogId != null) 'daily_log_id': dailyLogId,
      if (date != null) 'date': date,
      if (waist != null) 'waist': waist,
      if (chest != null) 'chest': chest,
      if (hip != null) 'hip': hip,
      if (thigh != null) 'thigh': thigh,
      if (arm != null) 'arm': arm,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MeasurementLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? dailyLogId,
    Value<DateTime>? date,
    Value<double?>? waist,
    Value<double?>? chest,
    Value<double?>? hip,
    Value<double?>? thigh,
    Value<double?>? arm,
    Value<int>? rowid,
  }) {
    return MeasurementLogsCompanion(
      id: id ?? this.id,
      dailyLogId: dailyLogId ?? this.dailyLogId,
      date: date ?? this.date,
      waist: waist ?? this.waist,
      chest: chest ?? this.chest,
      hip: hip ?? this.hip,
      thigh: thigh ?? this.thigh,
      arm: arm ?? this.arm,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dailyLogId.present) {
      map['daily_log_id'] = Variable<String>(dailyLogId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (waist.present) {
      map['waist'] = Variable<double>(waist.value);
    }
    if (chest.present) {
      map['chest'] = Variable<double>(chest.value);
    }
    if (hip.present) {
      map['hip'] = Variable<double>(hip.value);
    }
    if (thigh.present) {
      map['thigh'] = Variable<double>(thigh.value);
    }
    if (arm.present) {
      map['arm'] = Variable<double>(arm.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeasurementLogsCompanion(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('date: $date, ')
          ..write('waist: $waist, ')
          ..write('chest: $chest, ')
          ..write('hip: $hip, ')
          ..write('thigh: $thigh, ')
          ..write('arm: $arm, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealLogsTable extends MealLogs with TableInfo<$MealLogsTable, MealLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyLogIdMeta = const VerificationMeta(
    'dailyLogId',
  );
  @override
  late final GeneratedColumn<String> dailyLogId = GeneratedColumn<String>(
    'daily_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES daily_logs (id)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoUriMeta = const VerificationMeta(
    'photoUri',
  );
  @override
  late final GeneratedColumn<String> photoUri = GeneratedColumn<String>(
    'photo_uri',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aiAnalysisIdMeta = const VerificationMeta(
    'aiAnalysisId',
  );
  @override
  late final GeneratedColumn<String> aiAnalysisId = GeneratedColumn<String>(
    'ai_analysis_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyLogId,
    time,
    createdAt,
    method,
    photoUri,
    templateId,
    aiAnalysisId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('daily_log_id')) {
      context.handle(
        _dailyLogIdMeta,
        dailyLogId.isAcceptableOrUnknown(
          data['daily_log_id']!,
          _dailyLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyLogIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('photo_uri')) {
      context.handle(
        _photoUriMeta,
        photoUri.isAcceptableOrUnknown(data['photo_uri']!, _photoUriMeta),
      );
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    }
    if (data.containsKey('ai_analysis_id')) {
      context.handle(
        _aiAnalysisIdMeta,
        aiAnalysisId.isAcceptableOrUnknown(
          data['ai_analysis_id']!,
          _aiAnalysisIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dailyLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_log_id'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}time'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      photoUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_uri'],
      ),
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      ),
      aiAnalysisId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ai_analysis_id'],
      ),
    );
  }

  @override
  $MealLogsTable createAlias(String alias) {
    return $MealLogsTable(attachedDatabase, alias);
  }
}

class MealLog extends DataClass implements Insertable<MealLog> {
  final String id;
  final String dailyLogId;
  final DateTime time;
  final DateTime createdAt;
  final String method;
  final String? photoUri;
  final String? templateId;
  final String? aiAnalysisId;
  const MealLog({
    required this.id,
    required this.dailyLogId,
    required this.time,
    required this.createdAt,
    required this.method,
    this.photoUri,
    this.templateId,
    this.aiAnalysisId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['daily_log_id'] = Variable<String>(dailyLogId);
    map['time'] = Variable<DateTime>(time);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['method'] = Variable<String>(method);
    if (!nullToAbsent || photoUri != null) {
      map['photo_uri'] = Variable<String>(photoUri);
    }
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<String>(templateId);
    }
    if (!nullToAbsent || aiAnalysisId != null) {
      map['ai_analysis_id'] = Variable<String>(aiAnalysisId);
    }
    return map;
  }

  MealLogsCompanion toCompanion(bool nullToAbsent) {
    return MealLogsCompanion(
      id: Value(id),
      dailyLogId: Value(dailyLogId),
      time: Value(time),
      createdAt: Value(createdAt),
      method: Value(method),
      photoUri: photoUri == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUri),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
      aiAnalysisId: aiAnalysisId == null && nullToAbsent
          ? const Value.absent()
          : Value(aiAnalysisId),
    );
  }

  factory MealLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealLog(
      id: serializer.fromJson<String>(json['id']),
      dailyLogId: serializer.fromJson<String>(json['dailyLogId']),
      time: serializer.fromJson<DateTime>(json['time']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      method: serializer.fromJson<String>(json['method']),
      photoUri: serializer.fromJson<String?>(json['photoUri']),
      templateId: serializer.fromJson<String?>(json['templateId']),
      aiAnalysisId: serializer.fromJson<String?>(json['aiAnalysisId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dailyLogId': serializer.toJson<String>(dailyLogId),
      'time': serializer.toJson<DateTime>(time),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'method': serializer.toJson<String>(method),
      'photoUri': serializer.toJson<String?>(photoUri),
      'templateId': serializer.toJson<String?>(templateId),
      'aiAnalysisId': serializer.toJson<String?>(aiAnalysisId),
    };
  }

  MealLog copyWith({
    String? id,
    String? dailyLogId,
    DateTime? time,
    DateTime? createdAt,
    String? method,
    Value<String?> photoUri = const Value.absent(),
    Value<String?> templateId = const Value.absent(),
    Value<String?> aiAnalysisId = const Value.absent(),
  }) => MealLog(
    id: id ?? this.id,
    dailyLogId: dailyLogId ?? this.dailyLogId,
    time: time ?? this.time,
    createdAt: createdAt ?? this.createdAt,
    method: method ?? this.method,
    photoUri: photoUri.present ? photoUri.value : this.photoUri,
    templateId: templateId.present ? templateId.value : this.templateId,
    aiAnalysisId: aiAnalysisId.present ? aiAnalysisId.value : this.aiAnalysisId,
  );
  MealLog copyWithCompanion(MealLogsCompanion data) {
    return MealLog(
      id: data.id.present ? data.id.value : this.id,
      dailyLogId: data.dailyLogId.present
          ? data.dailyLogId.value
          : this.dailyLogId,
      time: data.time.present ? data.time.value : this.time,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      method: data.method.present ? data.method.value : this.method,
      photoUri: data.photoUri.present ? data.photoUri.value : this.photoUri,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      aiAnalysisId: data.aiAnalysisId.present
          ? data.aiAnalysisId.value
          : this.aiAnalysisId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealLog(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('time: $time, ')
          ..write('createdAt: $createdAt, ')
          ..write('method: $method, ')
          ..write('photoUri: $photoUri, ')
          ..write('templateId: $templateId, ')
          ..write('aiAnalysisId: $aiAnalysisId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyLogId,
    time,
    createdAt,
    method,
    photoUri,
    templateId,
    aiAnalysisId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealLog &&
          other.id == this.id &&
          other.dailyLogId == this.dailyLogId &&
          other.time == this.time &&
          other.createdAt == this.createdAt &&
          other.method == this.method &&
          other.photoUri == this.photoUri &&
          other.templateId == this.templateId &&
          other.aiAnalysisId == this.aiAnalysisId);
}

class MealLogsCompanion extends UpdateCompanion<MealLog> {
  final Value<String> id;
  final Value<String> dailyLogId;
  final Value<DateTime> time;
  final Value<DateTime> createdAt;
  final Value<String> method;
  final Value<String?> photoUri;
  final Value<String?> templateId;
  final Value<String?> aiAnalysisId;
  final Value<int> rowid;
  const MealLogsCompanion({
    this.id = const Value.absent(),
    this.dailyLogId = const Value.absent(),
    this.time = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.method = const Value.absent(),
    this.photoUri = const Value.absent(),
    this.templateId = const Value.absent(),
    this.aiAnalysisId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealLogsCompanion.insert({
    required String id,
    required String dailyLogId,
    required DateTime time,
    required DateTime createdAt,
    required String method,
    this.photoUri = const Value.absent(),
    this.templateId = const Value.absent(),
    this.aiAnalysisId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dailyLogId = Value(dailyLogId),
       time = Value(time),
       createdAt = Value(createdAt),
       method = Value(method);
  static Insertable<MealLog> custom({
    Expression<String>? id,
    Expression<String>? dailyLogId,
    Expression<DateTime>? time,
    Expression<DateTime>? createdAt,
    Expression<String>? method,
    Expression<String>? photoUri,
    Expression<String>? templateId,
    Expression<String>? aiAnalysisId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyLogId != null) 'daily_log_id': dailyLogId,
      if (time != null) 'time': time,
      if (createdAt != null) 'created_at': createdAt,
      if (method != null) 'method': method,
      if (photoUri != null) 'photo_uri': photoUri,
      if (templateId != null) 'template_id': templateId,
      if (aiAnalysisId != null) 'ai_analysis_id': aiAnalysisId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? dailyLogId,
    Value<DateTime>? time,
    Value<DateTime>? createdAt,
    Value<String>? method,
    Value<String?>? photoUri,
    Value<String?>? templateId,
    Value<String?>? aiAnalysisId,
    Value<int>? rowid,
  }) {
    return MealLogsCompanion(
      id: id ?? this.id,
      dailyLogId: dailyLogId ?? this.dailyLogId,
      time: time ?? this.time,
      createdAt: createdAt ?? this.createdAt,
      method: method ?? this.method,
      photoUri: photoUri ?? this.photoUri,
      templateId: templateId ?? this.templateId,
      aiAnalysisId: aiAnalysisId ?? this.aiAnalysisId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dailyLogId.present) {
      map['daily_log_id'] = Variable<String>(dailyLogId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (photoUri.present) {
      map['photo_uri'] = Variable<String>(photoUri.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (aiAnalysisId.present) {
      map['ai_analysis_id'] = Variable<String>(aiAnalysisId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealLogsCompanion(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('time: $time, ')
          ..write('createdAt: $createdAt, ')
          ..write('method: $method, ')
          ..write('photoUri: $photoUri, ')
          ..write('templateId: $templateId, ')
          ..write('aiAnalysisId: $aiAnalysisId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealItemsTable extends MealItems
    with TableInfo<$MealItemsTable, MealItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealLogIdMeta = const VerificationMeta(
    'mealLogId',
  );
  @override
  late final GeneratedColumn<String> mealLogId = GeneratedColumn<String>(
    'meal_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_logs (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _portionMeta = const VerificationMeta(
    'portion',
  );
  @override
  late final GeneratedColumn<String> portion = GeneratedColumn<String>(
    'portion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caloriesEstimateMeta = const VerificationMeta(
    'caloriesEstimate',
  );
  @override
  late final GeneratedColumn<int> caloriesEstimate = GeneratedColumn<int>(
    'calories_estimate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proteinEstimateMeta = const VerificationMeta(
    'proteinEstimate',
  );
  @override
  late final GeneratedColumn<int> proteinEstimate = GeneratedColumn<int>(
    'protein_estimate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carbsEstimateMeta = const VerificationMeta(
    'carbsEstimate',
  );
  @override
  late final GeneratedColumn<int> carbsEstimate = GeneratedColumn<int>(
    'carbs_estimate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatEstimateMeta = const VerificationMeta(
    'fatEstimate',
  );
  @override
  late final GeneratedColumn<int> fatEstimate = GeneratedColumn<int>(
    'fat_estimate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isAiEstimateMeta = const VerificationMeta(
    'isAiEstimate',
  );
  @override
  late final GeneratedColumn<bool> isAiEstimate = GeneratedColumn<bool>(
    'is_ai_estimate',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_ai_estimate" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isUserEditedMeta = const VerificationMeta(
    'isUserEdited',
  );
  @override
  late final GeneratedColumn<bool> isUserEdited = GeneratedColumn<bool>(
    'is_user_edited',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_user_edited" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mealLogId,
    name,
    portion,
    caloriesEstimate,
    proteinEstimate,
    carbsEstimate,
    fatEstimate,
    isAiEstimate,
    isUserEdited,
    confidence,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('meal_log_id')) {
      context.handle(
        _mealLogIdMeta,
        mealLogId.isAcceptableOrUnknown(data['meal_log_id']!, _mealLogIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mealLogIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('portion')) {
      context.handle(
        _portionMeta,
        portion.isAcceptableOrUnknown(data['portion']!, _portionMeta),
      );
    }
    if (data.containsKey('calories_estimate')) {
      context.handle(
        _caloriesEstimateMeta,
        caloriesEstimate.isAcceptableOrUnknown(
          data['calories_estimate']!,
          _caloriesEstimateMeta,
        ),
      );
    }
    if (data.containsKey('protein_estimate')) {
      context.handle(
        _proteinEstimateMeta,
        proteinEstimate.isAcceptableOrUnknown(
          data['protein_estimate']!,
          _proteinEstimateMeta,
        ),
      );
    }
    if (data.containsKey('carbs_estimate')) {
      context.handle(
        _carbsEstimateMeta,
        carbsEstimate.isAcceptableOrUnknown(
          data['carbs_estimate']!,
          _carbsEstimateMeta,
        ),
      );
    }
    if (data.containsKey('fat_estimate')) {
      context.handle(
        _fatEstimateMeta,
        fatEstimate.isAcceptableOrUnknown(
          data['fat_estimate']!,
          _fatEstimateMeta,
        ),
      );
    }
    if (data.containsKey('is_ai_estimate')) {
      context.handle(
        _isAiEstimateMeta,
        isAiEstimate.isAcceptableOrUnknown(
          data['is_ai_estimate']!,
          _isAiEstimateMeta,
        ),
      );
    }
    if (data.containsKey('is_user_edited')) {
      context.handle(
        _isUserEditedMeta,
        isUserEdited.isAcceptableOrUnknown(
          data['is_user_edited']!,
          _isUserEditedMeta,
        ),
      );
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mealLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_log_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      portion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}portion'],
      ),
      caloriesEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories_estimate'],
      ),
      proteinEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protein_estimate'],
      ),
      carbsEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}carbs_estimate'],
      ),
      fatEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fat_estimate'],
      ),
      isAiEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_ai_estimate'],
      )!,
      isUserEdited: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_user_edited'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      ),
    );
  }

  @override
  $MealItemsTable createAlias(String alias) {
    return $MealItemsTable(attachedDatabase, alias);
  }
}

class MealItem extends DataClass implements Insertable<MealItem> {
  final String id;
  final String mealLogId;
  final String name;
  final String? portion;
  final int? caloriesEstimate;
  final int? proteinEstimate;
  final int? carbsEstimate;
  final int? fatEstimate;
  final bool isAiEstimate;
  final bool isUserEdited;
  final int? confidence;
  const MealItem({
    required this.id,
    required this.mealLogId,
    required this.name,
    this.portion,
    this.caloriesEstimate,
    this.proteinEstimate,
    this.carbsEstimate,
    this.fatEstimate,
    required this.isAiEstimate,
    required this.isUserEdited,
    this.confidence,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['meal_log_id'] = Variable<String>(mealLogId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || portion != null) {
      map['portion'] = Variable<String>(portion);
    }
    if (!nullToAbsent || caloriesEstimate != null) {
      map['calories_estimate'] = Variable<int>(caloriesEstimate);
    }
    if (!nullToAbsent || proteinEstimate != null) {
      map['protein_estimate'] = Variable<int>(proteinEstimate);
    }
    if (!nullToAbsent || carbsEstimate != null) {
      map['carbs_estimate'] = Variable<int>(carbsEstimate);
    }
    if (!nullToAbsent || fatEstimate != null) {
      map['fat_estimate'] = Variable<int>(fatEstimate);
    }
    map['is_ai_estimate'] = Variable<bool>(isAiEstimate);
    map['is_user_edited'] = Variable<bool>(isUserEdited);
    if (!nullToAbsent || confidence != null) {
      map['confidence'] = Variable<int>(confidence);
    }
    return map;
  }

  MealItemsCompanion toCompanion(bool nullToAbsent) {
    return MealItemsCompanion(
      id: Value(id),
      mealLogId: Value(mealLogId),
      name: Value(name),
      portion: portion == null && nullToAbsent
          ? const Value.absent()
          : Value(portion),
      caloriesEstimate: caloriesEstimate == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesEstimate),
      proteinEstimate: proteinEstimate == null && nullToAbsent
          ? const Value.absent()
          : Value(proteinEstimate),
      carbsEstimate: carbsEstimate == null && nullToAbsent
          ? const Value.absent()
          : Value(carbsEstimate),
      fatEstimate: fatEstimate == null && nullToAbsent
          ? const Value.absent()
          : Value(fatEstimate),
      isAiEstimate: Value(isAiEstimate),
      isUserEdited: Value(isUserEdited),
      confidence: confidence == null && nullToAbsent
          ? const Value.absent()
          : Value(confidence),
    );
  }

  factory MealItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealItem(
      id: serializer.fromJson<String>(json['id']),
      mealLogId: serializer.fromJson<String>(json['mealLogId']),
      name: serializer.fromJson<String>(json['name']),
      portion: serializer.fromJson<String?>(json['portion']),
      caloriesEstimate: serializer.fromJson<int?>(json['caloriesEstimate']),
      proteinEstimate: serializer.fromJson<int?>(json['proteinEstimate']),
      carbsEstimate: serializer.fromJson<int?>(json['carbsEstimate']),
      fatEstimate: serializer.fromJson<int?>(json['fatEstimate']),
      isAiEstimate: serializer.fromJson<bool>(json['isAiEstimate']),
      isUserEdited: serializer.fromJson<bool>(json['isUserEdited']),
      confidence: serializer.fromJson<int?>(json['confidence']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mealLogId': serializer.toJson<String>(mealLogId),
      'name': serializer.toJson<String>(name),
      'portion': serializer.toJson<String?>(portion),
      'caloriesEstimate': serializer.toJson<int?>(caloriesEstimate),
      'proteinEstimate': serializer.toJson<int?>(proteinEstimate),
      'carbsEstimate': serializer.toJson<int?>(carbsEstimate),
      'fatEstimate': serializer.toJson<int?>(fatEstimate),
      'isAiEstimate': serializer.toJson<bool>(isAiEstimate),
      'isUserEdited': serializer.toJson<bool>(isUserEdited),
      'confidence': serializer.toJson<int?>(confidence),
    };
  }

  MealItem copyWith({
    String? id,
    String? mealLogId,
    String? name,
    Value<String?> portion = const Value.absent(),
    Value<int?> caloriesEstimate = const Value.absent(),
    Value<int?> proteinEstimate = const Value.absent(),
    Value<int?> carbsEstimate = const Value.absent(),
    Value<int?> fatEstimate = const Value.absent(),
    bool? isAiEstimate,
    bool? isUserEdited,
    Value<int?> confidence = const Value.absent(),
  }) => MealItem(
    id: id ?? this.id,
    mealLogId: mealLogId ?? this.mealLogId,
    name: name ?? this.name,
    portion: portion.present ? portion.value : this.portion,
    caloriesEstimate: caloriesEstimate.present
        ? caloriesEstimate.value
        : this.caloriesEstimate,
    proteinEstimate: proteinEstimate.present
        ? proteinEstimate.value
        : this.proteinEstimate,
    carbsEstimate: carbsEstimate.present
        ? carbsEstimate.value
        : this.carbsEstimate,
    fatEstimate: fatEstimate.present ? fatEstimate.value : this.fatEstimate,
    isAiEstimate: isAiEstimate ?? this.isAiEstimate,
    isUserEdited: isUserEdited ?? this.isUserEdited,
    confidence: confidence.present ? confidence.value : this.confidence,
  );
  MealItem copyWithCompanion(MealItemsCompanion data) {
    return MealItem(
      id: data.id.present ? data.id.value : this.id,
      mealLogId: data.mealLogId.present ? data.mealLogId.value : this.mealLogId,
      name: data.name.present ? data.name.value : this.name,
      portion: data.portion.present ? data.portion.value : this.portion,
      caloriesEstimate: data.caloriesEstimate.present
          ? data.caloriesEstimate.value
          : this.caloriesEstimate,
      proteinEstimate: data.proteinEstimate.present
          ? data.proteinEstimate.value
          : this.proteinEstimate,
      carbsEstimate: data.carbsEstimate.present
          ? data.carbsEstimate.value
          : this.carbsEstimate,
      fatEstimate: data.fatEstimate.present
          ? data.fatEstimate.value
          : this.fatEstimate,
      isAiEstimate: data.isAiEstimate.present
          ? data.isAiEstimate.value
          : this.isAiEstimate,
      isUserEdited: data.isUserEdited.present
          ? data.isUserEdited.value
          : this.isUserEdited,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealItem(')
          ..write('id: $id, ')
          ..write('mealLogId: $mealLogId, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('caloriesEstimate: $caloriesEstimate, ')
          ..write('proteinEstimate: $proteinEstimate, ')
          ..write('carbsEstimate: $carbsEstimate, ')
          ..write('fatEstimate: $fatEstimate, ')
          ..write('isAiEstimate: $isAiEstimate, ')
          ..write('isUserEdited: $isUserEdited, ')
          ..write('confidence: $confidence')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mealLogId,
    name,
    portion,
    caloriesEstimate,
    proteinEstimate,
    carbsEstimate,
    fatEstimate,
    isAiEstimate,
    isUserEdited,
    confidence,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealItem &&
          other.id == this.id &&
          other.mealLogId == this.mealLogId &&
          other.name == this.name &&
          other.portion == this.portion &&
          other.caloriesEstimate == this.caloriesEstimate &&
          other.proteinEstimate == this.proteinEstimate &&
          other.carbsEstimate == this.carbsEstimate &&
          other.fatEstimate == this.fatEstimate &&
          other.isAiEstimate == this.isAiEstimate &&
          other.isUserEdited == this.isUserEdited &&
          other.confidence == this.confidence);
}

class MealItemsCompanion extends UpdateCompanion<MealItem> {
  final Value<String> id;
  final Value<String> mealLogId;
  final Value<String> name;
  final Value<String?> portion;
  final Value<int?> caloriesEstimate;
  final Value<int?> proteinEstimate;
  final Value<int?> carbsEstimate;
  final Value<int?> fatEstimate;
  final Value<bool> isAiEstimate;
  final Value<bool> isUserEdited;
  final Value<int?> confidence;
  final Value<int> rowid;
  const MealItemsCompanion({
    this.id = const Value.absent(),
    this.mealLogId = const Value.absent(),
    this.name = const Value.absent(),
    this.portion = const Value.absent(),
    this.caloriesEstimate = const Value.absent(),
    this.proteinEstimate = const Value.absent(),
    this.carbsEstimate = const Value.absent(),
    this.fatEstimate = const Value.absent(),
    this.isAiEstimate = const Value.absent(),
    this.isUserEdited = const Value.absent(),
    this.confidence = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealItemsCompanion.insert({
    required String id,
    required String mealLogId,
    required String name,
    this.portion = const Value.absent(),
    this.caloriesEstimate = const Value.absent(),
    this.proteinEstimate = const Value.absent(),
    this.carbsEstimate = const Value.absent(),
    this.fatEstimate = const Value.absent(),
    this.isAiEstimate = const Value.absent(),
    this.isUserEdited = const Value.absent(),
    this.confidence = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mealLogId = Value(mealLogId),
       name = Value(name);
  static Insertable<MealItem> custom({
    Expression<String>? id,
    Expression<String>? mealLogId,
    Expression<String>? name,
    Expression<String>? portion,
    Expression<int>? caloriesEstimate,
    Expression<int>? proteinEstimate,
    Expression<int>? carbsEstimate,
    Expression<int>? fatEstimate,
    Expression<bool>? isAiEstimate,
    Expression<bool>? isUserEdited,
    Expression<int>? confidence,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealLogId != null) 'meal_log_id': mealLogId,
      if (name != null) 'name': name,
      if (portion != null) 'portion': portion,
      if (caloriesEstimate != null) 'calories_estimate': caloriesEstimate,
      if (proteinEstimate != null) 'protein_estimate': proteinEstimate,
      if (carbsEstimate != null) 'carbs_estimate': carbsEstimate,
      if (fatEstimate != null) 'fat_estimate': fatEstimate,
      if (isAiEstimate != null) 'is_ai_estimate': isAiEstimate,
      if (isUserEdited != null) 'is_user_edited': isUserEdited,
      if (confidence != null) 'confidence': confidence,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? mealLogId,
    Value<String>? name,
    Value<String?>? portion,
    Value<int?>? caloriesEstimate,
    Value<int?>? proteinEstimate,
    Value<int?>? carbsEstimate,
    Value<int?>? fatEstimate,
    Value<bool>? isAiEstimate,
    Value<bool>? isUserEdited,
    Value<int?>? confidence,
    Value<int>? rowid,
  }) {
    return MealItemsCompanion(
      id: id ?? this.id,
      mealLogId: mealLogId ?? this.mealLogId,
      name: name ?? this.name,
      portion: portion ?? this.portion,
      caloriesEstimate: caloriesEstimate ?? this.caloriesEstimate,
      proteinEstimate: proteinEstimate ?? this.proteinEstimate,
      carbsEstimate: carbsEstimate ?? this.carbsEstimate,
      fatEstimate: fatEstimate ?? this.fatEstimate,
      isAiEstimate: isAiEstimate ?? this.isAiEstimate,
      isUserEdited: isUserEdited ?? this.isUserEdited,
      confidence: confidence ?? this.confidence,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mealLogId.present) {
      map['meal_log_id'] = Variable<String>(mealLogId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (portion.present) {
      map['portion'] = Variable<String>(portion.value);
    }
    if (caloriesEstimate.present) {
      map['calories_estimate'] = Variable<int>(caloriesEstimate.value);
    }
    if (proteinEstimate.present) {
      map['protein_estimate'] = Variable<int>(proteinEstimate.value);
    }
    if (carbsEstimate.present) {
      map['carbs_estimate'] = Variable<int>(carbsEstimate.value);
    }
    if (fatEstimate.present) {
      map['fat_estimate'] = Variable<int>(fatEstimate.value);
    }
    if (isAiEstimate.present) {
      map['is_ai_estimate'] = Variable<bool>(isAiEstimate.value);
    }
    if (isUserEdited.present) {
      map['is_user_edited'] = Variable<bool>(isUserEdited.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealItemsCompanion(')
          ..write('id: $id, ')
          ..write('mealLogId: $mealLogId, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('caloriesEstimate: $caloriesEstimate, ')
          ..write('proteinEstimate: $proteinEstimate, ')
          ..write('carbsEstimate: $carbsEstimate, ')
          ..write('fatEstimate: $fatEstimate, ')
          ..write('isAiEstimate: $isAiEstimate, ')
          ..write('isUserEdited: $isUserEdited, ')
          ..write('confidence: $confidence, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutLogsTable extends WorkoutLogs
    with TableInfo<$WorkoutLogsTable, WorkoutLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyLogIdMeta = const VerificationMeta(
    'dailyLogId',
  );
  @override
  late final GeneratedColumn<String> dailyLogId = GeneratedColumn<String>(
    'daily_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES daily_logs (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _intensityMeta = const VerificationMeta(
    'intensity',
  );
  @override
  late final GeneratedColumn<int> intensity = GeneratedColumn<int>(
    'intensity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesBurnedMeta = const VerificationMeta(
    'caloriesBurned',
  );
  @override
  late final GeneratedColumn<int> caloriesBurned = GeneratedColumn<int>(
    'calories_burned',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyLogId,
    date,
    type,
    duration,
    intensity,
    notes,
    source,
    caloriesBurned,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('daily_log_id')) {
      context.handle(
        _dailyLogIdMeta,
        dailyLogId.isAcceptableOrUnknown(
          data['daily_log_id']!,
          _dailyLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyLogIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('intensity')) {
      context.handle(
        _intensityMeta,
        intensity.isAcceptableOrUnknown(data['intensity']!, _intensityMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('calories_burned')) {
      context.handle(
        _caloriesBurnedMeta,
        caloriesBurned.isAcceptableOrUnknown(
          data['calories_burned']!,
          _caloriesBurnedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dailyLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_log_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      )!,
      intensity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intensity'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      caloriesBurned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories_burned'],
      ),
    );
  }

  @override
  $WorkoutLogsTable createAlias(String alias) {
    return $WorkoutLogsTable(attachedDatabase, alias);
  }
}

class WorkoutLog extends DataClass implements Insertable<WorkoutLog> {
  final String id;
  final String dailyLogId;
  final DateTime date;
  final String type;
  final int duration;
  final int? intensity;
  final String? notes;
  final String source;
  final int? caloriesBurned;
  const WorkoutLog({
    required this.id,
    required this.dailyLogId,
    required this.date,
    required this.type,
    required this.duration,
    this.intensity,
    this.notes,
    required this.source,
    this.caloriesBurned,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['daily_log_id'] = Variable<String>(dailyLogId);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    map['duration'] = Variable<int>(duration);
    if (!nullToAbsent || intensity != null) {
      map['intensity'] = Variable<int>(intensity);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || caloriesBurned != null) {
      map['calories_burned'] = Variable<int>(caloriesBurned);
    }
    return map;
  }

  WorkoutLogsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutLogsCompanion(
      id: Value(id),
      dailyLogId: Value(dailyLogId),
      date: Value(date),
      type: Value(type),
      duration: Value(duration),
      intensity: intensity == null && nullToAbsent
          ? const Value.absent()
          : Value(intensity),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      source: Value(source),
      caloriesBurned: caloriesBurned == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesBurned),
    );
  }

  factory WorkoutLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutLog(
      id: serializer.fromJson<String>(json['id']),
      dailyLogId: serializer.fromJson<String>(json['dailyLogId']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      duration: serializer.fromJson<int>(json['duration']),
      intensity: serializer.fromJson<int?>(json['intensity']),
      notes: serializer.fromJson<String?>(json['notes']),
      source: serializer.fromJson<String>(json['source']),
      caloriesBurned: serializer.fromJson<int?>(json['caloriesBurned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dailyLogId': serializer.toJson<String>(dailyLogId),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'duration': serializer.toJson<int>(duration),
      'intensity': serializer.toJson<int?>(intensity),
      'notes': serializer.toJson<String?>(notes),
      'source': serializer.toJson<String>(source),
      'caloriesBurned': serializer.toJson<int?>(caloriesBurned),
    };
  }

  WorkoutLog copyWith({
    String? id,
    String? dailyLogId,
    DateTime? date,
    String? type,
    int? duration,
    Value<int?> intensity = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? source,
    Value<int?> caloriesBurned = const Value.absent(),
  }) => WorkoutLog(
    id: id ?? this.id,
    dailyLogId: dailyLogId ?? this.dailyLogId,
    date: date ?? this.date,
    type: type ?? this.type,
    duration: duration ?? this.duration,
    intensity: intensity.present ? intensity.value : this.intensity,
    notes: notes.present ? notes.value : this.notes,
    source: source ?? this.source,
    caloriesBurned: caloriesBurned.present
        ? caloriesBurned.value
        : this.caloriesBurned,
  );
  WorkoutLog copyWithCompanion(WorkoutLogsCompanion data) {
    return WorkoutLog(
      id: data.id.present ? data.id.value : this.id,
      dailyLogId: data.dailyLogId.present
          ? data.dailyLogId.value
          : this.dailyLogId,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      duration: data.duration.present ? data.duration.value : this.duration,
      intensity: data.intensity.present ? data.intensity.value : this.intensity,
      notes: data.notes.present ? data.notes.value : this.notes,
      source: data.source.present ? data.source.value : this.source,
      caloriesBurned: data.caloriesBurned.present
          ? data.caloriesBurned.value
          : this.caloriesBurned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLog(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('duration: $duration, ')
          ..write('intensity: $intensity, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('caloriesBurned: $caloriesBurned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyLogId,
    date,
    type,
    duration,
    intensity,
    notes,
    source,
    caloriesBurned,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutLog &&
          other.id == this.id &&
          other.dailyLogId == this.dailyLogId &&
          other.date == this.date &&
          other.type == this.type &&
          other.duration == this.duration &&
          other.intensity == this.intensity &&
          other.notes == this.notes &&
          other.source == this.source &&
          other.caloriesBurned == this.caloriesBurned);
}

class WorkoutLogsCompanion extends UpdateCompanion<WorkoutLog> {
  final Value<String> id;
  final Value<String> dailyLogId;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<int> duration;
  final Value<int?> intensity;
  final Value<String?> notes;
  final Value<String> source;
  final Value<int?> caloriesBurned;
  final Value<int> rowid;
  const WorkoutLogsCompanion({
    this.id = const Value.absent(),
    this.dailyLogId = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.duration = const Value.absent(),
    this.intensity = const Value.absent(),
    this.notes = const Value.absent(),
    this.source = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutLogsCompanion.insert({
    required String id,
    required String dailyLogId,
    required DateTime date,
    required String type,
    required int duration,
    this.intensity = const Value.absent(),
    this.notes = const Value.absent(),
    required String source,
    this.caloriesBurned = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dailyLogId = Value(dailyLogId),
       date = Value(date),
       type = Value(type),
       duration = Value(duration),
       source = Value(source);
  static Insertable<WorkoutLog> custom({
    Expression<String>? id,
    Expression<String>? dailyLogId,
    Expression<DateTime>? date,
    Expression<String>? type,
    Expression<int>? duration,
    Expression<int>? intensity,
    Expression<String>? notes,
    Expression<String>? source,
    Expression<int>? caloriesBurned,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyLogId != null) 'daily_log_id': dailyLogId,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (duration != null) 'duration': duration,
      if (intensity != null) 'intensity': intensity,
      if (notes != null) 'notes': notes,
      if (source != null) 'source': source,
      if (caloriesBurned != null) 'calories_burned': caloriesBurned,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? dailyLogId,
    Value<DateTime>? date,
    Value<String>? type,
    Value<int>? duration,
    Value<int?>? intensity,
    Value<String?>? notes,
    Value<String>? source,
    Value<int?>? caloriesBurned,
    Value<int>? rowid,
  }) {
    return WorkoutLogsCompanion(
      id: id ?? this.id,
      dailyLogId: dailyLogId ?? this.dailyLogId,
      date: date ?? this.date,
      type: type ?? this.type,
      duration: duration ?? this.duration,
      intensity: intensity ?? this.intensity,
      notes: notes ?? this.notes,
      source: source ?? this.source,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dailyLogId.present) {
      map['daily_log_id'] = Variable<String>(dailyLogId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (intensity.present) {
      map['intensity'] = Variable<int>(intensity.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (caloriesBurned.present) {
      map['calories_burned'] = Variable<int>(caloriesBurned.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLogsCompanion(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('duration: $duration, ')
          ..write('intensity: $intensity, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecoveryMetricsTableTable extends RecoveryMetricsTable
    with TableInfo<$RecoveryMetricsTableTable, RecoveryMetricsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecoveryMetricsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyLogIdMeta = const VerificationMeta(
    'dailyLogId',
  );
  @override
  late final GeneratedColumn<String> dailyLogId = GeneratedColumn<String>(
    'daily_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES daily_logs (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sleepDurationMeta = const VerificationMeta(
    'sleepDuration',
  );
  @override
  late final GeneratedColumn<double> sleepDuration = GeneratedColumn<double>(
    'sleep_duration',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleepQualityMeta = const VerificationMeta(
    'sleepQuality',
  );
  @override
  late final GeneratedColumn<int> sleepQuality = GeneratedColumn<int>(
    'sleep_quality',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hrvMeta = const VerificationMeta('hrv');
  @override
  late final GeneratedColumn<int> hrv = GeneratedColumn<int>(
    'hrv',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restingHRMeta = const VerificationMeta(
    'restingHR',
  );
  @override
  late final GeneratedColumn<int> restingHR = GeneratedColumn<int>(
    'resting_h_r',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeEnergyMeta = const VerificationMeta(
    'activeEnergy',
  );
  @override
  late final GeneratedColumn<int> activeEnergy = GeneratedColumn<int>(
    'active_energy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workoutsCountMeta = const VerificationMeta(
    'workoutsCount',
  );
  @override
  late final GeneratedColumn<int> workoutsCount = GeneratedColumn<int>(
    'workouts_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataSourceMeta = const VerificationMeta(
    'dataSource',
  );
  @override
  late final GeneratedColumn<String> dataSource = GeneratedColumn<String>(
    'data_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyLogId,
    date,
    fetchedAt,
    sleepDuration,
    sleepQuality,
    hrv,
    restingHR,
    steps,
    activeEnergy,
    workoutsCount,
    dataSource,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recovery_metrics';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecoveryMetricsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('daily_log_id')) {
      context.handle(
        _dailyLogIdMeta,
        dailyLogId.isAcceptableOrUnknown(
          data['daily_log_id']!,
          _dailyLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyLogIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    if (data.containsKey('sleep_duration')) {
      context.handle(
        _sleepDurationMeta,
        sleepDuration.isAcceptableOrUnknown(
          data['sleep_duration']!,
          _sleepDurationMeta,
        ),
      );
    }
    if (data.containsKey('sleep_quality')) {
      context.handle(
        _sleepQualityMeta,
        sleepQuality.isAcceptableOrUnknown(
          data['sleep_quality']!,
          _sleepQualityMeta,
        ),
      );
    }
    if (data.containsKey('hrv')) {
      context.handle(
        _hrvMeta,
        hrv.isAcceptableOrUnknown(data['hrv']!, _hrvMeta),
      );
    }
    if (data.containsKey('resting_h_r')) {
      context.handle(
        _restingHRMeta,
        restingHR.isAcceptableOrUnknown(data['resting_h_r']!, _restingHRMeta),
      );
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    }
    if (data.containsKey('active_energy')) {
      context.handle(
        _activeEnergyMeta,
        activeEnergy.isAcceptableOrUnknown(
          data['active_energy']!,
          _activeEnergyMeta,
        ),
      );
    }
    if (data.containsKey('workouts_count')) {
      context.handle(
        _workoutsCountMeta,
        workoutsCount.isAcceptableOrUnknown(
          data['workouts_count']!,
          _workoutsCountMeta,
        ),
      );
    }
    if (data.containsKey('data_source')) {
      context.handle(
        _dataSourceMeta,
        dataSource.isAcceptableOrUnknown(data['data_source']!, _dataSourceMeta),
      );
    } else if (isInserting) {
      context.missing(_dataSourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecoveryMetricsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecoveryMetricsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dailyLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_log_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
      sleepDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sleep_duration'],
      ),
      sleepQuality: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep_quality'],
      ),
      hrv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hrv'],
      ),
      restingHR: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}resting_h_r'],
      ),
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      ),
      activeEnergy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}active_energy'],
      ),
      workoutsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workouts_count'],
      ),
      dataSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_source'],
      )!,
    );
  }

  @override
  $RecoveryMetricsTableTable createAlias(String alias) {
    return $RecoveryMetricsTableTable(attachedDatabase, alias);
  }
}

class RecoveryMetricsTableData extends DataClass
    implements Insertable<RecoveryMetricsTableData> {
  final String id;
  final String dailyLogId;
  final DateTime date;
  final DateTime fetchedAt;
  final double? sleepDuration;
  final int? sleepQuality;
  final int? hrv;
  final int? restingHR;
  final int? steps;
  final int? activeEnergy;
  final int? workoutsCount;
  final String dataSource;
  const RecoveryMetricsTableData({
    required this.id,
    required this.dailyLogId,
    required this.date,
    required this.fetchedAt,
    this.sleepDuration,
    this.sleepQuality,
    this.hrv,
    this.restingHR,
    this.steps,
    this.activeEnergy,
    this.workoutsCount,
    required this.dataSource,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['daily_log_id'] = Variable<String>(dailyLogId);
    map['date'] = Variable<DateTime>(date);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    if (!nullToAbsent || sleepDuration != null) {
      map['sleep_duration'] = Variable<double>(sleepDuration);
    }
    if (!nullToAbsent || sleepQuality != null) {
      map['sleep_quality'] = Variable<int>(sleepQuality);
    }
    if (!nullToAbsent || hrv != null) {
      map['hrv'] = Variable<int>(hrv);
    }
    if (!nullToAbsent || restingHR != null) {
      map['resting_h_r'] = Variable<int>(restingHR);
    }
    if (!nullToAbsent || steps != null) {
      map['steps'] = Variable<int>(steps);
    }
    if (!nullToAbsent || activeEnergy != null) {
      map['active_energy'] = Variable<int>(activeEnergy);
    }
    if (!nullToAbsent || workoutsCount != null) {
      map['workouts_count'] = Variable<int>(workoutsCount);
    }
    map['data_source'] = Variable<String>(dataSource);
    return map;
  }

  RecoveryMetricsTableCompanion toCompanion(bool nullToAbsent) {
    return RecoveryMetricsTableCompanion(
      id: Value(id),
      dailyLogId: Value(dailyLogId),
      date: Value(date),
      fetchedAt: Value(fetchedAt),
      sleepDuration: sleepDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepDuration),
      sleepQuality: sleepQuality == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepQuality),
      hrv: hrv == null && nullToAbsent ? const Value.absent() : Value(hrv),
      restingHR: restingHR == null && nullToAbsent
          ? const Value.absent()
          : Value(restingHR),
      steps: steps == null && nullToAbsent
          ? const Value.absent()
          : Value(steps),
      activeEnergy: activeEnergy == null && nullToAbsent
          ? const Value.absent()
          : Value(activeEnergy),
      workoutsCount: workoutsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutsCount),
      dataSource: Value(dataSource),
    );
  }

  factory RecoveryMetricsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecoveryMetricsTableData(
      id: serializer.fromJson<String>(json['id']),
      dailyLogId: serializer.fromJson<String>(json['dailyLogId']),
      date: serializer.fromJson<DateTime>(json['date']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
      sleepDuration: serializer.fromJson<double?>(json['sleepDuration']),
      sleepQuality: serializer.fromJson<int?>(json['sleepQuality']),
      hrv: serializer.fromJson<int?>(json['hrv']),
      restingHR: serializer.fromJson<int?>(json['restingHR']),
      steps: serializer.fromJson<int?>(json['steps']),
      activeEnergy: serializer.fromJson<int?>(json['activeEnergy']),
      workoutsCount: serializer.fromJson<int?>(json['workoutsCount']),
      dataSource: serializer.fromJson<String>(json['dataSource']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dailyLogId': serializer.toJson<String>(dailyLogId),
      'date': serializer.toJson<DateTime>(date),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
      'sleepDuration': serializer.toJson<double?>(sleepDuration),
      'sleepQuality': serializer.toJson<int?>(sleepQuality),
      'hrv': serializer.toJson<int?>(hrv),
      'restingHR': serializer.toJson<int?>(restingHR),
      'steps': serializer.toJson<int?>(steps),
      'activeEnergy': serializer.toJson<int?>(activeEnergy),
      'workoutsCount': serializer.toJson<int?>(workoutsCount),
      'dataSource': serializer.toJson<String>(dataSource),
    };
  }

  RecoveryMetricsTableData copyWith({
    String? id,
    String? dailyLogId,
    DateTime? date,
    DateTime? fetchedAt,
    Value<double?> sleepDuration = const Value.absent(),
    Value<int?> sleepQuality = const Value.absent(),
    Value<int?> hrv = const Value.absent(),
    Value<int?> restingHR = const Value.absent(),
    Value<int?> steps = const Value.absent(),
    Value<int?> activeEnergy = const Value.absent(),
    Value<int?> workoutsCount = const Value.absent(),
    String? dataSource,
  }) => RecoveryMetricsTableData(
    id: id ?? this.id,
    dailyLogId: dailyLogId ?? this.dailyLogId,
    date: date ?? this.date,
    fetchedAt: fetchedAt ?? this.fetchedAt,
    sleepDuration: sleepDuration.present
        ? sleepDuration.value
        : this.sleepDuration,
    sleepQuality: sleepQuality.present ? sleepQuality.value : this.sleepQuality,
    hrv: hrv.present ? hrv.value : this.hrv,
    restingHR: restingHR.present ? restingHR.value : this.restingHR,
    steps: steps.present ? steps.value : this.steps,
    activeEnergy: activeEnergy.present ? activeEnergy.value : this.activeEnergy,
    workoutsCount: workoutsCount.present
        ? workoutsCount.value
        : this.workoutsCount,
    dataSource: dataSource ?? this.dataSource,
  );
  RecoveryMetricsTableData copyWithCompanion(
    RecoveryMetricsTableCompanion data,
  ) {
    return RecoveryMetricsTableData(
      id: data.id.present ? data.id.value : this.id,
      dailyLogId: data.dailyLogId.present
          ? data.dailyLogId.value
          : this.dailyLogId,
      date: data.date.present ? data.date.value : this.date,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
      sleepDuration: data.sleepDuration.present
          ? data.sleepDuration.value
          : this.sleepDuration,
      sleepQuality: data.sleepQuality.present
          ? data.sleepQuality.value
          : this.sleepQuality,
      hrv: data.hrv.present ? data.hrv.value : this.hrv,
      restingHR: data.restingHR.present ? data.restingHR.value : this.restingHR,
      steps: data.steps.present ? data.steps.value : this.steps,
      activeEnergy: data.activeEnergy.present
          ? data.activeEnergy.value
          : this.activeEnergy,
      workoutsCount: data.workoutsCount.present
          ? data.workoutsCount.value
          : this.workoutsCount,
      dataSource: data.dataSource.present
          ? data.dataSource.value
          : this.dataSource,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecoveryMetricsTableData(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('date: $date, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('sleepDuration: $sleepDuration, ')
          ..write('sleepQuality: $sleepQuality, ')
          ..write('hrv: $hrv, ')
          ..write('restingHR: $restingHR, ')
          ..write('steps: $steps, ')
          ..write('activeEnergy: $activeEnergy, ')
          ..write('workoutsCount: $workoutsCount, ')
          ..write('dataSource: $dataSource')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyLogId,
    date,
    fetchedAt,
    sleepDuration,
    sleepQuality,
    hrv,
    restingHR,
    steps,
    activeEnergy,
    workoutsCount,
    dataSource,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecoveryMetricsTableData &&
          other.id == this.id &&
          other.dailyLogId == this.dailyLogId &&
          other.date == this.date &&
          other.fetchedAt == this.fetchedAt &&
          other.sleepDuration == this.sleepDuration &&
          other.sleepQuality == this.sleepQuality &&
          other.hrv == this.hrv &&
          other.restingHR == this.restingHR &&
          other.steps == this.steps &&
          other.activeEnergy == this.activeEnergy &&
          other.workoutsCount == this.workoutsCount &&
          other.dataSource == this.dataSource);
}

class RecoveryMetricsTableCompanion
    extends UpdateCompanion<RecoveryMetricsTableData> {
  final Value<String> id;
  final Value<String> dailyLogId;
  final Value<DateTime> date;
  final Value<DateTime> fetchedAt;
  final Value<double?> sleepDuration;
  final Value<int?> sleepQuality;
  final Value<int?> hrv;
  final Value<int?> restingHR;
  final Value<int?> steps;
  final Value<int?> activeEnergy;
  final Value<int?> workoutsCount;
  final Value<String> dataSource;
  final Value<int> rowid;
  const RecoveryMetricsTableCompanion({
    this.id = const Value.absent(),
    this.dailyLogId = const Value.absent(),
    this.date = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.sleepDuration = const Value.absent(),
    this.sleepQuality = const Value.absent(),
    this.hrv = const Value.absent(),
    this.restingHR = const Value.absent(),
    this.steps = const Value.absent(),
    this.activeEnergy = const Value.absent(),
    this.workoutsCount = const Value.absent(),
    this.dataSource = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecoveryMetricsTableCompanion.insert({
    required String id,
    required String dailyLogId,
    required DateTime date,
    required DateTime fetchedAt,
    this.sleepDuration = const Value.absent(),
    this.sleepQuality = const Value.absent(),
    this.hrv = const Value.absent(),
    this.restingHR = const Value.absent(),
    this.steps = const Value.absent(),
    this.activeEnergy = const Value.absent(),
    this.workoutsCount = const Value.absent(),
    required String dataSource,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dailyLogId = Value(dailyLogId),
       date = Value(date),
       fetchedAt = Value(fetchedAt),
       dataSource = Value(dataSource);
  static Insertable<RecoveryMetricsTableData> custom({
    Expression<String>? id,
    Expression<String>? dailyLogId,
    Expression<DateTime>? date,
    Expression<DateTime>? fetchedAt,
    Expression<double>? sleepDuration,
    Expression<int>? sleepQuality,
    Expression<int>? hrv,
    Expression<int>? restingHR,
    Expression<int>? steps,
    Expression<int>? activeEnergy,
    Expression<int>? workoutsCount,
    Expression<String>? dataSource,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyLogId != null) 'daily_log_id': dailyLogId,
      if (date != null) 'date': date,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (sleepDuration != null) 'sleep_duration': sleepDuration,
      if (sleepQuality != null) 'sleep_quality': sleepQuality,
      if (hrv != null) 'hrv': hrv,
      if (restingHR != null) 'resting_h_r': restingHR,
      if (steps != null) 'steps': steps,
      if (activeEnergy != null) 'active_energy': activeEnergy,
      if (workoutsCount != null) 'workouts_count': workoutsCount,
      if (dataSource != null) 'data_source': dataSource,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecoveryMetricsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? dailyLogId,
    Value<DateTime>? date,
    Value<DateTime>? fetchedAt,
    Value<double?>? sleepDuration,
    Value<int?>? sleepQuality,
    Value<int?>? hrv,
    Value<int?>? restingHR,
    Value<int?>? steps,
    Value<int?>? activeEnergy,
    Value<int?>? workoutsCount,
    Value<String>? dataSource,
    Value<int>? rowid,
  }) {
    return RecoveryMetricsTableCompanion(
      id: id ?? this.id,
      dailyLogId: dailyLogId ?? this.dailyLogId,
      date: date ?? this.date,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      sleepDuration: sleepDuration ?? this.sleepDuration,
      sleepQuality: sleepQuality ?? this.sleepQuality,
      hrv: hrv ?? this.hrv,
      restingHR: restingHR ?? this.restingHR,
      steps: steps ?? this.steps,
      activeEnergy: activeEnergy ?? this.activeEnergy,
      workoutsCount: workoutsCount ?? this.workoutsCount,
      dataSource: dataSource ?? this.dataSource,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dailyLogId.present) {
      map['daily_log_id'] = Variable<String>(dailyLogId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (sleepDuration.present) {
      map['sleep_duration'] = Variable<double>(sleepDuration.value);
    }
    if (sleepQuality.present) {
      map['sleep_quality'] = Variable<int>(sleepQuality.value);
    }
    if (hrv.present) {
      map['hrv'] = Variable<int>(hrv.value);
    }
    if (restingHR.present) {
      map['resting_h_r'] = Variable<int>(restingHR.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (activeEnergy.present) {
      map['active_energy'] = Variable<int>(activeEnergy.value);
    }
    if (workoutsCount.present) {
      map['workouts_count'] = Variable<int>(workoutsCount.value);
    }
    if (dataSource.present) {
      map['data_source'] = Variable<String>(dataSource.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecoveryMetricsTableCompanion(')
          ..write('id: $id, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('date: $date, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('sleepDuration: $sleepDuration, ')
          ..write('sleepQuality: $sleepQuality, ')
          ..write('hrv: $hrv, ')
          ..write('restingHR: $restingHR, ')
          ..write('steps: $steps, ')
          ..write('activeEnergy: $activeEnergy, ')
          ..write('workoutsCount: $workoutsCount, ')
          ..write('dataSource: $dataSource, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyBriefsTable extends DailyBriefs
    with TableInfo<$DailyBriefsTable, DailyBrief> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyBriefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recoveryScoreMeta = const VerificationMeta(
    'recoveryScore',
  );
  @override
  late final GeneratedColumn<int> recoveryScore = GeneratedColumn<int>(
    'recovery_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readinessScoreMeta = const VerificationMeta(
    'readinessScore',
  );
  @override
  late final GeneratedColumn<int> readinessScore = GeneratedColumn<int>(
    'readiness_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topActionsJsonMeta = const VerificationMeta(
    'topActionsJson',
  );
  @override
  late final GeneratedColumn<String> topActionsJson = GeneratedColumn<String>(
    'top_actions_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warningsJsonMeta = const VerificationMeta(
    'warningsJson',
  );
  @override
  late final GeneratedColumn<String> warningsJson = GeneratedColumn<String>(
    'warnings_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _suggestedIntensityMeta =
      const VerificationMeta('suggestedIntensity');
  @override
  late final GeneratedColumn<int> suggestedIntensity = GeneratedColumn<int>(
    'suggested_intensity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coachingTextMeta = const VerificationMeta(
    'coachingText',
  );
  @override
  late final GeneratedColumn<String> coachingText = GeneratedColumn<String>(
    'coaching_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isAiGeneratedMeta = const VerificationMeta(
    'isAiGenerated',
  );
  @override
  late final GeneratedColumn<bool> isAiGenerated = GeneratedColumn<bool>(
    'is_ai_generated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_ai_generated" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _dailyLogIdMeta = const VerificationMeta(
    'dailyLogId',
  );
  @override
  late final GeneratedColumn<String> dailyLogId = GeneratedColumn<String>(
    'daily_log_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    generatedAt,
    recoveryScore,
    readinessScore,
    topActionsJson,
    warningsJson,
    suggestedIntensity,
    coachingText,
    isAiGenerated,
    dailyLogId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_briefs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyBrief> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('recovery_score')) {
      context.handle(
        _recoveryScoreMeta,
        recoveryScore.isAcceptableOrUnknown(
          data['recovery_score']!,
          _recoveryScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recoveryScoreMeta);
    }
    if (data.containsKey('readiness_score')) {
      context.handle(
        _readinessScoreMeta,
        readinessScore.isAcceptableOrUnknown(
          data['readiness_score']!,
          _readinessScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_readinessScoreMeta);
    }
    if (data.containsKey('top_actions_json')) {
      context.handle(
        _topActionsJsonMeta,
        topActionsJson.isAcceptableOrUnknown(
          data['top_actions_json']!,
          _topActionsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_topActionsJsonMeta);
    }
    if (data.containsKey('warnings_json')) {
      context.handle(
        _warningsJsonMeta,
        warningsJson.isAcceptableOrUnknown(
          data['warnings_json']!,
          _warningsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warningsJsonMeta);
    }
    if (data.containsKey('suggested_intensity')) {
      context.handle(
        _suggestedIntensityMeta,
        suggestedIntensity.isAcceptableOrUnknown(
          data['suggested_intensity']!,
          _suggestedIntensityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_suggestedIntensityMeta);
    }
    if (data.containsKey('coaching_text')) {
      context.handle(
        _coachingTextMeta,
        coachingText.isAcceptableOrUnknown(
          data['coaching_text']!,
          _coachingTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_coachingTextMeta);
    }
    if (data.containsKey('is_ai_generated')) {
      context.handle(
        _isAiGeneratedMeta,
        isAiGenerated.isAcceptableOrUnknown(
          data['is_ai_generated']!,
          _isAiGeneratedMeta,
        ),
      );
    }
    if (data.containsKey('daily_log_id')) {
      context.handle(
        _dailyLogIdMeta,
        dailyLogId.isAcceptableOrUnknown(
          data['daily_log_id']!,
          _dailyLogIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyBrief map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyBrief(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
      recoveryScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recovery_score'],
      )!,
      readinessScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}readiness_score'],
      )!,
      topActionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}top_actions_json'],
      )!,
      warningsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warnings_json'],
      )!,
      suggestedIntensity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}suggested_intensity'],
      )!,
      coachingText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coaching_text'],
      )!,
      isAiGenerated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_ai_generated'],
      )!,
      dailyLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_log_id'],
      ),
    );
  }

  @override
  $DailyBriefsTable createAlias(String alias) {
    return $DailyBriefsTable(attachedDatabase, alias);
  }
}

class DailyBrief extends DataClass implements Insertable<DailyBrief> {
  final String id;
  final DateTime date;
  final DateTime generatedAt;
  final int recoveryScore;
  final int readinessScore;
  final String topActionsJson;
  final String warningsJson;
  final int suggestedIntensity;
  final String coachingText;
  final bool isAiGenerated;
  final String? dailyLogId;
  const DailyBrief({
    required this.id,
    required this.date,
    required this.generatedAt,
    required this.recoveryScore,
    required this.readinessScore,
    required this.topActionsJson,
    required this.warningsJson,
    required this.suggestedIntensity,
    required this.coachingText,
    required this.isAiGenerated,
    this.dailyLogId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['recovery_score'] = Variable<int>(recoveryScore);
    map['readiness_score'] = Variable<int>(readinessScore);
    map['top_actions_json'] = Variable<String>(topActionsJson);
    map['warnings_json'] = Variable<String>(warningsJson);
    map['suggested_intensity'] = Variable<int>(suggestedIntensity);
    map['coaching_text'] = Variable<String>(coachingText);
    map['is_ai_generated'] = Variable<bool>(isAiGenerated);
    if (!nullToAbsent || dailyLogId != null) {
      map['daily_log_id'] = Variable<String>(dailyLogId);
    }
    return map;
  }

  DailyBriefsCompanion toCompanion(bool nullToAbsent) {
    return DailyBriefsCompanion(
      id: Value(id),
      date: Value(date),
      generatedAt: Value(generatedAt),
      recoveryScore: Value(recoveryScore),
      readinessScore: Value(readinessScore),
      topActionsJson: Value(topActionsJson),
      warningsJson: Value(warningsJson),
      suggestedIntensity: Value(suggestedIntensity),
      coachingText: Value(coachingText),
      isAiGenerated: Value(isAiGenerated),
      dailyLogId: dailyLogId == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyLogId),
    );
  }

  factory DailyBrief.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyBrief(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      recoveryScore: serializer.fromJson<int>(json['recoveryScore']),
      readinessScore: serializer.fromJson<int>(json['readinessScore']),
      topActionsJson: serializer.fromJson<String>(json['topActionsJson']),
      warningsJson: serializer.fromJson<String>(json['warningsJson']),
      suggestedIntensity: serializer.fromJson<int>(json['suggestedIntensity']),
      coachingText: serializer.fromJson<String>(json['coachingText']),
      isAiGenerated: serializer.fromJson<bool>(json['isAiGenerated']),
      dailyLogId: serializer.fromJson<String?>(json['dailyLogId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'recoveryScore': serializer.toJson<int>(recoveryScore),
      'readinessScore': serializer.toJson<int>(readinessScore),
      'topActionsJson': serializer.toJson<String>(topActionsJson),
      'warningsJson': serializer.toJson<String>(warningsJson),
      'suggestedIntensity': serializer.toJson<int>(suggestedIntensity),
      'coachingText': serializer.toJson<String>(coachingText),
      'isAiGenerated': serializer.toJson<bool>(isAiGenerated),
      'dailyLogId': serializer.toJson<String?>(dailyLogId),
    };
  }

  DailyBrief copyWith({
    String? id,
    DateTime? date,
    DateTime? generatedAt,
    int? recoveryScore,
    int? readinessScore,
    String? topActionsJson,
    String? warningsJson,
    int? suggestedIntensity,
    String? coachingText,
    bool? isAiGenerated,
    Value<String?> dailyLogId = const Value.absent(),
  }) => DailyBrief(
    id: id ?? this.id,
    date: date ?? this.date,
    generatedAt: generatedAt ?? this.generatedAt,
    recoveryScore: recoveryScore ?? this.recoveryScore,
    readinessScore: readinessScore ?? this.readinessScore,
    topActionsJson: topActionsJson ?? this.topActionsJson,
    warningsJson: warningsJson ?? this.warningsJson,
    suggestedIntensity: suggestedIntensity ?? this.suggestedIntensity,
    coachingText: coachingText ?? this.coachingText,
    isAiGenerated: isAiGenerated ?? this.isAiGenerated,
    dailyLogId: dailyLogId.present ? dailyLogId.value : this.dailyLogId,
  );
  DailyBrief copyWithCompanion(DailyBriefsCompanion data) {
    return DailyBrief(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
      recoveryScore: data.recoveryScore.present
          ? data.recoveryScore.value
          : this.recoveryScore,
      readinessScore: data.readinessScore.present
          ? data.readinessScore.value
          : this.readinessScore,
      topActionsJson: data.topActionsJson.present
          ? data.topActionsJson.value
          : this.topActionsJson,
      warningsJson: data.warningsJson.present
          ? data.warningsJson.value
          : this.warningsJson,
      suggestedIntensity: data.suggestedIntensity.present
          ? data.suggestedIntensity.value
          : this.suggestedIntensity,
      coachingText: data.coachingText.present
          ? data.coachingText.value
          : this.coachingText,
      isAiGenerated: data.isAiGenerated.present
          ? data.isAiGenerated.value
          : this.isAiGenerated,
      dailyLogId: data.dailyLogId.present
          ? data.dailyLogId.value
          : this.dailyLogId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyBrief(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('recoveryScore: $recoveryScore, ')
          ..write('readinessScore: $readinessScore, ')
          ..write('topActionsJson: $topActionsJson, ')
          ..write('warningsJson: $warningsJson, ')
          ..write('suggestedIntensity: $suggestedIntensity, ')
          ..write('coachingText: $coachingText, ')
          ..write('isAiGenerated: $isAiGenerated, ')
          ..write('dailyLogId: $dailyLogId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    generatedAt,
    recoveryScore,
    readinessScore,
    topActionsJson,
    warningsJson,
    suggestedIntensity,
    coachingText,
    isAiGenerated,
    dailyLogId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyBrief &&
          other.id == this.id &&
          other.date == this.date &&
          other.generatedAt == this.generatedAt &&
          other.recoveryScore == this.recoveryScore &&
          other.readinessScore == this.readinessScore &&
          other.topActionsJson == this.topActionsJson &&
          other.warningsJson == this.warningsJson &&
          other.suggestedIntensity == this.suggestedIntensity &&
          other.coachingText == this.coachingText &&
          other.isAiGenerated == this.isAiGenerated &&
          other.dailyLogId == this.dailyLogId);
}

class DailyBriefsCompanion extends UpdateCompanion<DailyBrief> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime> generatedAt;
  final Value<int> recoveryScore;
  final Value<int> readinessScore;
  final Value<String> topActionsJson;
  final Value<String> warningsJson;
  final Value<int> suggestedIntensity;
  final Value<String> coachingText;
  final Value<bool> isAiGenerated;
  final Value<String?> dailyLogId;
  final Value<int> rowid;
  const DailyBriefsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.recoveryScore = const Value.absent(),
    this.readinessScore = const Value.absent(),
    this.topActionsJson = const Value.absent(),
    this.warningsJson = const Value.absent(),
    this.suggestedIntensity = const Value.absent(),
    this.coachingText = const Value.absent(),
    this.isAiGenerated = const Value.absent(),
    this.dailyLogId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyBriefsCompanion.insert({
    required String id,
    required DateTime date,
    required DateTime generatedAt,
    required int recoveryScore,
    required int readinessScore,
    required String topActionsJson,
    required String warningsJson,
    required int suggestedIntensity,
    required String coachingText,
    this.isAiGenerated = const Value.absent(),
    this.dailyLogId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       generatedAt = Value(generatedAt),
       recoveryScore = Value(recoveryScore),
       readinessScore = Value(readinessScore),
       topActionsJson = Value(topActionsJson),
       warningsJson = Value(warningsJson),
       suggestedIntensity = Value(suggestedIntensity),
       coachingText = Value(coachingText);
  static Insertable<DailyBrief> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? generatedAt,
    Expression<int>? recoveryScore,
    Expression<int>? readinessScore,
    Expression<String>? topActionsJson,
    Expression<String>? warningsJson,
    Expression<int>? suggestedIntensity,
    Expression<String>? coachingText,
    Expression<bool>? isAiGenerated,
    Expression<String>? dailyLogId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (recoveryScore != null) 'recovery_score': recoveryScore,
      if (readinessScore != null) 'readiness_score': readinessScore,
      if (topActionsJson != null) 'top_actions_json': topActionsJson,
      if (warningsJson != null) 'warnings_json': warningsJson,
      if (suggestedIntensity != null) 'suggested_intensity': suggestedIntensity,
      if (coachingText != null) 'coaching_text': coachingText,
      if (isAiGenerated != null) 'is_ai_generated': isAiGenerated,
      if (dailyLogId != null) 'daily_log_id': dailyLogId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyBriefsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<DateTime>? generatedAt,
    Value<int>? recoveryScore,
    Value<int>? readinessScore,
    Value<String>? topActionsJson,
    Value<String>? warningsJson,
    Value<int>? suggestedIntensity,
    Value<String>? coachingText,
    Value<bool>? isAiGenerated,
    Value<String?>? dailyLogId,
    Value<int>? rowid,
  }) {
    return DailyBriefsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      generatedAt: generatedAt ?? this.generatedAt,
      recoveryScore: recoveryScore ?? this.recoveryScore,
      readinessScore: readinessScore ?? this.readinessScore,
      topActionsJson: topActionsJson ?? this.topActionsJson,
      warningsJson: warningsJson ?? this.warningsJson,
      suggestedIntensity: suggestedIntensity ?? this.suggestedIntensity,
      coachingText: coachingText ?? this.coachingText,
      isAiGenerated: isAiGenerated ?? this.isAiGenerated,
      dailyLogId: dailyLogId ?? this.dailyLogId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (recoveryScore.present) {
      map['recovery_score'] = Variable<int>(recoveryScore.value);
    }
    if (readinessScore.present) {
      map['readiness_score'] = Variable<int>(readinessScore.value);
    }
    if (topActionsJson.present) {
      map['top_actions_json'] = Variable<String>(topActionsJson.value);
    }
    if (warningsJson.present) {
      map['warnings_json'] = Variable<String>(warningsJson.value);
    }
    if (suggestedIntensity.present) {
      map['suggested_intensity'] = Variable<int>(suggestedIntensity.value);
    }
    if (coachingText.present) {
      map['coaching_text'] = Variable<String>(coachingText.value);
    }
    if (isAiGenerated.present) {
      map['is_ai_generated'] = Variable<bool>(isAiGenerated.value);
    }
    if (dailyLogId.present) {
      map['daily_log_id'] = Variable<String>(dailyLogId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyBriefsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('recoveryScore: $recoveryScore, ')
          ..write('readinessScore: $readinessScore, ')
          ..write('topActionsJson: $topActionsJson, ')
          ..write('warningsJson: $warningsJson, ')
          ..write('suggestedIntensity: $suggestedIntensity, ')
          ..write('coachingText: $coachingText, ')
          ..write('isAiGenerated: $isAiGenerated, ')
          ..write('dailyLogId: $dailyLogId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeeklyReportsTable extends WeeklyReports
    with TableInfo<$WeeklyReportsTable, WeeklyReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklyReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekStartDateMeta = const VerificationMeta(
    'weekStartDate',
  );
  @override
  late final GeneratedColumn<DateTime> weekStartDate =
      GeneratedColumn<DateTime>(
        'week_start_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _highlightsJsonMeta = const VerificationMeta(
    'highlightsJson',
  );
  @override
  late final GeneratedColumn<String> highlightsJson = GeneratedColumn<String>(
    'highlights_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _concernsJsonMeta = const VerificationMeta(
    'concernsJson',
  );
  @override
  late final GeneratedColumn<String> concernsJson = GeneratedColumn<String>(
    'concerns_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressAnalysisMeta = const VerificationMeta(
    'progressAnalysis',
  );
  @override
  late final GeneratedColumn<String> progressAnalysis = GeneratedColumn<String>(
    'progress_analysis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextWeekFocusMeta = const VerificationMeta(
    'nextWeekFocus',
  );
  @override
  late final GeneratedColumn<String> nextWeekFocus = GeneratedColumn<String>(
    'next_week_focus',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isAiGeneratedMeta = const VerificationMeta(
    'isAiGenerated',
  );
  @override
  late final GeneratedColumn<bool> isAiGenerated = GeneratedColumn<bool>(
    'is_ai_generated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_ai_generated" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weekStartDate,
    generatedAt,
    summary,
    highlightsJson,
    concernsJson,
    progressAnalysis,
    nextWeekFocus,
    isAiGenerated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeeklyReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('week_start_date')) {
      context.handle(
        _weekStartDateMeta,
        weekStartDate.isAcceptableOrUnknown(
          data['week_start_date']!,
          _weekStartDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weekStartDateMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('highlights_json')) {
      context.handle(
        _highlightsJsonMeta,
        highlightsJson.isAcceptableOrUnknown(
          data['highlights_json']!,
          _highlightsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_highlightsJsonMeta);
    }
    if (data.containsKey('concerns_json')) {
      context.handle(
        _concernsJsonMeta,
        concernsJson.isAcceptableOrUnknown(
          data['concerns_json']!,
          _concernsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_concernsJsonMeta);
    }
    if (data.containsKey('progress_analysis')) {
      context.handle(
        _progressAnalysisMeta,
        progressAnalysis.isAcceptableOrUnknown(
          data['progress_analysis']!,
          _progressAnalysisMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_progressAnalysisMeta);
    }
    if (data.containsKey('next_week_focus')) {
      context.handle(
        _nextWeekFocusMeta,
        nextWeekFocus.isAcceptableOrUnknown(
          data['next_week_focus']!,
          _nextWeekFocusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextWeekFocusMeta);
    }
    if (data.containsKey('is_ai_generated')) {
      context.handle(
        _isAiGeneratedMeta,
        isAiGenerated.isAcceptableOrUnknown(
          data['is_ai_generated']!,
          _isAiGeneratedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeeklyReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklyReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weekStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}week_start_date'],
      )!,
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      highlightsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}highlights_json'],
      )!,
      concernsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concerns_json'],
      )!,
      progressAnalysis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}progress_analysis'],
      )!,
      nextWeekFocus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_week_focus'],
      )!,
      isAiGenerated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_ai_generated'],
      )!,
    );
  }

  @override
  $WeeklyReportsTable createAlias(String alias) {
    return $WeeklyReportsTable(attachedDatabase, alias);
  }
}

class WeeklyReport extends DataClass implements Insertable<WeeklyReport> {
  final String id;
  final DateTime weekStartDate;
  final DateTime generatedAt;
  final String summary;
  final String highlightsJson;
  final String concernsJson;
  final String progressAnalysis;
  final String nextWeekFocus;
  final bool isAiGenerated;
  const WeeklyReport({
    required this.id,
    required this.weekStartDate,
    required this.generatedAt,
    required this.summary,
    required this.highlightsJson,
    required this.concernsJson,
    required this.progressAnalysis,
    required this.nextWeekFocus,
    required this.isAiGenerated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['week_start_date'] = Variable<DateTime>(weekStartDate);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['summary'] = Variable<String>(summary);
    map['highlights_json'] = Variable<String>(highlightsJson);
    map['concerns_json'] = Variable<String>(concernsJson);
    map['progress_analysis'] = Variable<String>(progressAnalysis);
    map['next_week_focus'] = Variable<String>(nextWeekFocus);
    map['is_ai_generated'] = Variable<bool>(isAiGenerated);
    return map;
  }

  WeeklyReportsCompanion toCompanion(bool nullToAbsent) {
    return WeeklyReportsCompanion(
      id: Value(id),
      weekStartDate: Value(weekStartDate),
      generatedAt: Value(generatedAt),
      summary: Value(summary),
      highlightsJson: Value(highlightsJson),
      concernsJson: Value(concernsJson),
      progressAnalysis: Value(progressAnalysis),
      nextWeekFocus: Value(nextWeekFocus),
      isAiGenerated: Value(isAiGenerated),
    );
  }

  factory WeeklyReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklyReport(
      id: serializer.fromJson<String>(json['id']),
      weekStartDate: serializer.fromJson<DateTime>(json['weekStartDate']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      summary: serializer.fromJson<String>(json['summary']),
      highlightsJson: serializer.fromJson<String>(json['highlightsJson']),
      concernsJson: serializer.fromJson<String>(json['concernsJson']),
      progressAnalysis: serializer.fromJson<String>(json['progressAnalysis']),
      nextWeekFocus: serializer.fromJson<String>(json['nextWeekFocus']),
      isAiGenerated: serializer.fromJson<bool>(json['isAiGenerated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weekStartDate': serializer.toJson<DateTime>(weekStartDate),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'summary': serializer.toJson<String>(summary),
      'highlightsJson': serializer.toJson<String>(highlightsJson),
      'concernsJson': serializer.toJson<String>(concernsJson),
      'progressAnalysis': serializer.toJson<String>(progressAnalysis),
      'nextWeekFocus': serializer.toJson<String>(nextWeekFocus),
      'isAiGenerated': serializer.toJson<bool>(isAiGenerated),
    };
  }

  WeeklyReport copyWith({
    String? id,
    DateTime? weekStartDate,
    DateTime? generatedAt,
    String? summary,
    String? highlightsJson,
    String? concernsJson,
    String? progressAnalysis,
    String? nextWeekFocus,
    bool? isAiGenerated,
  }) => WeeklyReport(
    id: id ?? this.id,
    weekStartDate: weekStartDate ?? this.weekStartDate,
    generatedAt: generatedAt ?? this.generatedAt,
    summary: summary ?? this.summary,
    highlightsJson: highlightsJson ?? this.highlightsJson,
    concernsJson: concernsJson ?? this.concernsJson,
    progressAnalysis: progressAnalysis ?? this.progressAnalysis,
    nextWeekFocus: nextWeekFocus ?? this.nextWeekFocus,
    isAiGenerated: isAiGenerated ?? this.isAiGenerated,
  );
  WeeklyReport copyWithCompanion(WeeklyReportsCompanion data) {
    return WeeklyReport(
      id: data.id.present ? data.id.value : this.id,
      weekStartDate: data.weekStartDate.present
          ? data.weekStartDate.value
          : this.weekStartDate,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
      summary: data.summary.present ? data.summary.value : this.summary,
      highlightsJson: data.highlightsJson.present
          ? data.highlightsJson.value
          : this.highlightsJson,
      concernsJson: data.concernsJson.present
          ? data.concernsJson.value
          : this.concernsJson,
      progressAnalysis: data.progressAnalysis.present
          ? data.progressAnalysis.value
          : this.progressAnalysis,
      nextWeekFocus: data.nextWeekFocus.present
          ? data.nextWeekFocus.value
          : this.nextWeekFocus,
      isAiGenerated: data.isAiGenerated.present
          ? data.isAiGenerated.value
          : this.isAiGenerated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyReport(')
          ..write('id: $id, ')
          ..write('weekStartDate: $weekStartDate, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('summary: $summary, ')
          ..write('highlightsJson: $highlightsJson, ')
          ..write('concernsJson: $concernsJson, ')
          ..write('progressAnalysis: $progressAnalysis, ')
          ..write('nextWeekFocus: $nextWeekFocus, ')
          ..write('isAiGenerated: $isAiGenerated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weekStartDate,
    generatedAt,
    summary,
    highlightsJson,
    concernsJson,
    progressAnalysis,
    nextWeekFocus,
    isAiGenerated,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklyReport &&
          other.id == this.id &&
          other.weekStartDate == this.weekStartDate &&
          other.generatedAt == this.generatedAt &&
          other.summary == this.summary &&
          other.highlightsJson == this.highlightsJson &&
          other.concernsJson == this.concernsJson &&
          other.progressAnalysis == this.progressAnalysis &&
          other.nextWeekFocus == this.nextWeekFocus &&
          other.isAiGenerated == this.isAiGenerated);
}

class WeeklyReportsCompanion extends UpdateCompanion<WeeklyReport> {
  final Value<String> id;
  final Value<DateTime> weekStartDate;
  final Value<DateTime> generatedAt;
  final Value<String> summary;
  final Value<String> highlightsJson;
  final Value<String> concernsJson;
  final Value<String> progressAnalysis;
  final Value<String> nextWeekFocus;
  final Value<bool> isAiGenerated;
  final Value<int> rowid;
  const WeeklyReportsCompanion({
    this.id = const Value.absent(),
    this.weekStartDate = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.summary = const Value.absent(),
    this.highlightsJson = const Value.absent(),
    this.concernsJson = const Value.absent(),
    this.progressAnalysis = const Value.absent(),
    this.nextWeekFocus = const Value.absent(),
    this.isAiGenerated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeeklyReportsCompanion.insert({
    required String id,
    required DateTime weekStartDate,
    required DateTime generatedAt,
    required String summary,
    required String highlightsJson,
    required String concernsJson,
    required String progressAnalysis,
    required String nextWeekFocus,
    this.isAiGenerated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weekStartDate = Value(weekStartDate),
       generatedAt = Value(generatedAt),
       summary = Value(summary),
       highlightsJson = Value(highlightsJson),
       concernsJson = Value(concernsJson),
       progressAnalysis = Value(progressAnalysis),
       nextWeekFocus = Value(nextWeekFocus);
  static Insertable<WeeklyReport> custom({
    Expression<String>? id,
    Expression<DateTime>? weekStartDate,
    Expression<DateTime>? generatedAt,
    Expression<String>? summary,
    Expression<String>? highlightsJson,
    Expression<String>? concernsJson,
    Expression<String>? progressAnalysis,
    Expression<String>? nextWeekFocus,
    Expression<bool>? isAiGenerated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weekStartDate != null) 'week_start_date': weekStartDate,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (summary != null) 'summary': summary,
      if (highlightsJson != null) 'highlights_json': highlightsJson,
      if (concernsJson != null) 'concerns_json': concernsJson,
      if (progressAnalysis != null) 'progress_analysis': progressAnalysis,
      if (nextWeekFocus != null) 'next_week_focus': nextWeekFocus,
      if (isAiGenerated != null) 'is_ai_generated': isAiGenerated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeeklyReportsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? weekStartDate,
    Value<DateTime>? generatedAt,
    Value<String>? summary,
    Value<String>? highlightsJson,
    Value<String>? concernsJson,
    Value<String>? progressAnalysis,
    Value<String>? nextWeekFocus,
    Value<bool>? isAiGenerated,
    Value<int>? rowid,
  }) {
    return WeeklyReportsCompanion(
      id: id ?? this.id,
      weekStartDate: weekStartDate ?? this.weekStartDate,
      generatedAt: generatedAt ?? this.generatedAt,
      summary: summary ?? this.summary,
      highlightsJson: highlightsJson ?? this.highlightsJson,
      concernsJson: concernsJson ?? this.concernsJson,
      progressAnalysis: progressAnalysis ?? this.progressAnalysis,
      nextWeekFocus: nextWeekFocus ?? this.nextWeekFocus,
      isAiGenerated: isAiGenerated ?? this.isAiGenerated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weekStartDate.present) {
      map['week_start_date'] = Variable<DateTime>(weekStartDate.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (highlightsJson.present) {
      map['highlights_json'] = Variable<String>(highlightsJson.value);
    }
    if (concernsJson.present) {
      map['concerns_json'] = Variable<String>(concernsJson.value);
    }
    if (progressAnalysis.present) {
      map['progress_analysis'] = Variable<String>(progressAnalysis.value);
    }
    if (nextWeekFocus.present) {
      map['next_week_focus'] = Variable<String>(nextWeekFocus.value);
    }
    if (isAiGenerated.present) {
      map['is_ai_generated'] = Variable<bool>(isAiGenerated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyReportsCompanion(')
          ..write('id: $id, ')
          ..write('weekStartDate: $weekStartDate, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('summary: $summary, ')
          ..write('highlightsJson: $highlightsJson, ')
          ..write('concernsJson: $concernsJson, ')
          ..write('progressAnalysis: $progressAnalysis, ')
          ..write('nextWeekFocus: $nextWeekFocus, ')
          ..write('isAiGenerated: $isAiGenerated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgressPhotosTable extends ProgressPhotos
    with TableInfo<$ProgressPhotosTable, ProgressPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_profiles (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoUriMeta = const VerificationMeta(
    'photoUri',
  );
  @override
  late final GeneratedColumn<String> photoUri = GeneratedColumn<String>(
    'photo_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyPartMeta = const VerificationMeta(
    'bodyPart',
  );
  @override
  late final GeneratedColumn<String> bodyPart = GeneratedColumn<String>(
    'body_part',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    date,
    photoUri,
    bodyPart,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progress_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgressPhoto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('photo_uri')) {
      context.handle(
        _photoUriMeta,
        photoUri.isAcceptableOrUnknown(data['photo_uri']!, _photoUriMeta),
      );
    } else if (isInserting) {
      context.missing(_photoUriMeta);
    }
    if (data.containsKey('body_part')) {
      context.handle(
        _bodyPartMeta,
        bodyPart.isAcceptableOrUnknown(data['body_part']!, _bodyPartMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyPartMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgressPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgressPhoto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      photoUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_uri'],
      )!,
      bodyPart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_part'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ProgressPhotosTable createAlias(String alias) {
    return $ProgressPhotosTable(attachedDatabase, alias);
  }
}

class ProgressPhoto extends DataClass implements Insertable<ProgressPhoto> {
  final String id;
  final String userId;
  final DateTime date;
  final String photoUri;
  final String bodyPart;
  final String? notes;
  const ProgressPhoto({
    required this.id,
    required this.userId,
    required this.date,
    required this.photoUri,
    required this.bodyPart,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['date'] = Variable<DateTime>(date);
    map['photo_uri'] = Variable<String>(photoUri);
    map['body_part'] = Variable<String>(bodyPart);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ProgressPhotosCompanion toCompanion(bool nullToAbsent) {
    return ProgressPhotosCompanion(
      id: Value(id),
      userId: Value(userId),
      date: Value(date),
      photoUri: Value(photoUri),
      bodyPart: Value(bodyPart),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory ProgressPhoto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgressPhoto(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      photoUri: serializer.fromJson<String>(json['photoUri']),
      bodyPart: serializer.fromJson<String>(json['bodyPart']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'date': serializer.toJson<DateTime>(date),
      'photoUri': serializer.toJson<String>(photoUri),
      'bodyPart': serializer.toJson<String>(bodyPart),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ProgressPhoto copyWith({
    String? id,
    String? userId,
    DateTime? date,
    String? photoUri,
    String? bodyPart,
    Value<String?> notes = const Value.absent(),
  }) => ProgressPhoto(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    date: date ?? this.date,
    photoUri: photoUri ?? this.photoUri,
    bodyPart: bodyPart ?? this.bodyPart,
    notes: notes.present ? notes.value : this.notes,
  );
  ProgressPhoto copyWithCompanion(ProgressPhotosCompanion data) {
    return ProgressPhoto(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      photoUri: data.photoUri.present ? data.photoUri.value : this.photoUri,
      bodyPart: data.bodyPart.present ? data.bodyPart.value : this.bodyPart,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgressPhoto(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('photoUri: $photoUri, ')
          ..write('bodyPart: $bodyPart, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, date, photoUri, bodyPart, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgressPhoto &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.photoUri == this.photoUri &&
          other.bodyPart == this.bodyPart &&
          other.notes == this.notes);
}

class ProgressPhotosCompanion extends UpdateCompanion<ProgressPhoto> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> date;
  final Value<String> photoUri;
  final Value<String> bodyPart;
  final Value<String?> notes;
  final Value<int> rowid;
  const ProgressPhotosCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.photoUri = const Value.absent(),
    this.bodyPart = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgressPhotosCompanion.insert({
    required String id,
    required String userId,
    required DateTime date,
    required String photoUri,
    required String bodyPart,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       date = Value(date),
       photoUri = Value(photoUri),
       bodyPart = Value(bodyPart);
  static Insertable<ProgressPhoto> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? date,
    Expression<String>? photoUri,
    Expression<String>? bodyPart,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (photoUri != null) 'photo_uri': photoUri,
      if (bodyPart != null) 'body_part': bodyPart,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgressPhotosCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? date,
    Value<String>? photoUri,
    Value<String>? bodyPart,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ProgressPhotosCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      photoUri: photoUri ?? this.photoUri,
      bodyPart: bodyPart ?? this.bodyPart,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (photoUri.present) {
      map['photo_uri'] = Variable<String>(photoUri.value);
    }
    if (bodyPart.present) {
      map['body_part'] = Variable<String>(bodyPart.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressPhotosCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('photoUri: $photoUri, ')
          ..write('bodyPart: $bodyPart, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiFoodAnalysesTable extends AiFoodAnalyses
    with TableInfo<$AiFoodAnalysesTable, AiFoodAnalyse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiFoodAnalysesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealLogIdMeta = const VerificationMeta(
    'mealLogId',
  );
  @override
  late final GeneratedColumn<String> mealLogId = GeneratedColumn<String>(
    'meal_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_logs (id)',
    ),
  );
  static const VerificationMeta _photoUriMeta = const VerificationMeta(
    'photoUri',
  );
  @override
  late final GeneratedColumn<String> photoUri = GeneratedColumn<String>(
    'photo_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawResponseMeta = const VerificationMeta(
    'rawResponse',
  );
  @override
  late final GeneratedColumn<String> rawResponse = GeneratedColumn<String>(
    'raw_response',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parsedItemsJsonMeta = const VerificationMeta(
    'parsedItemsJson',
  );
  @override
  late final GeneratedColumn<String> parsedItemsJson = GeneratedColumn<String>(
    'parsed_items_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _processingTimeMeta = const VerificationMeta(
    'processingTime',
  );
  @override
  late final GeneratedColumn<int> processingTime = GeneratedColumn<int>(
    'processing_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('gemini-2.5'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mealLogId,
    photoUri,
    rawResponse,
    parsedItemsJson,
    confidence,
    processingTime,
    model,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_food_analyses';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiFoodAnalyse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('meal_log_id')) {
      context.handle(
        _mealLogIdMeta,
        mealLogId.isAcceptableOrUnknown(data['meal_log_id']!, _mealLogIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mealLogIdMeta);
    }
    if (data.containsKey('photo_uri')) {
      context.handle(
        _photoUriMeta,
        photoUri.isAcceptableOrUnknown(data['photo_uri']!, _photoUriMeta),
      );
    } else if (isInserting) {
      context.missing(_photoUriMeta);
    }
    if (data.containsKey('raw_response')) {
      context.handle(
        _rawResponseMeta,
        rawResponse.isAcceptableOrUnknown(
          data['raw_response']!,
          _rawResponseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rawResponseMeta);
    }
    if (data.containsKey('parsed_items_json')) {
      context.handle(
        _parsedItemsJsonMeta,
        parsedItemsJson.isAcceptableOrUnknown(
          data['parsed_items_json']!,
          _parsedItemsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parsedItemsJsonMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('processing_time')) {
      context.handle(
        _processingTimeMeta,
        processingTime.isAcceptableOrUnknown(
          data['processing_time']!,
          _processingTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_processingTimeMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiFoodAnalyse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiFoodAnalyse(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mealLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_log_id'],
      )!,
      photoUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_uri'],
      )!,
      rawResponse: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_response'],
      )!,
      parsedItemsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsed_items_json'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      )!,
      processingTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}processing_time'],
      )!,
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AiFoodAnalysesTable createAlias(String alias) {
    return $AiFoodAnalysesTable(attachedDatabase, alias);
  }
}

class AiFoodAnalyse extends DataClass implements Insertable<AiFoodAnalyse> {
  final String id;
  final String mealLogId;
  final String photoUri;
  final String rawResponse;
  final String parsedItemsJson;
  final int confidence;
  final int processingTime;
  final String model;
  final DateTime createdAt;
  const AiFoodAnalyse({
    required this.id,
    required this.mealLogId,
    required this.photoUri,
    required this.rawResponse,
    required this.parsedItemsJson,
    required this.confidence,
    required this.processingTime,
    required this.model,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['meal_log_id'] = Variable<String>(mealLogId);
    map['photo_uri'] = Variable<String>(photoUri);
    map['raw_response'] = Variable<String>(rawResponse);
    map['parsed_items_json'] = Variable<String>(parsedItemsJson);
    map['confidence'] = Variable<int>(confidence);
    map['processing_time'] = Variable<int>(processingTime);
    map['model'] = Variable<String>(model);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AiFoodAnalysesCompanion toCompanion(bool nullToAbsent) {
    return AiFoodAnalysesCompanion(
      id: Value(id),
      mealLogId: Value(mealLogId),
      photoUri: Value(photoUri),
      rawResponse: Value(rawResponse),
      parsedItemsJson: Value(parsedItemsJson),
      confidence: Value(confidence),
      processingTime: Value(processingTime),
      model: Value(model),
      createdAt: Value(createdAt),
    );
  }

  factory AiFoodAnalyse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiFoodAnalyse(
      id: serializer.fromJson<String>(json['id']),
      mealLogId: serializer.fromJson<String>(json['mealLogId']),
      photoUri: serializer.fromJson<String>(json['photoUri']),
      rawResponse: serializer.fromJson<String>(json['rawResponse']),
      parsedItemsJson: serializer.fromJson<String>(json['parsedItemsJson']),
      confidence: serializer.fromJson<int>(json['confidence']),
      processingTime: serializer.fromJson<int>(json['processingTime']),
      model: serializer.fromJson<String>(json['model']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mealLogId': serializer.toJson<String>(mealLogId),
      'photoUri': serializer.toJson<String>(photoUri),
      'rawResponse': serializer.toJson<String>(rawResponse),
      'parsedItemsJson': serializer.toJson<String>(parsedItemsJson),
      'confidence': serializer.toJson<int>(confidence),
      'processingTime': serializer.toJson<int>(processingTime),
      'model': serializer.toJson<String>(model),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AiFoodAnalyse copyWith({
    String? id,
    String? mealLogId,
    String? photoUri,
    String? rawResponse,
    String? parsedItemsJson,
    int? confidence,
    int? processingTime,
    String? model,
    DateTime? createdAt,
  }) => AiFoodAnalyse(
    id: id ?? this.id,
    mealLogId: mealLogId ?? this.mealLogId,
    photoUri: photoUri ?? this.photoUri,
    rawResponse: rawResponse ?? this.rawResponse,
    parsedItemsJson: parsedItemsJson ?? this.parsedItemsJson,
    confidence: confidence ?? this.confidence,
    processingTime: processingTime ?? this.processingTime,
    model: model ?? this.model,
    createdAt: createdAt ?? this.createdAt,
  );
  AiFoodAnalyse copyWithCompanion(AiFoodAnalysesCompanion data) {
    return AiFoodAnalyse(
      id: data.id.present ? data.id.value : this.id,
      mealLogId: data.mealLogId.present ? data.mealLogId.value : this.mealLogId,
      photoUri: data.photoUri.present ? data.photoUri.value : this.photoUri,
      rawResponse: data.rawResponse.present
          ? data.rawResponse.value
          : this.rawResponse,
      parsedItemsJson: data.parsedItemsJson.present
          ? data.parsedItemsJson.value
          : this.parsedItemsJson,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      processingTime: data.processingTime.present
          ? data.processingTime.value
          : this.processingTime,
      model: data.model.present ? data.model.value : this.model,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiFoodAnalyse(')
          ..write('id: $id, ')
          ..write('mealLogId: $mealLogId, ')
          ..write('photoUri: $photoUri, ')
          ..write('rawResponse: $rawResponse, ')
          ..write('parsedItemsJson: $parsedItemsJson, ')
          ..write('confidence: $confidence, ')
          ..write('processingTime: $processingTime, ')
          ..write('model: $model, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mealLogId,
    photoUri,
    rawResponse,
    parsedItemsJson,
    confidence,
    processingTime,
    model,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiFoodAnalyse &&
          other.id == this.id &&
          other.mealLogId == this.mealLogId &&
          other.photoUri == this.photoUri &&
          other.rawResponse == this.rawResponse &&
          other.parsedItemsJson == this.parsedItemsJson &&
          other.confidence == this.confidence &&
          other.processingTime == this.processingTime &&
          other.model == this.model &&
          other.createdAt == this.createdAt);
}

class AiFoodAnalysesCompanion extends UpdateCompanion<AiFoodAnalyse> {
  final Value<String> id;
  final Value<String> mealLogId;
  final Value<String> photoUri;
  final Value<String> rawResponse;
  final Value<String> parsedItemsJson;
  final Value<int> confidence;
  final Value<int> processingTime;
  final Value<String> model;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AiFoodAnalysesCompanion({
    this.id = const Value.absent(),
    this.mealLogId = const Value.absent(),
    this.photoUri = const Value.absent(),
    this.rawResponse = const Value.absent(),
    this.parsedItemsJson = const Value.absent(),
    this.confidence = const Value.absent(),
    this.processingTime = const Value.absent(),
    this.model = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AiFoodAnalysesCompanion.insert({
    required String id,
    required String mealLogId,
    required String photoUri,
    required String rawResponse,
    required String parsedItemsJson,
    required int confidence,
    required int processingTime,
    this.model = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mealLogId = Value(mealLogId),
       photoUri = Value(photoUri),
       rawResponse = Value(rawResponse),
       parsedItemsJson = Value(parsedItemsJson),
       confidence = Value(confidence),
       processingTime = Value(processingTime),
       createdAt = Value(createdAt);
  static Insertable<AiFoodAnalyse> custom({
    Expression<String>? id,
    Expression<String>? mealLogId,
    Expression<String>? photoUri,
    Expression<String>? rawResponse,
    Expression<String>? parsedItemsJson,
    Expression<int>? confidence,
    Expression<int>? processingTime,
    Expression<String>? model,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealLogId != null) 'meal_log_id': mealLogId,
      if (photoUri != null) 'photo_uri': photoUri,
      if (rawResponse != null) 'raw_response': rawResponse,
      if (parsedItemsJson != null) 'parsed_items_json': parsedItemsJson,
      if (confidence != null) 'confidence': confidence,
      if (processingTime != null) 'processing_time': processingTime,
      if (model != null) 'model': model,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AiFoodAnalysesCompanion copyWith({
    Value<String>? id,
    Value<String>? mealLogId,
    Value<String>? photoUri,
    Value<String>? rawResponse,
    Value<String>? parsedItemsJson,
    Value<int>? confidence,
    Value<int>? processingTime,
    Value<String>? model,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AiFoodAnalysesCompanion(
      id: id ?? this.id,
      mealLogId: mealLogId ?? this.mealLogId,
      photoUri: photoUri ?? this.photoUri,
      rawResponse: rawResponse ?? this.rawResponse,
      parsedItemsJson: parsedItemsJson ?? this.parsedItemsJson,
      confidence: confidence ?? this.confidence,
      processingTime: processingTime ?? this.processingTime,
      model: model ?? this.model,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mealLogId.present) {
      map['meal_log_id'] = Variable<String>(mealLogId.value);
    }
    if (photoUri.present) {
      map['photo_uri'] = Variable<String>(photoUri.value);
    }
    if (rawResponse.present) {
      map['raw_response'] = Variable<String>(rawResponse.value);
    }
    if (parsedItemsJson.present) {
      map['parsed_items_json'] = Variable<String>(parsedItemsJson.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (processingTime.present) {
      map['processing_time'] = Variable<int>(processingTime.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiFoodAnalysesCompanion(')
          ..write('id: $id, ')
          ..write('mealLogId: $mealLogId, ')
          ..write('photoUri: $photoUri, ')
          ..write('rawResponse: $rawResponse, ')
          ..write('parsedItemsJson: $parsedItemsJson, ')
          ..write('confidence: $confidence, ')
          ..write('processingTime: $processingTime, ')
          ..write('model: $model, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhotoComparisonsTable extends PhotoComparisons
    with TableInfo<$PhotoComparisonsTable, PhotoComparison> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoComparisonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _beforePhotoIdMeta = const VerificationMeta(
    'beforePhotoId',
  );
  @override
  late final GeneratedColumn<String> beforePhotoId = GeneratedColumn<String>(
    'before_photo_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES progress_photos (id)',
    ),
  );
  static const VerificationMeta _afterPhotoIdMeta = const VerificationMeta(
    'afterPhotoId',
  );
  @override
  late final GeneratedColumn<String> afterPhotoId = GeneratedColumn<String>(
    'after_photo_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES progress_photos (id)',
    ),
  );
  static const VerificationMeta _insightsMeta = const VerificationMeta(
    'insights',
  );
  @override
  late final GeneratedColumn<String> insights = GeneratedColumn<String>(
    'insights',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detectedChangesJsonMeta =
      const VerificationMeta('detectedChangesJson');
  @override
  late final GeneratedColumn<String> detectedChangesJson =
      GeneratedColumn<String>(
        'detected_changes_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isAiGeneratedMeta = const VerificationMeta(
    'isAiGenerated',
  );
  @override
  late final GeneratedColumn<bool> isAiGenerated = GeneratedColumn<bool>(
    'is_ai_generated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_ai_generated" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    beforePhotoId,
    afterPhotoId,
    insights,
    detectedChangesJson,
    generatedAt,
    isAiGenerated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_comparisons';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoComparison> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('before_photo_id')) {
      context.handle(
        _beforePhotoIdMeta,
        beforePhotoId.isAcceptableOrUnknown(
          data['before_photo_id']!,
          _beforePhotoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_beforePhotoIdMeta);
    }
    if (data.containsKey('after_photo_id')) {
      context.handle(
        _afterPhotoIdMeta,
        afterPhotoId.isAcceptableOrUnknown(
          data['after_photo_id']!,
          _afterPhotoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_afterPhotoIdMeta);
    }
    if (data.containsKey('insights')) {
      context.handle(
        _insightsMeta,
        insights.isAcceptableOrUnknown(data['insights']!, _insightsMeta),
      );
    } else if (isInserting) {
      context.missing(_insightsMeta);
    }
    if (data.containsKey('detected_changes_json')) {
      context.handle(
        _detectedChangesJsonMeta,
        detectedChangesJson.isAcceptableOrUnknown(
          data['detected_changes_json']!,
          _detectedChangesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_detectedChangesJsonMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('is_ai_generated')) {
      context.handle(
        _isAiGeneratedMeta,
        isAiGenerated.isAcceptableOrUnknown(
          data['is_ai_generated']!,
          _isAiGeneratedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoComparison map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoComparison(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      beforePhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}before_photo_id'],
      )!,
      afterPhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}after_photo_id'],
      )!,
      insights: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insights'],
      )!,
      detectedChangesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detected_changes_json'],
      )!,
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
      isAiGenerated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_ai_generated'],
      )!,
    );
  }

  @override
  $PhotoComparisonsTable createAlias(String alias) {
    return $PhotoComparisonsTable(attachedDatabase, alias);
  }
}

class PhotoComparison extends DataClass implements Insertable<PhotoComparison> {
  final String id;
  final String beforePhotoId;
  final String afterPhotoId;
  final String insights;
  final String detectedChangesJson;
  final DateTime generatedAt;
  final bool isAiGenerated;
  const PhotoComparison({
    required this.id,
    required this.beforePhotoId,
    required this.afterPhotoId,
    required this.insights,
    required this.detectedChangesJson,
    required this.generatedAt,
    required this.isAiGenerated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['before_photo_id'] = Variable<String>(beforePhotoId);
    map['after_photo_id'] = Variable<String>(afterPhotoId);
    map['insights'] = Variable<String>(insights);
    map['detected_changes_json'] = Variable<String>(detectedChangesJson);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['is_ai_generated'] = Variable<bool>(isAiGenerated);
    return map;
  }

  PhotoComparisonsCompanion toCompanion(bool nullToAbsent) {
    return PhotoComparisonsCompanion(
      id: Value(id),
      beforePhotoId: Value(beforePhotoId),
      afterPhotoId: Value(afterPhotoId),
      insights: Value(insights),
      detectedChangesJson: Value(detectedChangesJson),
      generatedAt: Value(generatedAt),
      isAiGenerated: Value(isAiGenerated),
    );
  }

  factory PhotoComparison.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoComparison(
      id: serializer.fromJson<String>(json['id']),
      beforePhotoId: serializer.fromJson<String>(json['beforePhotoId']),
      afterPhotoId: serializer.fromJson<String>(json['afterPhotoId']),
      insights: serializer.fromJson<String>(json['insights']),
      detectedChangesJson: serializer.fromJson<String>(
        json['detectedChangesJson'],
      ),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      isAiGenerated: serializer.fromJson<bool>(json['isAiGenerated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'beforePhotoId': serializer.toJson<String>(beforePhotoId),
      'afterPhotoId': serializer.toJson<String>(afterPhotoId),
      'insights': serializer.toJson<String>(insights),
      'detectedChangesJson': serializer.toJson<String>(detectedChangesJson),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'isAiGenerated': serializer.toJson<bool>(isAiGenerated),
    };
  }

  PhotoComparison copyWith({
    String? id,
    String? beforePhotoId,
    String? afterPhotoId,
    String? insights,
    String? detectedChangesJson,
    DateTime? generatedAt,
    bool? isAiGenerated,
  }) => PhotoComparison(
    id: id ?? this.id,
    beforePhotoId: beforePhotoId ?? this.beforePhotoId,
    afterPhotoId: afterPhotoId ?? this.afterPhotoId,
    insights: insights ?? this.insights,
    detectedChangesJson: detectedChangesJson ?? this.detectedChangesJson,
    generatedAt: generatedAt ?? this.generatedAt,
    isAiGenerated: isAiGenerated ?? this.isAiGenerated,
  );
  PhotoComparison copyWithCompanion(PhotoComparisonsCompanion data) {
    return PhotoComparison(
      id: data.id.present ? data.id.value : this.id,
      beforePhotoId: data.beforePhotoId.present
          ? data.beforePhotoId.value
          : this.beforePhotoId,
      afterPhotoId: data.afterPhotoId.present
          ? data.afterPhotoId.value
          : this.afterPhotoId,
      insights: data.insights.present ? data.insights.value : this.insights,
      detectedChangesJson: data.detectedChangesJson.present
          ? data.detectedChangesJson.value
          : this.detectedChangesJson,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
      isAiGenerated: data.isAiGenerated.present
          ? data.isAiGenerated.value
          : this.isAiGenerated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoComparison(')
          ..write('id: $id, ')
          ..write('beforePhotoId: $beforePhotoId, ')
          ..write('afterPhotoId: $afterPhotoId, ')
          ..write('insights: $insights, ')
          ..write('detectedChangesJson: $detectedChangesJson, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('isAiGenerated: $isAiGenerated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    beforePhotoId,
    afterPhotoId,
    insights,
    detectedChangesJson,
    generatedAt,
    isAiGenerated,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoComparison &&
          other.id == this.id &&
          other.beforePhotoId == this.beforePhotoId &&
          other.afterPhotoId == this.afterPhotoId &&
          other.insights == this.insights &&
          other.detectedChangesJson == this.detectedChangesJson &&
          other.generatedAt == this.generatedAt &&
          other.isAiGenerated == this.isAiGenerated);
}

class PhotoComparisonsCompanion extends UpdateCompanion<PhotoComparison> {
  final Value<String> id;
  final Value<String> beforePhotoId;
  final Value<String> afterPhotoId;
  final Value<String> insights;
  final Value<String> detectedChangesJson;
  final Value<DateTime> generatedAt;
  final Value<bool> isAiGenerated;
  final Value<int> rowid;
  const PhotoComparisonsCompanion({
    this.id = const Value.absent(),
    this.beforePhotoId = const Value.absent(),
    this.afterPhotoId = const Value.absent(),
    this.insights = const Value.absent(),
    this.detectedChangesJson = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.isAiGenerated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotoComparisonsCompanion.insert({
    required String id,
    required String beforePhotoId,
    required String afterPhotoId,
    required String insights,
    required String detectedChangesJson,
    required DateTime generatedAt,
    this.isAiGenerated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       beforePhotoId = Value(beforePhotoId),
       afterPhotoId = Value(afterPhotoId),
       insights = Value(insights),
       detectedChangesJson = Value(detectedChangesJson),
       generatedAt = Value(generatedAt);
  static Insertable<PhotoComparison> custom({
    Expression<String>? id,
    Expression<String>? beforePhotoId,
    Expression<String>? afterPhotoId,
    Expression<String>? insights,
    Expression<String>? detectedChangesJson,
    Expression<DateTime>? generatedAt,
    Expression<bool>? isAiGenerated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (beforePhotoId != null) 'before_photo_id': beforePhotoId,
      if (afterPhotoId != null) 'after_photo_id': afterPhotoId,
      if (insights != null) 'insights': insights,
      if (detectedChangesJson != null)
        'detected_changes_json': detectedChangesJson,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (isAiGenerated != null) 'is_ai_generated': isAiGenerated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotoComparisonsCompanion copyWith({
    Value<String>? id,
    Value<String>? beforePhotoId,
    Value<String>? afterPhotoId,
    Value<String>? insights,
    Value<String>? detectedChangesJson,
    Value<DateTime>? generatedAt,
    Value<bool>? isAiGenerated,
    Value<int>? rowid,
  }) {
    return PhotoComparisonsCompanion(
      id: id ?? this.id,
      beforePhotoId: beforePhotoId ?? this.beforePhotoId,
      afterPhotoId: afterPhotoId ?? this.afterPhotoId,
      insights: insights ?? this.insights,
      detectedChangesJson: detectedChangesJson ?? this.detectedChangesJson,
      generatedAt: generatedAt ?? this.generatedAt,
      isAiGenerated: isAiGenerated ?? this.isAiGenerated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (beforePhotoId.present) {
      map['before_photo_id'] = Variable<String>(beforePhotoId.value);
    }
    if (afterPhotoId.present) {
      map['after_photo_id'] = Variable<String>(afterPhotoId.value);
    }
    if (insights.present) {
      map['insights'] = Variable<String>(insights.value);
    }
    if (detectedChangesJson.present) {
      map['detected_changes_json'] = Variable<String>(
        detectedChangesJson.value,
      );
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (isAiGenerated.present) {
      map['is_ai_generated'] = Variable<bool>(isAiGenerated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoComparisonsCompanion(')
          ..write('id: $id, ')
          ..write('beforePhotoId: $beforePhotoId, ')
          ..write('afterPhotoId: $afterPhotoId, ')
          ..write('insights: $insights, ')
          ..write('detectedChangesJson: $detectedChangesJson, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('isAiGenerated: $isAiGenerated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealTemplatesTable extends MealTemplates
    with TableInfo<$MealTemplatesTable, MealTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_profiles (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemsJsonMeta = const VerificationMeta(
    'itemsJson',
  );
  @override
  late final GeneratedColumn<String> itemsJson = GeneratedColumn<String>(
    'items_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usageCountMeta = const VerificationMeta(
    'usageCount',
  );
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
    'usage_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUsedAtMeta = const VerificationMeta(
    'lastUsedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
    'last_used_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    itemsJson,
    usageCount,
    createdAt,
    lastUsedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('items_json')) {
      context.handle(
        _itemsJsonMeta,
        itemsJson.isAcceptableOrUnknown(data['items_json']!, _itemsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_itemsJsonMeta);
    }
    if (data.containsKey('usage_count')) {
      context.handle(
        _usageCountMeta,
        usageCount.isAcceptableOrUnknown(data['usage_count']!, _usageCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
        _lastUsedAtMeta,
        lastUsedAt.isAcceptableOrUnknown(
          data['last_used_at']!,
          _lastUsedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      itemsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}items_json'],
      )!,
      usageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usage_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUsedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_used_at'],
      ),
    );
  }

  @override
  $MealTemplatesTable createAlias(String alias) {
    return $MealTemplatesTable(attachedDatabase, alias);
  }
}

class MealTemplate extends DataClass implements Insertable<MealTemplate> {
  final String id;
  final String userId;
  final String name;
  final String itemsJson;
  final int usageCount;
  final DateTime createdAt;
  final DateTime? lastUsedAt;
  const MealTemplate({
    required this.id,
    required this.userId,
    required this.name,
    required this.itemsJson,
    required this.usageCount,
    required this.createdAt,
    this.lastUsedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    map['items_json'] = Variable<String>(itemsJson);
    map['usage_count'] = Variable<int>(usageCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUsedAt != null) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    }
    return map;
  }

  MealTemplatesCompanion toCompanion(bool nullToAbsent) {
    return MealTemplatesCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      itemsJson: Value(itemsJson),
      usageCount: Value(usageCount),
      createdAt: Value(createdAt),
      lastUsedAt: lastUsedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsedAt),
    );
  }

  factory MealTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealTemplate(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      itemsJson: serializer.fromJson<String>(json['itemsJson']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUsedAt: serializer.fromJson<DateTime?>(json['lastUsedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'itemsJson': serializer.toJson<String>(itemsJson),
      'usageCount': serializer.toJson<int>(usageCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUsedAt': serializer.toJson<DateTime?>(lastUsedAt),
    };
  }

  MealTemplate copyWith({
    String? id,
    String? userId,
    String? name,
    String? itemsJson,
    int? usageCount,
    DateTime? createdAt,
    Value<DateTime?> lastUsedAt = const Value.absent(),
  }) => MealTemplate(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    itemsJson: itemsJson ?? this.itemsJson,
    usageCount: usageCount ?? this.usageCount,
    createdAt: createdAt ?? this.createdAt,
    lastUsedAt: lastUsedAt.present ? lastUsedAt.value : this.lastUsedAt,
  );
  MealTemplate copyWithCompanion(MealTemplatesCompanion data) {
    return MealTemplate(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      itemsJson: data.itemsJson.present ? data.itemsJson.value : this.itemsJson,
      usageCount: data.usageCount.present
          ? data.usageCount.value
          : this.usageCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUsedAt: data.lastUsedAt.present
          ? data.lastUsedAt.value
          : this.lastUsedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealTemplate(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('itemsJson: $itemsJson, ')
          ..write('usageCount: $usageCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsedAt: $lastUsedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    itemsJson,
    usageCount,
    createdAt,
    lastUsedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealTemplate &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.itemsJson == this.itemsJson &&
          other.usageCount == this.usageCount &&
          other.createdAt == this.createdAt &&
          other.lastUsedAt == this.lastUsedAt);
}

class MealTemplatesCompanion extends UpdateCompanion<MealTemplate> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String> itemsJson;
  final Value<int> usageCount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUsedAt;
  final Value<int> rowid;
  const MealTemplatesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.itemsJson = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealTemplatesCompanion.insert({
    required String id,
    required String userId,
    required String name,
    required String itemsJson,
    this.usageCount = const Value.absent(),
    required DateTime createdAt,
    this.lastUsedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       name = Value(name),
       itemsJson = Value(itemsJson),
       createdAt = Value(createdAt);
  static Insertable<MealTemplate> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? itemsJson,
    Expression<int>? usageCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUsedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (itemsJson != null) 'items_json': itemsJson,
      if (usageCount != null) 'usage_count': usageCount,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? name,
    Value<String>? itemsJson,
    Value<int>? usageCount,
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUsedAt,
    Value<int>? rowid,
  }) {
    return MealTemplatesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      itemsJson: itemsJson ?? this.itemsJson,
      usageCount: usageCount ?? this.usageCount,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (itemsJson.present) {
      map['items_json'] = Variable<String>(itemsJson.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('itemsJson: $itemsJson, ')
          ..write('usageCount: $usageCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _behaviorsJsonMeta = const VerificationMeta(
    'behaviorsJson',
  );
  @override
  late final GeneratedColumn<String> behaviorsJson = GeneratedColumn<String>(
    'behaviors_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodLevelMeta = const VerificationMeta(
    'moodLevel',
  );
  @override
  late final GeneratedColumn<int> moodLevel = GeneratedColumn<int>(
    'mood_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stressLevelMeta = const VerificationMeta(
    'stressLevel',
  );
  @override
  late final GeneratedColumn<int> stressLevel = GeneratedColumn<int>(
    'stress_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isReviewedMeta = const VerificationMeta(
    'isReviewed',
  );
  @override
  late final GeneratedColumn<bool> isReviewed = GeneratedColumn<bool>(
    'is_reviewed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_reviewed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _tagsJsonMeta = const VerificationMeta(
    'tagsJson',
  );
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
    'tags_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    createdAt,
    updatedAt,
    behaviorsJson,
    notes,
    moodLevel,
    stressLevel,
    isReviewed,
    tagsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('behaviors_json')) {
      context.handle(
        _behaviorsJsonMeta,
        behaviorsJson.isAcceptableOrUnknown(
          data['behaviors_json']!,
          _behaviorsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_behaviorsJsonMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('mood_level')) {
      context.handle(
        _moodLevelMeta,
        moodLevel.isAcceptableOrUnknown(data['mood_level']!, _moodLevelMeta),
      );
    }
    if (data.containsKey('stress_level')) {
      context.handle(
        _stressLevelMeta,
        stressLevel.isAcceptableOrUnknown(
          data['stress_level']!,
          _stressLevelMeta,
        ),
      );
    }
    if (data.containsKey('is_reviewed')) {
      context.handle(
        _isReviewedMeta,
        isReviewed.isAcceptableOrUnknown(data['is_reviewed']!, _isReviewedMeta),
      );
    }
    if (data.containsKey('tags_json')) {
      context.handle(
        _tagsJsonMeta,
        tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_tagsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      behaviorsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}behaviors_json'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      moodLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood_level'],
      ),
      stressLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stress_level'],
      ),
      isReviewed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_reviewed'],
      )!,
      tagsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags_json'],
      )!,
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class JournalEntry extends DataClass implements Insertable<JournalEntry> {
  final String id;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String behaviorsJson;
  final String? notes;
  final int? moodLevel;
  final int? stressLevel;
  final bool isReviewed;
  final String tagsJson;
  const JournalEntry({
    required this.id,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.behaviorsJson,
    this.notes,
    this.moodLevel,
    this.stressLevel,
    required this.isReviewed,
    required this.tagsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['behaviors_json'] = Variable<String>(behaviorsJson);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || moodLevel != null) {
      map['mood_level'] = Variable<int>(moodLevel);
    }
    if (!nullToAbsent || stressLevel != null) {
      map['stress_level'] = Variable<int>(stressLevel);
    }
    map['is_reviewed'] = Variable<bool>(isReviewed);
    map['tags_json'] = Variable<String>(tagsJson);
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      date: Value(date),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      behaviorsJson: Value(behaviorsJson),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      moodLevel: moodLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(moodLevel),
      stressLevel: stressLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(stressLevel),
      isReviewed: Value(isReviewed),
      tagsJson: Value(tagsJson),
    );
  }

  factory JournalEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntry(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      behaviorsJson: serializer.fromJson<String>(json['behaviorsJson']),
      notes: serializer.fromJson<String?>(json['notes']),
      moodLevel: serializer.fromJson<int?>(json['moodLevel']),
      stressLevel: serializer.fromJson<int?>(json['stressLevel']),
      isReviewed: serializer.fromJson<bool>(json['isReviewed']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'behaviorsJson': serializer.toJson<String>(behaviorsJson),
      'notes': serializer.toJson<String?>(notes),
      'moodLevel': serializer.toJson<int?>(moodLevel),
      'stressLevel': serializer.toJson<int?>(stressLevel),
      'isReviewed': serializer.toJson<bool>(isReviewed),
      'tagsJson': serializer.toJson<String>(tagsJson),
    };
  }

  JournalEntry copyWith({
    String? id,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? behaviorsJson,
    Value<String?> notes = const Value.absent(),
    Value<int?> moodLevel = const Value.absent(),
    Value<int?> stressLevel = const Value.absent(),
    bool? isReviewed,
    String? tagsJson,
  }) => JournalEntry(
    id: id ?? this.id,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    behaviorsJson: behaviorsJson ?? this.behaviorsJson,
    notes: notes.present ? notes.value : this.notes,
    moodLevel: moodLevel.present ? moodLevel.value : this.moodLevel,
    stressLevel: stressLevel.present ? stressLevel.value : this.stressLevel,
    isReviewed: isReviewed ?? this.isReviewed,
    tagsJson: tagsJson ?? this.tagsJson,
  );
  JournalEntry copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntry(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      behaviorsJson: data.behaviorsJson.present
          ? data.behaviorsJson.value
          : this.behaviorsJson,
      notes: data.notes.present ? data.notes.value : this.notes,
      moodLevel: data.moodLevel.present ? data.moodLevel.value : this.moodLevel,
      stressLevel: data.stressLevel.present
          ? data.stressLevel.value
          : this.stressLevel,
      isReviewed: data.isReviewed.present
          ? data.isReviewed.value
          : this.isReviewed,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntry(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('behaviorsJson: $behaviorsJson, ')
          ..write('notes: $notes, ')
          ..write('moodLevel: $moodLevel, ')
          ..write('stressLevel: $stressLevel, ')
          ..write('isReviewed: $isReviewed, ')
          ..write('tagsJson: $tagsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    createdAt,
    updatedAt,
    behaviorsJson,
    notes,
    moodLevel,
    stressLevel,
    isReviewed,
    tagsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntry &&
          other.id == this.id &&
          other.date == this.date &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.behaviorsJson == this.behaviorsJson &&
          other.notes == this.notes &&
          other.moodLevel == this.moodLevel &&
          other.stressLevel == this.stressLevel &&
          other.isReviewed == this.isReviewed &&
          other.tagsJson == this.tagsJson);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntry> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> behaviorsJson;
  final Value<String?> notes;
  final Value<int?> moodLevel;
  final Value<int?> stressLevel;
  final Value<bool> isReviewed;
  final Value<String> tagsJson;
  final Value<int> rowid;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.behaviorsJson = const Value.absent(),
    this.notes = const Value.absent(),
    this.moodLevel = const Value.absent(),
    this.stressLevel = const Value.absent(),
    this.isReviewed = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    required String id,
    required DateTime date,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String behaviorsJson,
    this.notes = const Value.absent(),
    this.moodLevel = const Value.absent(),
    this.stressLevel = const Value.absent(),
    this.isReviewed = const Value.absent(),
    required String tagsJson,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       behaviorsJson = Value(behaviorsJson),
       tagsJson = Value(tagsJson);
  static Insertable<JournalEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? behaviorsJson,
    Expression<String>? notes,
    Expression<int>? moodLevel,
    Expression<int>? stressLevel,
    Expression<bool>? isReviewed,
    Expression<String>? tagsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (behaviorsJson != null) 'behaviors_json': behaviorsJson,
      if (notes != null) 'notes': notes,
      if (moodLevel != null) 'mood_level': moodLevel,
      if (stressLevel != null) 'stress_level': stressLevel,
      if (isReviewed != null) 'is_reviewed': isReviewed,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalEntriesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? behaviorsJson,
    Value<String?>? notes,
    Value<int?>? moodLevel,
    Value<int?>? stressLevel,
    Value<bool>? isReviewed,
    Value<String>? tagsJson,
    Value<int>? rowid,
  }) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      behaviorsJson: behaviorsJson ?? this.behaviorsJson,
      notes: notes ?? this.notes,
      moodLevel: moodLevel ?? this.moodLevel,
      stressLevel: stressLevel ?? this.stressLevel,
      isReviewed: isReviewed ?? this.isReviewed,
      tagsJson: tagsJson ?? this.tagsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (behaviorsJson.present) {
      map['behaviors_json'] = Variable<String>(behaviorsJson.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (moodLevel.present) {
      map['mood_level'] = Variable<int>(moodLevel.value);
    }
    if (stressLevel.present) {
      map['stress_level'] = Variable<int>(stressLevel.value);
    }
    if (isReviewed.present) {
      map['is_reviewed'] = Variable<bool>(isReviewed.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('behaviorsJson: $behaviorsJson, ')
          ..write('notes: $notes, ')
          ..write('moodLevel: $moodLevel, ')
          ..write('stressLevel: $stressLevel, ')
          ..write('isReviewed: $isReviewed, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomBehaviorsTable extends CustomBehaviors
    with TableInfo<$CustomBehaviorsTable, CustomBehavior> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomBehaviorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inputTypeMeta = const VerificationMeta(
    'inputType',
  );
  @override
  late final GeneratedColumn<String> inputType = GeneratedColumn<String>(
    'input_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    inputType,
    icon,
    unit,
    description,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_behaviors';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomBehavior> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('input_type')) {
      context.handle(
        _inputTypeMeta,
        inputType.isAcceptableOrUnknown(data['input_type']!, _inputTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_inputTypeMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomBehavior map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomBehavior(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      inputType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}input_type'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CustomBehaviorsTable createAlias(String alias) {
    return $CustomBehaviorsTable(attachedDatabase, alias);
  }
}

class CustomBehavior extends DataClass implements Insertable<CustomBehavior> {
  final String id;
  final String name;
  final String category;
  final String inputType;
  final String? icon;
  final String? unit;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  const CustomBehavior({
    required this.id,
    required this.name,
    required this.category,
    required this.inputType,
    this.icon,
    this.unit,
    this.description,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['input_type'] = Variable<String>(inputType);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CustomBehaviorsCompanion toCompanion(bool nullToAbsent) {
    return CustomBehaviorsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      inputType: Value(inputType),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory CustomBehavior.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomBehavior(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      inputType: serializer.fromJson<String>(json['inputType']),
      icon: serializer.fromJson<String?>(json['icon']),
      unit: serializer.fromJson<String?>(json['unit']),
      description: serializer.fromJson<String?>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'inputType': serializer.toJson<String>(inputType),
      'icon': serializer.toJson<String?>(icon),
      'unit': serializer.toJson<String?>(unit),
      'description': serializer.toJson<String?>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CustomBehavior copyWith({
    String? id,
    String? name,
    String? category,
    String? inputType,
    Value<String?> icon = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<String?> description = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
  }) => CustomBehavior(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    inputType: inputType ?? this.inputType,
    icon: icon.present ? icon.value : this.icon,
    unit: unit.present ? unit.value : this.unit,
    description: description.present ? description.value : this.description,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  CustomBehavior copyWithCompanion(CustomBehaviorsCompanion data) {
    return CustomBehavior(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      inputType: data.inputType.present ? data.inputType.value : this.inputType,
      icon: data.icon.present ? data.icon.value : this.icon,
      unit: data.unit.present ? data.unit.value : this.unit,
      description: data.description.present
          ? data.description.value
          : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomBehavior(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('inputType: $inputType, ')
          ..write('icon: $icon, ')
          ..write('unit: $unit, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    inputType,
    icon,
    unit,
    description,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomBehavior &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.inputType == this.inputType &&
          other.icon == this.icon &&
          other.unit == this.unit &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class CustomBehaviorsCompanion extends UpdateCompanion<CustomBehavior> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> inputType;
  final Value<String?> icon;
  final Value<String?> unit;
  final Value<String?> description;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CustomBehaviorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.inputType = const Value.absent(),
    this.icon = const Value.absent(),
    this.unit = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomBehaviorsCompanion.insert({
    required String id,
    required String name,
    required String category,
    required String inputType,
    this.icon = const Value.absent(),
    this.unit = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       inputType = Value(inputType),
       createdAt = Value(createdAt);
  static Insertable<CustomBehavior> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? inputType,
    Expression<String>? icon,
    Expression<String>? unit,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (inputType != null) 'input_type': inputType,
      if (icon != null) 'icon': icon,
      if (unit != null) 'unit': unit,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomBehaviorsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String>? inputType,
    Value<String?>? icon,
    Value<String?>? unit,
    Value<String?>? description,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CustomBehaviorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      inputType: inputType ?? this.inputType,
      icon: icon ?? this.icon,
      unit: unit ?? this.unit,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (inputType.present) {
      map['input_type'] = Variable<String>(inputType.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomBehaviorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('inputType: $inputType, ')
          ..write('icon: $icon, ')
          ..write('unit: $unit, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StrainScoresTable extends StrainScores
    with TableInfo<$StrainScoresTable, StrainScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StrainScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _calculatedAtMeta = const VerificationMeta(
    'calculatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> calculatedAt = GeneratedColumn<DateTime>(
    'calculated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxHeartRateMeta = const VerificationMeta(
    'maxHeartRate',
  );
  @override
  late final GeneratedColumn<int> maxHeartRate = GeneratedColumn<int>(
    'max_heart_rate',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zoneDataJsonMeta = const VerificationMeta(
    'zoneDataJson',
  );
  @override
  late final GeneratedColumn<String> zoneDataJson = GeneratedColumn<String>(
    'zone_data_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalActiveMinutesMeta =
      const VerificationMeta('totalActiveMinutes');
  @override
  late final GeneratedColumn<int> totalActiveMinutes = GeneratedColumn<int>(
    'total_active_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _peakHeartRateMeta = const VerificationMeta(
    'peakHeartRate',
  );
  @override
  late final GeneratedColumn<int> peakHeartRate = GeneratedColumn<int>(
    'peak_heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _averageHeartRateMeta = const VerificationMeta(
    'averageHeartRate',
  );
  @override
  late final GeneratedColumn<int> averageHeartRate = GeneratedColumn<int>(
    'average_heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workoutCountMeta = const VerificationMeta(
    'workoutCount',
  );
  @override
  late final GeneratedColumn<int> workoutCount = GeneratedColumn<int>(
    'workout_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _caloriesBurnedMeta = const VerificationMeta(
    'caloriesBurned',
  );
  @override
  late final GeneratedColumn<int> caloriesBurned = GeneratedColumn<int>(
    'calories_burned',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataSourceMeta = const VerificationMeta(
    'dataSource',
  );
  @override
  late final GeneratedColumn<String> dataSource = GeneratedColumn<String>(
    'data_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    calculatedAt,
    score,
    maxHeartRate,
    zoneDataJson,
    totalActiveMinutes,
    peakHeartRate,
    averageHeartRate,
    workoutCount,
    caloriesBurned,
    dataSource,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'strain_scores';
  @override
  VerificationContext validateIntegrity(
    Insertable<StrainScore> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('calculated_at')) {
      context.handle(
        _calculatedAtMeta,
        calculatedAt.isAcceptableOrUnknown(
          data['calculated_at']!,
          _calculatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_calculatedAtMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('max_heart_rate')) {
      context.handle(
        _maxHeartRateMeta,
        maxHeartRate.isAcceptableOrUnknown(
          data['max_heart_rate']!,
          _maxHeartRateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maxHeartRateMeta);
    }
    if (data.containsKey('zone_data_json')) {
      context.handle(
        _zoneDataJsonMeta,
        zoneDataJson.isAcceptableOrUnknown(
          data['zone_data_json']!,
          _zoneDataJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_zoneDataJsonMeta);
    }
    if (data.containsKey('total_active_minutes')) {
      context.handle(
        _totalActiveMinutesMeta,
        totalActiveMinutes.isAcceptableOrUnknown(
          data['total_active_minutes']!,
          _totalActiveMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalActiveMinutesMeta);
    }
    if (data.containsKey('peak_heart_rate')) {
      context.handle(
        _peakHeartRateMeta,
        peakHeartRate.isAcceptableOrUnknown(
          data['peak_heart_rate']!,
          _peakHeartRateMeta,
        ),
      );
    }
    if (data.containsKey('average_heart_rate')) {
      context.handle(
        _averageHeartRateMeta,
        averageHeartRate.isAcceptableOrUnknown(
          data['average_heart_rate']!,
          _averageHeartRateMeta,
        ),
      );
    }
    if (data.containsKey('workout_count')) {
      context.handle(
        _workoutCountMeta,
        workoutCount.isAcceptableOrUnknown(
          data['workout_count']!,
          _workoutCountMeta,
        ),
      );
    }
    if (data.containsKey('calories_burned')) {
      context.handle(
        _caloriesBurnedMeta,
        caloriesBurned.isAcceptableOrUnknown(
          data['calories_burned']!,
          _caloriesBurnedMeta,
        ),
      );
    }
    if (data.containsKey('data_source')) {
      context.handle(
        _dataSourceMeta,
        dataSource.isAcceptableOrUnknown(data['data_source']!, _dataSourceMeta),
      );
    } else if (isInserting) {
      context.missing(_dataSourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StrainScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StrainScore(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      calculatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}calculated_at'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      )!,
      maxHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_heart_rate'],
      )!,
      zoneDataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zone_data_json'],
      )!,
      totalActiveMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_active_minutes'],
      )!,
      peakHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}peak_heart_rate'],
      ),
      averageHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}average_heart_rate'],
      ),
      workoutCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workout_count'],
      )!,
      caloriesBurned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories_burned'],
      ),
      dataSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_source'],
      )!,
    );
  }

  @override
  $StrainScoresTable createAlias(String alias) {
    return $StrainScoresTable(attachedDatabase, alias);
  }
}

class StrainScore extends DataClass implements Insertable<StrainScore> {
  final String id;
  final DateTime date;
  final DateTime calculatedAt;
  final double score;
  final int maxHeartRate;
  final String zoneDataJson;
  final int totalActiveMinutes;
  final int? peakHeartRate;
  final int? averageHeartRate;
  final int workoutCount;
  final int? caloriesBurned;
  final String dataSource;
  const StrainScore({
    required this.id,
    required this.date,
    required this.calculatedAt,
    required this.score,
    required this.maxHeartRate,
    required this.zoneDataJson,
    required this.totalActiveMinutes,
    this.peakHeartRate,
    this.averageHeartRate,
    required this.workoutCount,
    this.caloriesBurned,
    required this.dataSource,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['calculated_at'] = Variable<DateTime>(calculatedAt);
    map['score'] = Variable<double>(score);
    map['max_heart_rate'] = Variable<int>(maxHeartRate);
    map['zone_data_json'] = Variable<String>(zoneDataJson);
    map['total_active_minutes'] = Variable<int>(totalActiveMinutes);
    if (!nullToAbsent || peakHeartRate != null) {
      map['peak_heart_rate'] = Variable<int>(peakHeartRate);
    }
    if (!nullToAbsent || averageHeartRate != null) {
      map['average_heart_rate'] = Variable<int>(averageHeartRate);
    }
    map['workout_count'] = Variable<int>(workoutCount);
    if (!nullToAbsent || caloriesBurned != null) {
      map['calories_burned'] = Variable<int>(caloriesBurned);
    }
    map['data_source'] = Variable<String>(dataSource);
    return map;
  }

  StrainScoresCompanion toCompanion(bool nullToAbsent) {
    return StrainScoresCompanion(
      id: Value(id),
      date: Value(date),
      calculatedAt: Value(calculatedAt),
      score: Value(score),
      maxHeartRate: Value(maxHeartRate),
      zoneDataJson: Value(zoneDataJson),
      totalActiveMinutes: Value(totalActiveMinutes),
      peakHeartRate: peakHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(peakHeartRate),
      averageHeartRate: averageHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(averageHeartRate),
      workoutCount: Value(workoutCount),
      caloriesBurned: caloriesBurned == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesBurned),
      dataSource: Value(dataSource),
    );
  }

  factory StrainScore.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StrainScore(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      calculatedAt: serializer.fromJson<DateTime>(json['calculatedAt']),
      score: serializer.fromJson<double>(json['score']),
      maxHeartRate: serializer.fromJson<int>(json['maxHeartRate']),
      zoneDataJson: serializer.fromJson<String>(json['zoneDataJson']),
      totalActiveMinutes: serializer.fromJson<int>(json['totalActiveMinutes']),
      peakHeartRate: serializer.fromJson<int?>(json['peakHeartRate']),
      averageHeartRate: serializer.fromJson<int?>(json['averageHeartRate']),
      workoutCount: serializer.fromJson<int>(json['workoutCount']),
      caloriesBurned: serializer.fromJson<int?>(json['caloriesBurned']),
      dataSource: serializer.fromJson<String>(json['dataSource']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'calculatedAt': serializer.toJson<DateTime>(calculatedAt),
      'score': serializer.toJson<double>(score),
      'maxHeartRate': serializer.toJson<int>(maxHeartRate),
      'zoneDataJson': serializer.toJson<String>(zoneDataJson),
      'totalActiveMinutes': serializer.toJson<int>(totalActiveMinutes),
      'peakHeartRate': serializer.toJson<int?>(peakHeartRate),
      'averageHeartRate': serializer.toJson<int?>(averageHeartRate),
      'workoutCount': serializer.toJson<int>(workoutCount),
      'caloriesBurned': serializer.toJson<int?>(caloriesBurned),
      'dataSource': serializer.toJson<String>(dataSource),
    };
  }

  StrainScore copyWith({
    String? id,
    DateTime? date,
    DateTime? calculatedAt,
    double? score,
    int? maxHeartRate,
    String? zoneDataJson,
    int? totalActiveMinutes,
    Value<int?> peakHeartRate = const Value.absent(),
    Value<int?> averageHeartRate = const Value.absent(),
    int? workoutCount,
    Value<int?> caloriesBurned = const Value.absent(),
    String? dataSource,
  }) => StrainScore(
    id: id ?? this.id,
    date: date ?? this.date,
    calculatedAt: calculatedAt ?? this.calculatedAt,
    score: score ?? this.score,
    maxHeartRate: maxHeartRate ?? this.maxHeartRate,
    zoneDataJson: zoneDataJson ?? this.zoneDataJson,
    totalActiveMinutes: totalActiveMinutes ?? this.totalActiveMinutes,
    peakHeartRate: peakHeartRate.present
        ? peakHeartRate.value
        : this.peakHeartRate,
    averageHeartRate: averageHeartRate.present
        ? averageHeartRate.value
        : this.averageHeartRate,
    workoutCount: workoutCount ?? this.workoutCount,
    caloriesBurned: caloriesBurned.present
        ? caloriesBurned.value
        : this.caloriesBurned,
    dataSource: dataSource ?? this.dataSource,
  );
  StrainScore copyWithCompanion(StrainScoresCompanion data) {
    return StrainScore(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      calculatedAt: data.calculatedAt.present
          ? data.calculatedAt.value
          : this.calculatedAt,
      score: data.score.present ? data.score.value : this.score,
      maxHeartRate: data.maxHeartRate.present
          ? data.maxHeartRate.value
          : this.maxHeartRate,
      zoneDataJson: data.zoneDataJson.present
          ? data.zoneDataJson.value
          : this.zoneDataJson,
      totalActiveMinutes: data.totalActiveMinutes.present
          ? data.totalActiveMinutes.value
          : this.totalActiveMinutes,
      peakHeartRate: data.peakHeartRate.present
          ? data.peakHeartRate.value
          : this.peakHeartRate,
      averageHeartRate: data.averageHeartRate.present
          ? data.averageHeartRate.value
          : this.averageHeartRate,
      workoutCount: data.workoutCount.present
          ? data.workoutCount.value
          : this.workoutCount,
      caloriesBurned: data.caloriesBurned.present
          ? data.caloriesBurned.value
          : this.caloriesBurned,
      dataSource: data.dataSource.present
          ? data.dataSource.value
          : this.dataSource,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StrainScore(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('calculatedAt: $calculatedAt, ')
          ..write('score: $score, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('zoneDataJson: $zoneDataJson, ')
          ..write('totalActiveMinutes: $totalActiveMinutes, ')
          ..write('peakHeartRate: $peakHeartRate, ')
          ..write('averageHeartRate: $averageHeartRate, ')
          ..write('workoutCount: $workoutCount, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('dataSource: $dataSource')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    calculatedAt,
    score,
    maxHeartRate,
    zoneDataJson,
    totalActiveMinutes,
    peakHeartRate,
    averageHeartRate,
    workoutCount,
    caloriesBurned,
    dataSource,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StrainScore &&
          other.id == this.id &&
          other.date == this.date &&
          other.calculatedAt == this.calculatedAt &&
          other.score == this.score &&
          other.maxHeartRate == this.maxHeartRate &&
          other.zoneDataJson == this.zoneDataJson &&
          other.totalActiveMinutes == this.totalActiveMinutes &&
          other.peakHeartRate == this.peakHeartRate &&
          other.averageHeartRate == this.averageHeartRate &&
          other.workoutCount == this.workoutCount &&
          other.caloriesBurned == this.caloriesBurned &&
          other.dataSource == this.dataSource);
}

class StrainScoresCompanion extends UpdateCompanion<StrainScore> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime> calculatedAt;
  final Value<double> score;
  final Value<int> maxHeartRate;
  final Value<String> zoneDataJson;
  final Value<int> totalActiveMinutes;
  final Value<int?> peakHeartRate;
  final Value<int?> averageHeartRate;
  final Value<int> workoutCount;
  final Value<int?> caloriesBurned;
  final Value<String> dataSource;
  final Value<int> rowid;
  const StrainScoresCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.calculatedAt = const Value.absent(),
    this.score = const Value.absent(),
    this.maxHeartRate = const Value.absent(),
    this.zoneDataJson = const Value.absent(),
    this.totalActiveMinutes = const Value.absent(),
    this.peakHeartRate = const Value.absent(),
    this.averageHeartRate = const Value.absent(),
    this.workoutCount = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.dataSource = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StrainScoresCompanion.insert({
    required String id,
    required DateTime date,
    required DateTime calculatedAt,
    required double score,
    required int maxHeartRate,
    required String zoneDataJson,
    required int totalActiveMinutes,
    this.peakHeartRate = const Value.absent(),
    this.averageHeartRate = const Value.absent(),
    this.workoutCount = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    required String dataSource,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       calculatedAt = Value(calculatedAt),
       score = Value(score),
       maxHeartRate = Value(maxHeartRate),
       zoneDataJson = Value(zoneDataJson),
       totalActiveMinutes = Value(totalActiveMinutes),
       dataSource = Value(dataSource);
  static Insertable<StrainScore> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? calculatedAt,
    Expression<double>? score,
    Expression<int>? maxHeartRate,
    Expression<String>? zoneDataJson,
    Expression<int>? totalActiveMinutes,
    Expression<int>? peakHeartRate,
    Expression<int>? averageHeartRate,
    Expression<int>? workoutCount,
    Expression<int>? caloriesBurned,
    Expression<String>? dataSource,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (calculatedAt != null) 'calculated_at': calculatedAt,
      if (score != null) 'score': score,
      if (maxHeartRate != null) 'max_heart_rate': maxHeartRate,
      if (zoneDataJson != null) 'zone_data_json': zoneDataJson,
      if (totalActiveMinutes != null)
        'total_active_minutes': totalActiveMinutes,
      if (peakHeartRate != null) 'peak_heart_rate': peakHeartRate,
      if (averageHeartRate != null) 'average_heart_rate': averageHeartRate,
      if (workoutCount != null) 'workout_count': workoutCount,
      if (caloriesBurned != null) 'calories_burned': caloriesBurned,
      if (dataSource != null) 'data_source': dataSource,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StrainScoresCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<DateTime>? calculatedAt,
    Value<double>? score,
    Value<int>? maxHeartRate,
    Value<String>? zoneDataJson,
    Value<int>? totalActiveMinutes,
    Value<int?>? peakHeartRate,
    Value<int?>? averageHeartRate,
    Value<int>? workoutCount,
    Value<int?>? caloriesBurned,
    Value<String>? dataSource,
    Value<int>? rowid,
  }) {
    return StrainScoresCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      calculatedAt: calculatedAt ?? this.calculatedAt,
      score: score ?? this.score,
      maxHeartRate: maxHeartRate ?? this.maxHeartRate,
      zoneDataJson: zoneDataJson ?? this.zoneDataJson,
      totalActiveMinutes: totalActiveMinutes ?? this.totalActiveMinutes,
      peakHeartRate: peakHeartRate ?? this.peakHeartRate,
      averageHeartRate: averageHeartRate ?? this.averageHeartRate,
      workoutCount: workoutCount ?? this.workoutCount,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      dataSource: dataSource ?? this.dataSource,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (calculatedAt.present) {
      map['calculated_at'] = Variable<DateTime>(calculatedAt.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (maxHeartRate.present) {
      map['max_heart_rate'] = Variable<int>(maxHeartRate.value);
    }
    if (zoneDataJson.present) {
      map['zone_data_json'] = Variable<String>(zoneDataJson.value);
    }
    if (totalActiveMinutes.present) {
      map['total_active_minutes'] = Variable<int>(totalActiveMinutes.value);
    }
    if (peakHeartRate.present) {
      map['peak_heart_rate'] = Variable<int>(peakHeartRate.value);
    }
    if (averageHeartRate.present) {
      map['average_heart_rate'] = Variable<int>(averageHeartRate.value);
    }
    if (workoutCount.present) {
      map['workout_count'] = Variable<int>(workoutCount.value);
    }
    if (caloriesBurned.present) {
      map['calories_burned'] = Variable<int>(caloriesBurned.value);
    }
    if (dataSource.present) {
      map['data_source'] = Variable<String>(dataSource.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StrainScoresCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('calculatedAt: $calculatedAt, ')
          ..write('score: $score, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('zoneDataJson: $zoneDataJson, ')
          ..write('totalActiveMinutes: $totalActiveMinutes, ')
          ..write('peakHeartRate: $peakHeartRate, ')
          ..write('averageHeartRate: $averageHeartRate, ')
          ..write('workoutCount: $workoutCount, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('dataSource: $dataSource, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecoveryScoresTable extends RecoveryScores
    with TableInfo<$RecoveryScoresTable, RecoveryScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecoveryScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _calculatedAtMeta = const VerificationMeta(
    'calculatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> calculatedAt = GeneratedColumn<DateTime>(
    'calculated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _componentsJsonMeta = const VerificationMeta(
    'componentsJson',
  );
  @override
  late final GeneratedColumn<String> componentsJson = GeneratedColumn<String>(
    'components_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baselineJsonMeta = const VerificationMeta(
    'baselineJson',
  );
  @override
  late final GeneratedColumn<String> baselineJson = GeneratedColumn<String>(
    'baseline_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviationsJsonMeta = const VerificationMeta(
    'deviationsJson',
  );
  @override
  late final GeneratedColumn<String> deviationsJson = GeneratedColumn<String>(
    'deviations_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sleepPerformanceJsonMeta =
      const VerificationMeta('sleepPerformanceJson');
  @override
  late final GeneratedColumn<String> sleepPerformanceJson =
      GeneratedColumn<String>(
        'sleep_performance_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataSourceMeta = const VerificationMeta(
    'dataSource',
  );
  @override
  late final GeneratedColumn<String> dataSource = GeneratedColumn<String>(
    'data_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    calculatedAt,
    score,
    componentsJson,
    baselineJson,
    deviationsJson,
    sleepPerformanceJson,
    state,
    dataSource,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recovery_scores';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecoveryScore> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('calculated_at')) {
      context.handle(
        _calculatedAtMeta,
        calculatedAt.isAcceptableOrUnknown(
          data['calculated_at']!,
          _calculatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_calculatedAtMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('components_json')) {
      context.handle(
        _componentsJsonMeta,
        componentsJson.isAcceptableOrUnknown(
          data['components_json']!,
          _componentsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_componentsJsonMeta);
    }
    if (data.containsKey('baseline_json')) {
      context.handle(
        _baselineJsonMeta,
        baselineJson.isAcceptableOrUnknown(
          data['baseline_json']!,
          _baselineJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baselineJsonMeta);
    }
    if (data.containsKey('deviations_json')) {
      context.handle(
        _deviationsJsonMeta,
        deviationsJson.isAcceptableOrUnknown(
          data['deviations_json']!,
          _deviationsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deviationsJsonMeta);
    }
    if (data.containsKey('sleep_performance_json')) {
      context.handle(
        _sleepPerformanceJsonMeta,
        sleepPerformanceJson.isAcceptableOrUnknown(
          data['sleep_performance_json']!,
          _sleepPerformanceJsonMeta,
        ),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('data_source')) {
      context.handle(
        _dataSourceMeta,
        dataSource.isAcceptableOrUnknown(data['data_source']!, _dataSourceMeta),
      );
    } else if (isInserting) {
      context.missing(_dataSourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecoveryScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecoveryScore(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      calculatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}calculated_at'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      componentsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}components_json'],
      )!,
      baselineJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}baseline_json'],
      )!,
      deviationsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deviations_json'],
      )!,
      sleepPerformanceJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sleep_performance_json'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      )!,
      dataSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_source'],
      )!,
    );
  }

  @override
  $RecoveryScoresTable createAlias(String alias) {
    return $RecoveryScoresTable(attachedDatabase, alias);
  }
}

class RecoveryScore extends DataClass implements Insertable<RecoveryScore> {
  final String id;
  final DateTime date;
  final DateTime calculatedAt;
  final int score;
  final String componentsJson;
  final String baselineJson;
  final String deviationsJson;
  final String? sleepPerformanceJson;
  final String state;
  final String dataSource;
  const RecoveryScore({
    required this.id,
    required this.date,
    required this.calculatedAt,
    required this.score,
    required this.componentsJson,
    required this.baselineJson,
    required this.deviationsJson,
    this.sleepPerformanceJson,
    required this.state,
    required this.dataSource,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['calculated_at'] = Variable<DateTime>(calculatedAt);
    map['score'] = Variable<int>(score);
    map['components_json'] = Variable<String>(componentsJson);
    map['baseline_json'] = Variable<String>(baselineJson);
    map['deviations_json'] = Variable<String>(deviationsJson);
    if (!nullToAbsent || sleepPerformanceJson != null) {
      map['sleep_performance_json'] = Variable<String>(sleepPerformanceJson);
    }
    map['state'] = Variable<String>(state);
    map['data_source'] = Variable<String>(dataSource);
    return map;
  }

  RecoveryScoresCompanion toCompanion(bool nullToAbsent) {
    return RecoveryScoresCompanion(
      id: Value(id),
      date: Value(date),
      calculatedAt: Value(calculatedAt),
      score: Value(score),
      componentsJson: Value(componentsJson),
      baselineJson: Value(baselineJson),
      deviationsJson: Value(deviationsJson),
      sleepPerformanceJson: sleepPerformanceJson == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepPerformanceJson),
      state: Value(state),
      dataSource: Value(dataSource),
    );
  }

  factory RecoveryScore.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecoveryScore(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      calculatedAt: serializer.fromJson<DateTime>(json['calculatedAt']),
      score: serializer.fromJson<int>(json['score']),
      componentsJson: serializer.fromJson<String>(json['componentsJson']),
      baselineJson: serializer.fromJson<String>(json['baselineJson']),
      deviationsJson: serializer.fromJson<String>(json['deviationsJson']),
      sleepPerformanceJson: serializer.fromJson<String?>(
        json['sleepPerformanceJson'],
      ),
      state: serializer.fromJson<String>(json['state']),
      dataSource: serializer.fromJson<String>(json['dataSource']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'calculatedAt': serializer.toJson<DateTime>(calculatedAt),
      'score': serializer.toJson<int>(score),
      'componentsJson': serializer.toJson<String>(componentsJson),
      'baselineJson': serializer.toJson<String>(baselineJson),
      'deviationsJson': serializer.toJson<String>(deviationsJson),
      'sleepPerformanceJson': serializer.toJson<String?>(sleepPerformanceJson),
      'state': serializer.toJson<String>(state),
      'dataSource': serializer.toJson<String>(dataSource),
    };
  }

  RecoveryScore copyWith({
    String? id,
    DateTime? date,
    DateTime? calculatedAt,
    int? score,
    String? componentsJson,
    String? baselineJson,
    String? deviationsJson,
    Value<String?> sleepPerformanceJson = const Value.absent(),
    String? state,
    String? dataSource,
  }) => RecoveryScore(
    id: id ?? this.id,
    date: date ?? this.date,
    calculatedAt: calculatedAt ?? this.calculatedAt,
    score: score ?? this.score,
    componentsJson: componentsJson ?? this.componentsJson,
    baselineJson: baselineJson ?? this.baselineJson,
    deviationsJson: deviationsJson ?? this.deviationsJson,
    sleepPerformanceJson: sleepPerformanceJson.present
        ? sleepPerformanceJson.value
        : this.sleepPerformanceJson,
    state: state ?? this.state,
    dataSource: dataSource ?? this.dataSource,
  );
  RecoveryScore copyWithCompanion(RecoveryScoresCompanion data) {
    return RecoveryScore(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      calculatedAt: data.calculatedAt.present
          ? data.calculatedAt.value
          : this.calculatedAt,
      score: data.score.present ? data.score.value : this.score,
      componentsJson: data.componentsJson.present
          ? data.componentsJson.value
          : this.componentsJson,
      baselineJson: data.baselineJson.present
          ? data.baselineJson.value
          : this.baselineJson,
      deviationsJson: data.deviationsJson.present
          ? data.deviationsJson.value
          : this.deviationsJson,
      sleepPerformanceJson: data.sleepPerformanceJson.present
          ? data.sleepPerformanceJson.value
          : this.sleepPerformanceJson,
      state: data.state.present ? data.state.value : this.state,
      dataSource: data.dataSource.present
          ? data.dataSource.value
          : this.dataSource,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecoveryScore(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('calculatedAt: $calculatedAt, ')
          ..write('score: $score, ')
          ..write('componentsJson: $componentsJson, ')
          ..write('baselineJson: $baselineJson, ')
          ..write('deviationsJson: $deviationsJson, ')
          ..write('sleepPerformanceJson: $sleepPerformanceJson, ')
          ..write('state: $state, ')
          ..write('dataSource: $dataSource')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    calculatedAt,
    score,
    componentsJson,
    baselineJson,
    deviationsJson,
    sleepPerformanceJson,
    state,
    dataSource,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecoveryScore &&
          other.id == this.id &&
          other.date == this.date &&
          other.calculatedAt == this.calculatedAt &&
          other.score == this.score &&
          other.componentsJson == this.componentsJson &&
          other.baselineJson == this.baselineJson &&
          other.deviationsJson == this.deviationsJson &&
          other.sleepPerformanceJson == this.sleepPerformanceJson &&
          other.state == this.state &&
          other.dataSource == this.dataSource);
}

class RecoveryScoresCompanion extends UpdateCompanion<RecoveryScore> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime> calculatedAt;
  final Value<int> score;
  final Value<String> componentsJson;
  final Value<String> baselineJson;
  final Value<String> deviationsJson;
  final Value<String?> sleepPerformanceJson;
  final Value<String> state;
  final Value<String> dataSource;
  final Value<int> rowid;
  const RecoveryScoresCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.calculatedAt = const Value.absent(),
    this.score = const Value.absent(),
    this.componentsJson = const Value.absent(),
    this.baselineJson = const Value.absent(),
    this.deviationsJson = const Value.absent(),
    this.sleepPerformanceJson = const Value.absent(),
    this.state = const Value.absent(),
    this.dataSource = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecoveryScoresCompanion.insert({
    required String id,
    required DateTime date,
    required DateTime calculatedAt,
    required int score,
    required String componentsJson,
    required String baselineJson,
    required String deviationsJson,
    this.sleepPerformanceJson = const Value.absent(),
    required String state,
    required String dataSource,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       calculatedAt = Value(calculatedAt),
       score = Value(score),
       componentsJson = Value(componentsJson),
       baselineJson = Value(baselineJson),
       deviationsJson = Value(deviationsJson),
       state = Value(state),
       dataSource = Value(dataSource);
  static Insertable<RecoveryScore> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? calculatedAt,
    Expression<int>? score,
    Expression<String>? componentsJson,
    Expression<String>? baselineJson,
    Expression<String>? deviationsJson,
    Expression<String>? sleepPerformanceJson,
    Expression<String>? state,
    Expression<String>? dataSource,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (calculatedAt != null) 'calculated_at': calculatedAt,
      if (score != null) 'score': score,
      if (componentsJson != null) 'components_json': componentsJson,
      if (baselineJson != null) 'baseline_json': baselineJson,
      if (deviationsJson != null) 'deviations_json': deviationsJson,
      if (sleepPerformanceJson != null)
        'sleep_performance_json': sleepPerformanceJson,
      if (state != null) 'state': state,
      if (dataSource != null) 'data_source': dataSource,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecoveryScoresCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<DateTime>? calculatedAt,
    Value<int>? score,
    Value<String>? componentsJson,
    Value<String>? baselineJson,
    Value<String>? deviationsJson,
    Value<String?>? sleepPerformanceJson,
    Value<String>? state,
    Value<String>? dataSource,
    Value<int>? rowid,
  }) {
    return RecoveryScoresCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      calculatedAt: calculatedAt ?? this.calculatedAt,
      score: score ?? this.score,
      componentsJson: componentsJson ?? this.componentsJson,
      baselineJson: baselineJson ?? this.baselineJson,
      deviationsJson: deviationsJson ?? this.deviationsJson,
      sleepPerformanceJson: sleepPerformanceJson ?? this.sleepPerformanceJson,
      state: state ?? this.state,
      dataSource: dataSource ?? this.dataSource,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (calculatedAt.present) {
      map['calculated_at'] = Variable<DateTime>(calculatedAt.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (componentsJson.present) {
      map['components_json'] = Variable<String>(componentsJson.value);
    }
    if (baselineJson.present) {
      map['baseline_json'] = Variable<String>(baselineJson.value);
    }
    if (deviationsJson.present) {
      map['deviations_json'] = Variable<String>(deviationsJson.value);
    }
    if (sleepPerformanceJson.present) {
      map['sleep_performance_json'] = Variable<String>(
        sleepPerformanceJson.value,
      );
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (dataSource.present) {
      map['data_source'] = Variable<String>(dataSource.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecoveryScoresCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('calculatedAt: $calculatedAt, ')
          ..write('score: $score, ')
          ..write('componentsJson: $componentsJson, ')
          ..write('baselineJson: $baselineJson, ')
          ..write('deviationsJson: $deviationsJson, ')
          ..write('sleepPerformanceJson: $sleepPerformanceJson, ')
          ..write('state: $state, ')
          ..write('dataSource: $dataSource, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<String> protocolId = GeneratedColumn<String>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
    'dosage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timesJsonMeta = const VerificationMeta(
    'timesJson',
  );
  @override
  late final GeneratedColumn<String> timesJson = GeneratedColumn<String>(
    'times_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remindersEnabledMeta = const VerificationMeta(
    'remindersEnabled',
  );
  @override
  late final GeneratedColumn<bool> remindersEnabled = GeneratedColumn<bool>(
    'reminders_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminders_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    name,
    dosage,
    frequency,
    timesJson,
    startDate,
    endDate,
    notes,
    remindersEnabled,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(
        _dosageMeta,
        dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta),
      );
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('times_json')) {
      context.handle(
        _timesJsonMeta,
        timesJson.isAcceptableOrUnknown(data['times_json']!, _timesJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_timesJsonMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('reminders_enabled')) {
      context.handle(
        _remindersEnabledMeta,
        remindersEnabled.isAcceptableOrUnknown(
          data['reminders_enabled']!,
          _remindersEnabledMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protocol_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dosage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dosage'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      timesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}times_json'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      remindersEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminders_enabled'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final String protocolId;
  final String name;
  final String dosage;
  final String frequency;
  final String timesJson;
  final DateTime startDate;
  final DateTime? endDate;
  final String? notes;
  final bool remindersEnabled;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Medication({
    required this.id,
    required this.protocolId,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.timesJson,
    required this.startDate,
    this.endDate,
    this.notes,
    required this.remindersEnabled,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['protocol_id'] = Variable<String>(protocolId);
    map['name'] = Variable<String>(name);
    map['dosage'] = Variable<String>(dosage);
    map['frequency'] = Variable<String>(frequency);
    map['times_json'] = Variable<String>(timesJson);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['reminders_enabled'] = Variable<bool>(remindersEnabled);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      name: Value(name),
      dosage: Value(dosage),
      frequency: Value(frequency),
      timesJson: Value(timesJson),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      remindersEnabled: Value(remindersEnabled),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      protocolId: serializer.fromJson<String>(json['protocolId']),
      name: serializer.fromJson<String>(json['name']),
      dosage: serializer.fromJson<String>(json['dosage']),
      frequency: serializer.fromJson<String>(json['frequency']),
      timesJson: serializer.fromJson<String>(json['timesJson']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      remindersEnabled: serializer.fromJson<bool>(json['remindersEnabled']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'protocolId': serializer.toJson<String>(protocolId),
      'name': serializer.toJson<String>(name),
      'dosage': serializer.toJson<String>(dosage),
      'frequency': serializer.toJson<String>(frequency),
      'timesJson': serializer.toJson<String>(timesJson),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'notes': serializer.toJson<String?>(notes),
      'remindersEnabled': serializer.toJson<bool>(remindersEnabled),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Medication copyWith({
    String? id,
    String? protocolId,
    String? name,
    String? dosage,
    String? frequency,
    String? timesJson,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? remindersEnabled,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Medication(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    name: name ?? this.name,
    dosage: dosage ?? this.dosage,
    frequency: frequency ?? this.frequency,
    timesJson: timesJson ?? this.timesJson,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    notes: notes.present ? notes.value : this.notes,
    remindersEnabled: remindersEnabled ?? this.remindersEnabled,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      name: data.name.present ? data.name.value : this.name,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      timesJson: data.timesJson.present ? data.timesJson.value : this.timesJson,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      remindersEnabled: data.remindersEnabled.present
          ? data.remindersEnabled.value
          : this.remindersEnabled,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('timesJson: $timesJson, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    protocolId,
    name,
    dosage,
    frequency,
    timesJson,
    startDate,
    endDate,
    notes,
    remindersEnabled,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.name == this.name &&
          other.dosage == this.dosage &&
          other.frequency == this.frequency &&
          other.timesJson == this.timesJson &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.notes == this.notes &&
          other.remindersEnabled == this.remindersEnabled &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<String> protocolId;
  final Value<String> name;
  final Value<String> dosage;
  final Value<String> frequency;
  final Value<String> timesJson;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<String?> notes;
  final Value<bool> remindersEnabled;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.name = const Value.absent(),
    this.dosage = const Value.absent(),
    this.frequency = const Value.absent(),
    this.timesJson = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationsCompanion.insert({
    required String id,
    required String protocolId,
    required String name,
    required String dosage,
    required String frequency,
    required String timesJson,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       protocolId = Value(protocolId),
       name = Value(name),
       dosage = Value(dosage),
       frequency = Value(frequency),
       timesJson = Value(timesJson),
       startDate = Value(startDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Medication> custom({
    Expression<String>? id,
    Expression<String>? protocolId,
    Expression<String>? name,
    Expression<String>? dosage,
    Expression<String>? frequency,
    Expression<String>? timesJson,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? notes,
    Expression<bool>? remindersEnabled,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (name != null) 'name': name,
      if (dosage != null) 'dosage': dosage,
      if (frequency != null) 'frequency': frequency,
      if (timesJson != null) 'times_json': timesJson,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (notes != null) 'notes': notes,
      if (remindersEnabled != null) 'reminders_enabled': remindersEnabled,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationsCompanion copyWith({
    Value<String>? id,
    Value<String>? protocolId,
    Value<String>? name,
    Value<String>? dosage,
    Value<String>? frequency,
    Value<String>? timesJson,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<String?>? notes,
    Value<bool>? remindersEnabled,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      timesJson: timesJson ?? this.timesJson,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      notes: notes ?? this.notes,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<String>(protocolId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (timesJson.present) {
      map['times_json'] = Variable<String>(timesJson.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (remindersEnabled.present) {
      map['reminders_enabled'] = Variable<bool>(remindersEnabled.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('timesJson: $timesJson, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SupplementsTable extends Supplements
    with TableInfo<$SupplementsTable, Supplement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<String> protocolId = GeneratedColumn<String>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
    'dosage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timesJsonMeta = const VerificationMeta(
    'timesJson',
  );
  @override
  late final GeneratedColumn<String> timesJson = GeneratedColumn<String>(
    'times_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _withMealsMeta = const VerificationMeta(
    'withMeals',
  );
  @override
  late final GeneratedColumn<bool> withMeals = GeneratedColumn<bool>(
    'with_meals',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("with_meals" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remindersEnabledMeta = const VerificationMeta(
    'remindersEnabled',
  );
  @override
  late final GeneratedColumn<bool> remindersEnabled = GeneratedColumn<bool>(
    'reminders_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminders_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    name,
    dosage,
    frequency,
    timesJson,
    withMeals,
    notes,
    remindersEnabled,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Supplement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(
        _dosageMeta,
        dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta),
      );
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('times_json')) {
      context.handle(
        _timesJsonMeta,
        timesJson.isAcceptableOrUnknown(data['times_json']!, _timesJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_timesJsonMeta);
    }
    if (data.containsKey('with_meals')) {
      context.handle(
        _withMealsMeta,
        withMeals.isAcceptableOrUnknown(data['with_meals']!, _withMealsMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('reminders_enabled')) {
      context.handle(
        _remindersEnabledMeta,
        remindersEnabled.isAcceptableOrUnknown(
          data['reminders_enabled']!,
          _remindersEnabledMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Supplement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supplement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protocol_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dosage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dosage'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      timesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}times_json'],
      )!,
      withMeals: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}with_meals'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      remindersEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminders_enabled'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SupplementsTable createAlias(String alias) {
    return $SupplementsTable(attachedDatabase, alias);
  }
}

class Supplement extends DataClass implements Insertable<Supplement> {
  final String id;
  final String protocolId;
  final String name;
  final String dosage;
  final String frequency;
  final String timesJson;
  final bool withMeals;
  final String? notes;
  final bool remindersEnabled;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Supplement({
    required this.id,
    required this.protocolId,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.timesJson,
    required this.withMeals,
    this.notes,
    required this.remindersEnabled,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['protocol_id'] = Variable<String>(protocolId);
    map['name'] = Variable<String>(name);
    map['dosage'] = Variable<String>(dosage);
    map['frequency'] = Variable<String>(frequency);
    map['times_json'] = Variable<String>(timesJson);
    map['with_meals'] = Variable<bool>(withMeals);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['reminders_enabled'] = Variable<bool>(remindersEnabled);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SupplementsCompanion toCompanion(bool nullToAbsent) {
    return SupplementsCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      name: Value(name),
      dosage: Value(dosage),
      frequency: Value(frequency),
      timesJson: Value(timesJson),
      withMeals: Value(withMeals),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      remindersEnabled: Value(remindersEnabled),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Supplement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Supplement(
      id: serializer.fromJson<String>(json['id']),
      protocolId: serializer.fromJson<String>(json['protocolId']),
      name: serializer.fromJson<String>(json['name']),
      dosage: serializer.fromJson<String>(json['dosage']),
      frequency: serializer.fromJson<String>(json['frequency']),
      timesJson: serializer.fromJson<String>(json['timesJson']),
      withMeals: serializer.fromJson<bool>(json['withMeals']),
      notes: serializer.fromJson<String?>(json['notes']),
      remindersEnabled: serializer.fromJson<bool>(json['remindersEnabled']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'protocolId': serializer.toJson<String>(protocolId),
      'name': serializer.toJson<String>(name),
      'dosage': serializer.toJson<String>(dosage),
      'frequency': serializer.toJson<String>(frequency),
      'timesJson': serializer.toJson<String>(timesJson),
      'withMeals': serializer.toJson<bool>(withMeals),
      'notes': serializer.toJson<String?>(notes),
      'remindersEnabled': serializer.toJson<bool>(remindersEnabled),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Supplement copyWith({
    String? id,
    String? protocolId,
    String? name,
    String? dosage,
    String? frequency,
    String? timesJson,
    bool? withMeals,
    Value<String?> notes = const Value.absent(),
    bool? remindersEnabled,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Supplement(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    name: name ?? this.name,
    dosage: dosage ?? this.dosage,
    frequency: frequency ?? this.frequency,
    timesJson: timesJson ?? this.timesJson,
    withMeals: withMeals ?? this.withMeals,
    notes: notes.present ? notes.value : this.notes,
    remindersEnabled: remindersEnabled ?? this.remindersEnabled,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Supplement copyWithCompanion(SupplementsCompanion data) {
    return Supplement(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      name: data.name.present ? data.name.value : this.name,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      timesJson: data.timesJson.present ? data.timesJson.value : this.timesJson,
      withMeals: data.withMeals.present ? data.withMeals.value : this.withMeals,
      notes: data.notes.present ? data.notes.value : this.notes,
      remindersEnabled: data.remindersEnabled.present
          ? data.remindersEnabled.value
          : this.remindersEnabled,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Supplement(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('timesJson: $timesJson, ')
          ..write('withMeals: $withMeals, ')
          ..write('notes: $notes, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    protocolId,
    name,
    dosage,
    frequency,
    timesJson,
    withMeals,
    notes,
    remindersEnabled,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supplement &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.name == this.name &&
          other.dosage == this.dosage &&
          other.frequency == this.frequency &&
          other.timesJson == this.timesJson &&
          other.withMeals == this.withMeals &&
          other.notes == this.notes &&
          other.remindersEnabled == this.remindersEnabled &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SupplementsCompanion extends UpdateCompanion<Supplement> {
  final Value<String> id;
  final Value<String> protocolId;
  final Value<String> name;
  final Value<String> dosage;
  final Value<String> frequency;
  final Value<String> timesJson;
  final Value<bool> withMeals;
  final Value<String?> notes;
  final Value<bool> remindersEnabled;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SupplementsCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.name = const Value.absent(),
    this.dosage = const Value.absent(),
    this.frequency = const Value.absent(),
    this.timesJson = const Value.absent(),
    this.withMeals = const Value.absent(),
    this.notes = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SupplementsCompanion.insert({
    required String id,
    required String protocolId,
    required String name,
    required String dosage,
    required String frequency,
    required String timesJson,
    this.withMeals = const Value.absent(),
    this.notes = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       protocolId = Value(protocolId),
       name = Value(name),
       dosage = Value(dosage),
       frequency = Value(frequency),
       timesJson = Value(timesJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Supplement> custom({
    Expression<String>? id,
    Expression<String>? protocolId,
    Expression<String>? name,
    Expression<String>? dosage,
    Expression<String>? frequency,
    Expression<String>? timesJson,
    Expression<bool>? withMeals,
    Expression<String>? notes,
    Expression<bool>? remindersEnabled,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (name != null) 'name': name,
      if (dosage != null) 'dosage': dosage,
      if (frequency != null) 'frequency': frequency,
      if (timesJson != null) 'times_json': timesJson,
      if (withMeals != null) 'with_meals': withMeals,
      if (notes != null) 'notes': notes,
      if (remindersEnabled != null) 'reminders_enabled': remindersEnabled,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SupplementsCompanion copyWith({
    Value<String>? id,
    Value<String>? protocolId,
    Value<String>? name,
    Value<String>? dosage,
    Value<String>? frequency,
    Value<String>? timesJson,
    Value<bool>? withMeals,
    Value<String?>? notes,
    Value<bool>? remindersEnabled,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SupplementsCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      timesJson: timesJson ?? this.timesJson,
      withMeals: withMeals ?? this.withMeals,
      notes: notes ?? this.notes,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<String>(protocolId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (timesJson.present) {
      map['times_json'] = Variable<String>(timesJson.value);
    }
    if (withMeals.present) {
      map['with_meals'] = Variable<bool>(withMeals.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (remindersEnabled.present) {
      map['reminders_enabled'] = Variable<bool>(remindersEnabled.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplementsCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('timesJson: $timesJson, ')
          ..write('withMeals: $withMeals, ')
          ..write('notes: $notes, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScheduledWorkoutsTable extends ScheduledWorkouts
    with TableInfo<$ScheduledWorkoutsTable, ScheduledWorkout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledWorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<String> protocolId = GeneratedColumn<String>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _preferredTimeHourMeta = const VerificationMeta(
    'preferredTimeHour',
  );
  @override
  late final GeneratedColumn<int> preferredTimeHour = GeneratedColumn<int>(
    'preferred_time_hour',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _preferredTimeMinuteMeta =
      const VerificationMeta('preferredTimeMinute');
  @override
  late final GeneratedColumn<int> preferredTimeMinute = GeneratedColumn<int>(
    'preferred_time_minute',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetStrainMeta = const VerificationMeta(
    'targetStrain',
  );
  @override
  late final GeneratedColumn<double> targetStrain = GeneratedColumn<double>(
    'target_strain',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    name,
    type,
    dayOfWeek,
    preferredTimeHour,
    preferredTimeMinute,
    duration,
    targetStrain,
    notes,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_workouts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduledWorkout> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('preferred_time_hour')) {
      context.handle(
        _preferredTimeHourMeta,
        preferredTimeHour.isAcceptableOrUnknown(
          data['preferred_time_hour']!,
          _preferredTimeHourMeta,
        ),
      );
    }
    if (data.containsKey('preferred_time_minute')) {
      context.handle(
        _preferredTimeMinuteMeta,
        preferredTimeMinute.isAcceptableOrUnknown(
          data['preferred_time_minute']!,
          _preferredTimeMinuteMeta,
        ),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('target_strain')) {
      context.handle(
        _targetStrainMeta,
        targetStrain.isAcceptableOrUnknown(
          data['target_strain']!,
          _targetStrainMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduledWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledWorkout(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protocol_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
      preferredTimeHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preferred_time_hour'],
      ),
      preferredTimeMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preferred_time_minute'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      targetStrain: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_strain'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ScheduledWorkoutsTable createAlias(String alias) {
    return $ScheduledWorkoutsTable(attachedDatabase, alias);
  }
}

class ScheduledWorkout extends DataClass
    implements Insertable<ScheduledWorkout> {
  final String id;
  final String protocolId;
  final String name;
  final String type;
  final int dayOfWeek;
  final int? preferredTimeHour;
  final int? preferredTimeMinute;
  final int? duration;
  final double? targetStrain;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ScheduledWorkout({
    required this.id,
    required this.protocolId,
    required this.name,
    required this.type,
    required this.dayOfWeek,
    this.preferredTimeHour,
    this.preferredTimeMinute,
    this.duration,
    this.targetStrain,
    this.notes,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['protocol_id'] = Variable<String>(protocolId);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    if (!nullToAbsent || preferredTimeHour != null) {
      map['preferred_time_hour'] = Variable<int>(preferredTimeHour);
    }
    if (!nullToAbsent || preferredTimeMinute != null) {
      map['preferred_time_minute'] = Variable<int>(preferredTimeMinute);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || targetStrain != null) {
      map['target_strain'] = Variable<double>(targetStrain);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ScheduledWorkoutsCompanion toCompanion(bool nullToAbsent) {
    return ScheduledWorkoutsCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      name: Value(name),
      type: Value(type),
      dayOfWeek: Value(dayOfWeek),
      preferredTimeHour: preferredTimeHour == null && nullToAbsent
          ? const Value.absent()
          : Value(preferredTimeHour),
      preferredTimeMinute: preferredTimeMinute == null && nullToAbsent
          ? const Value.absent()
          : Value(preferredTimeMinute),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      targetStrain: targetStrain == null && nullToAbsent
          ? const Value.absent()
          : Value(targetStrain),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ScheduledWorkout.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledWorkout(
      id: serializer.fromJson<String>(json['id']),
      protocolId: serializer.fromJson<String>(json['protocolId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      preferredTimeHour: serializer.fromJson<int?>(json['preferredTimeHour']),
      preferredTimeMinute: serializer.fromJson<int?>(
        json['preferredTimeMinute'],
      ),
      duration: serializer.fromJson<int?>(json['duration']),
      targetStrain: serializer.fromJson<double?>(json['targetStrain']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'protocolId': serializer.toJson<String>(protocolId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'preferredTimeHour': serializer.toJson<int?>(preferredTimeHour),
      'preferredTimeMinute': serializer.toJson<int?>(preferredTimeMinute),
      'duration': serializer.toJson<int?>(duration),
      'targetStrain': serializer.toJson<double?>(targetStrain),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ScheduledWorkout copyWith({
    String? id,
    String? protocolId,
    String? name,
    String? type,
    int? dayOfWeek,
    Value<int?> preferredTimeHour = const Value.absent(),
    Value<int?> preferredTimeMinute = const Value.absent(),
    Value<int?> duration = const Value.absent(),
    Value<double?> targetStrain = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ScheduledWorkout(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    name: name ?? this.name,
    type: type ?? this.type,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    preferredTimeHour: preferredTimeHour.present
        ? preferredTimeHour.value
        : this.preferredTimeHour,
    preferredTimeMinute: preferredTimeMinute.present
        ? preferredTimeMinute.value
        : this.preferredTimeMinute,
    duration: duration.present ? duration.value : this.duration,
    targetStrain: targetStrain.present ? targetStrain.value : this.targetStrain,
    notes: notes.present ? notes.value : this.notes,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ScheduledWorkout copyWithCompanion(ScheduledWorkoutsCompanion data) {
    return ScheduledWorkout(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      preferredTimeHour: data.preferredTimeHour.present
          ? data.preferredTimeHour.value
          : this.preferredTimeHour,
      preferredTimeMinute: data.preferredTimeMinute.present
          ? data.preferredTimeMinute.value
          : this.preferredTimeMinute,
      duration: data.duration.present ? data.duration.value : this.duration,
      targetStrain: data.targetStrain.present
          ? data.targetStrain.value
          : this.targetStrain,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledWorkout(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('preferredTimeHour: $preferredTimeHour, ')
          ..write('preferredTimeMinute: $preferredTimeMinute, ')
          ..write('duration: $duration, ')
          ..write('targetStrain: $targetStrain, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    protocolId,
    name,
    type,
    dayOfWeek,
    preferredTimeHour,
    preferredTimeMinute,
    duration,
    targetStrain,
    notes,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledWorkout &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.name == this.name &&
          other.type == this.type &&
          other.dayOfWeek == this.dayOfWeek &&
          other.preferredTimeHour == this.preferredTimeHour &&
          other.preferredTimeMinute == this.preferredTimeMinute &&
          other.duration == this.duration &&
          other.targetStrain == this.targetStrain &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ScheduledWorkoutsCompanion extends UpdateCompanion<ScheduledWorkout> {
  final Value<String> id;
  final Value<String> protocolId;
  final Value<String> name;
  final Value<String> type;
  final Value<int> dayOfWeek;
  final Value<int?> preferredTimeHour;
  final Value<int?> preferredTimeMinute;
  final Value<int?> duration;
  final Value<double?> targetStrain;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ScheduledWorkoutsCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.preferredTimeHour = const Value.absent(),
    this.preferredTimeMinute = const Value.absent(),
    this.duration = const Value.absent(),
    this.targetStrain = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScheduledWorkoutsCompanion.insert({
    required String id,
    required String protocolId,
    required String name,
    required String type,
    required int dayOfWeek,
    this.preferredTimeHour = const Value.absent(),
    this.preferredTimeMinute = const Value.absent(),
    this.duration = const Value.absent(),
    this.targetStrain = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       protocolId = Value(protocolId),
       name = Value(name),
       type = Value(type),
       dayOfWeek = Value(dayOfWeek),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ScheduledWorkout> custom({
    Expression<String>? id,
    Expression<String>? protocolId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? dayOfWeek,
    Expression<int>? preferredTimeHour,
    Expression<int>? preferredTimeMinute,
    Expression<int>? duration,
    Expression<double>? targetStrain,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (preferredTimeHour != null) 'preferred_time_hour': preferredTimeHour,
      if (preferredTimeMinute != null)
        'preferred_time_minute': preferredTimeMinute,
      if (duration != null) 'duration': duration,
      if (targetStrain != null) 'target_strain': targetStrain,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScheduledWorkoutsCompanion copyWith({
    Value<String>? id,
    Value<String>? protocolId,
    Value<String>? name,
    Value<String>? type,
    Value<int>? dayOfWeek,
    Value<int?>? preferredTimeHour,
    Value<int?>? preferredTimeMinute,
    Value<int?>? duration,
    Value<double?>? targetStrain,
    Value<String?>? notes,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ScheduledWorkoutsCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      name: name ?? this.name,
      type: type ?? this.type,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      preferredTimeHour: preferredTimeHour ?? this.preferredTimeHour,
      preferredTimeMinute: preferredTimeMinute ?? this.preferredTimeMinute,
      duration: duration ?? this.duration,
      targetStrain: targetStrain ?? this.targetStrain,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<String>(protocolId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (preferredTimeHour.present) {
      map['preferred_time_hour'] = Variable<int>(preferredTimeHour.value);
    }
    if (preferredTimeMinute.present) {
      map['preferred_time_minute'] = Variable<int>(preferredTimeMinute.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (targetStrain.present) {
      map['target_strain'] = Variable<double>(targetStrain.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledWorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('preferredTimeHour: $preferredTimeHour, ')
          ..write('preferredTimeMinute: $preferredTimeMinute, ')
          ..write('duration: $duration, ')
          ..write('targetStrain: $targetStrain, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $ProtocolsTable protocols = $ProtocolsTable(this);
  late final $ProtocolSnapshotsTable protocolSnapshots =
      $ProtocolSnapshotsTable(this);
  late final $DailyLogsTable dailyLogs = $DailyLogsTable(this);
  late final $MeasurementLogsTable measurementLogs = $MeasurementLogsTable(
    this,
  );
  late final $MealLogsTable mealLogs = $MealLogsTable(this);
  late final $MealItemsTable mealItems = $MealItemsTable(this);
  late final $WorkoutLogsTable workoutLogs = $WorkoutLogsTable(this);
  late final $RecoveryMetricsTableTable recoveryMetricsTable =
      $RecoveryMetricsTableTable(this);
  late final $DailyBriefsTable dailyBriefs = $DailyBriefsTable(this);
  late final $WeeklyReportsTable weeklyReports = $WeeklyReportsTable(this);
  late final $ProgressPhotosTable progressPhotos = $ProgressPhotosTable(this);
  late final $AiFoodAnalysesTable aiFoodAnalyses = $AiFoodAnalysesTable(this);
  late final $PhotoComparisonsTable photoComparisons = $PhotoComparisonsTable(
    this,
  );
  late final $MealTemplatesTable mealTemplates = $MealTemplatesTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $CustomBehaviorsTable customBehaviors = $CustomBehaviorsTable(
    this,
  );
  late final $StrainScoresTable strainScores = $StrainScoresTable(this);
  late final $RecoveryScoresTable recoveryScores = $RecoveryScoresTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $SupplementsTable supplements = $SupplementsTable(this);
  late final $ScheduledWorkoutsTable scheduledWorkouts =
      $ScheduledWorkoutsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    protocols,
    protocolSnapshots,
    dailyLogs,
    measurementLogs,
    mealLogs,
    mealItems,
    workoutLogs,
    recoveryMetricsTable,
    dailyBriefs,
    weeklyReports,
    progressPhotos,
    aiFoodAnalyses,
    photoComparisons,
    mealTemplates,
    journalEntries,
    customBehaviors,
    strainScores,
    recoveryScores,
    medications,
    supplements,
    scheduledWorkouts,
  ];
}

typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<double?> height,
      Value<int?> age,
      Value<String?> gender,
      required String timezone,
      required String goalsJson,
      required String aiPreferencesJson,
      Value<bool> hasCompletedOnboarding,
      Value<bool> hasGrantedHealthKitPermission,
      Value<bool> hasGrantedAiConsent,
      Value<bool> hasGrantedPhotoConsent,
      Value<int> rowid,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<double?> height,
      Value<int?> age,
      Value<String?> gender,
      Value<String> timezone,
      Value<String> goalsJson,
      Value<String> aiPreferencesJson,
      Value<bool> hasCompletedOnboarding,
      Value<bool> hasGrantedHealthKitPermission,
      Value<bool> hasGrantedAiConsent,
      Value<bool> hasGrantedPhotoConsent,
      Value<int> rowid,
    });

final class $$UserProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile> {
  $$UserProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProtocolsTable, List<Protocol>>
  _protocolsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.protocols,
    aliasName: $_aliasNameGenerator(db.userProfiles.id, db.protocols.userId),
  );

  $$ProtocolsTableProcessedTableManager get protocolsRefs {
    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_protocolsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProgressPhotosTable, List<ProgressPhoto>>
  _progressPhotosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.progressPhotos,
    aliasName: $_aliasNameGenerator(
      db.userProfiles.id,
      db.progressPhotos.userId,
    ),
  );

  $$ProgressPhotosTableProcessedTableManager get progressPhotosRefs {
    final manager = $$ProgressPhotosTableTableManager(
      $_db,
      $_db.progressPhotos,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_progressPhotosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealTemplatesTable, List<MealTemplate>>
  _mealTemplatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealTemplates,
    aliasName: $_aliasNameGenerator(
      db.userProfiles.id,
      db.mealTemplates.userId,
    ),
  );

  $$MealTemplatesTableProcessedTableManager get mealTemplatesRefs {
    final manager = $$MealTemplatesTableTableManager(
      $_db,
      $_db.mealTemplates,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealTemplatesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goalsJson => $composableBuilder(
    column: $table.goalsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aiPreferencesJson => $composableBuilder(
    column: $table.aiPreferencesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasCompletedOnboarding => $composableBuilder(
    column: $table.hasCompletedOnboarding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasGrantedHealthKitPermission => $composableBuilder(
    column: $table.hasGrantedHealthKitPermission,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasGrantedAiConsent => $composableBuilder(
    column: $table.hasGrantedAiConsent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasGrantedPhotoConsent => $composableBuilder(
    column: $table.hasGrantedPhotoConsent,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> protocolsRefs(
    Expression<bool> Function($$ProtocolsTableFilterComposer f) f,
  ) {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> progressPhotosRefs(
    Expression<bool> Function($$ProgressPhotosTableFilterComposer f) f,
  ) {
    final $$ProgressPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableFilterComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealTemplatesRefs(
    Expression<bool> Function($$MealTemplatesTableFilterComposer f) f,
  ) {
    final $$MealTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealTemplates,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.mealTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goalsJson => $composableBuilder(
    column: $table.goalsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aiPreferencesJson => $composableBuilder(
    column: $table.aiPreferencesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasCompletedOnboarding => $composableBuilder(
    column: $table.hasCompletedOnboarding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasGrantedHealthKitPermission => $composableBuilder(
    column: $table.hasGrantedHealthKitPermission,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasGrantedAiConsent => $composableBuilder(
    column: $table.hasGrantedAiConsent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasGrantedPhotoConsent => $composableBuilder(
    column: $table.hasGrantedPhotoConsent,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<String> get goalsJson =>
      $composableBuilder(column: $table.goalsJson, builder: (column) => column);

  GeneratedColumn<String> get aiPreferencesJson => $composableBuilder(
    column: $table.aiPreferencesJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasCompletedOnboarding => $composableBuilder(
    column: $table.hasCompletedOnboarding,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasGrantedHealthKitPermission => $composableBuilder(
    column: $table.hasGrantedHealthKitPermission,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasGrantedAiConsent => $composableBuilder(
    column: $table.hasGrantedAiConsent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasGrantedPhotoConsent => $composableBuilder(
    column: $table.hasGrantedPhotoConsent,
    builder: (column) => column,
  );

  Expression<T> protocolsRefs<T extends Object>(
    Expression<T> Function($$ProtocolsTableAnnotationComposer a) f,
  ) {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> progressPhotosRefs<T extends Object>(
    Expression<T> Function($$ProgressPhotosTableAnnotationComposer a) f,
  ) {
    final $$ProgressPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealTemplatesRefs<T extends Object>(
    Expression<T> Function($$MealTemplatesTableAnnotationComposer a) f,
  ) {
    final $$MealTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealTemplates,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.mealTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (UserProfile, $$UserProfilesTableReferences),
          UserProfile,
          PrefetchHooks Function({
            bool protocolsRefs,
            bool progressPhotosRefs,
            bool mealTemplatesRefs,
          })
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<String> goalsJson = const Value.absent(),
                Value<String> aiPreferencesJson = const Value.absent(),
                Value<bool> hasCompletedOnboarding = const Value.absent(),
                Value<bool> hasGrantedHealthKitPermission =
                    const Value.absent(),
                Value<bool> hasGrantedAiConsent = const Value.absent(),
                Value<bool> hasGrantedPhotoConsent = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                height: height,
                age: age,
                gender: gender,
                timezone: timezone,
                goalsJson: goalsJson,
                aiPreferencesJson: aiPreferencesJson,
                hasCompletedOnboarding: hasCompletedOnboarding,
                hasGrantedHealthKitPermission: hasGrantedHealthKitPermission,
                hasGrantedAiConsent: hasGrantedAiConsent,
                hasGrantedPhotoConsent: hasGrantedPhotoConsent,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<double?> height = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                required String timezone,
                required String goalsJson,
                required String aiPreferencesJson,
                Value<bool> hasCompletedOnboarding = const Value.absent(),
                Value<bool> hasGrantedHealthKitPermission =
                    const Value.absent(),
                Value<bool> hasGrantedAiConsent = const Value.absent(),
                Value<bool> hasGrantedPhotoConsent = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                height: height,
                age: age,
                gender: gender,
                timezone: timezone,
                goalsJson: goalsJson,
                aiPreferencesJson: aiPreferencesJson,
                hasCompletedOnboarding: hasCompletedOnboarding,
                hasGrantedHealthKitPermission: hasGrantedHealthKitPermission,
                hasGrantedAiConsent: hasGrantedAiConsent,
                hasGrantedPhotoConsent: hasGrantedPhotoConsent,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                protocolsRefs = false,
                progressPhotosRefs = false,
                mealTemplatesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (protocolsRefs) db.protocols,
                    if (progressPhotosRefs) db.progressPhotos,
                    if (mealTemplatesRefs) db.mealTemplates,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (protocolsRefs)
                        await $_getPrefetchedData<
                          UserProfile,
                          $UserProfilesTable,
                          Protocol
                        >(
                          currentTable: table,
                          referencedTable: $$UserProfilesTableReferences
                              ._protocolsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).protocolsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (progressPhotosRefs)
                        await $_getPrefetchedData<
                          UserProfile,
                          $UserProfilesTable,
                          ProgressPhoto
                        >(
                          currentTable: table,
                          referencedTable: $$UserProfilesTableReferences
                              ._progressPhotosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).progressPhotosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mealTemplatesRefs)
                        await $_getPrefetchedData<
                          UserProfile,
                          $UserProfilesTable,
                          MealTemplate
                        >(
                          currentTable: table,
                          referencedTable: $$UserProfilesTableReferences
                              ._mealTemplatesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).mealTemplatesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (UserProfile, $$UserProfilesTableReferences),
      UserProfile,
      PrefetchHooks Function({
        bool protocolsRefs,
        bool progressPhotosRefs,
        bool mealTemplatesRefs,
      })
    >;
typedef $$ProtocolsTableCreateCompanionBuilder =
    ProtocolsCompanion Function({
      required String id,
      required String userId,
      required DateTime createdAt,
      required DateTime updatedAt,
      required int eatingWindowStartHour,
      required int eatingWindowStartMinute,
      required int eatingWindowEndHour,
      required int eatingWindowEndMinute,
      required String medicationScheduleJson,
      required String weeklyActivityPlanJson,
      required String constraintsJson,
      Value<DateTime?> lockedUntil,
      Value<int> rowid,
    });
typedef $$ProtocolsTableUpdateCompanionBuilder =
    ProtocolsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> eatingWindowStartHour,
      Value<int> eatingWindowStartMinute,
      Value<int> eatingWindowEndHour,
      Value<int> eatingWindowEndMinute,
      Value<String> medicationScheduleJson,
      Value<String> weeklyActivityPlanJson,
      Value<String> constraintsJson,
      Value<DateTime?> lockedUntil,
      Value<int> rowid,
    });

final class $$ProtocolsTableReferences
    extends BaseReferences<_$AppDatabase, $ProtocolsTable, Protocol> {
  $$ProtocolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserProfilesTable _userIdTable(_$AppDatabase db) =>
      db.userProfiles.createAlias(
        $_aliasNameGenerator(db.protocols.userId, db.userProfiles.id),
      );

  $$UserProfilesTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserProfilesTableTableManager(
      $_db,
      $_db.userProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ProtocolSnapshotsTable, List<ProtocolSnapshot>>
  _protocolSnapshotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.protocolSnapshots,
        aliasName: $_aliasNameGenerator(
          db.protocols.id,
          db.protocolSnapshots.protocolId,
        ),
      );

  $$ProtocolSnapshotsTableProcessedTableManager get protocolSnapshotsRefs {
    final manager = $$ProtocolSnapshotsTableTableManager(
      $_db,
      $_db.protocolSnapshots,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _protocolSnapshotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MedicationsTable, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: $_aliasNameGenerator(db.protocols.id, db.medications.protocolId),
  );

  $$MedicationsTableProcessedTableManager get medicationsRefs {
    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SupplementsTable, List<Supplement>>
  _supplementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.supplements,
    aliasName: $_aliasNameGenerator(db.protocols.id, db.supplements.protocolId),
  );

  $$SupplementsTableProcessedTableManager get supplementsRefs {
    final manager = $$SupplementsTableTableManager(
      $_db,
      $_db.supplements,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_supplementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScheduledWorkoutsTable, List<ScheduledWorkout>>
  _scheduledWorkoutsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduledWorkouts,
        aliasName: $_aliasNameGenerator(
          db.protocols.id,
          db.scheduledWorkouts.protocolId,
        ),
      );

  $$ScheduledWorkoutsTableProcessedTableManager get scheduledWorkoutsRefs {
    final manager = $$ScheduledWorkoutsTableTableManager(
      $_db,
      $_db.scheduledWorkouts,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduledWorkoutsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProtocolsTableFilterComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get eatingWindowStartHour => $composableBuilder(
    column: $table.eatingWindowStartHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get eatingWindowStartMinute => $composableBuilder(
    column: $table.eatingWindowStartMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get eatingWindowEndHour => $composableBuilder(
    column: $table.eatingWindowEndHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get eatingWindowEndMinute => $composableBuilder(
    column: $table.eatingWindowEndMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationScheduleJson => $composableBuilder(
    column: $table.medicationScheduleJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weeklyActivityPlanJson => $composableBuilder(
    column: $table.weeklyActivityPlanJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get constraintsJson => $composableBuilder(
    column: $table.constraintsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lockedUntil => $composableBuilder(
    column: $table.lockedUntil,
    builder: (column) => ColumnFilters(column),
  );

  $$UserProfilesTableFilterComposer get userId {
    final $$UserProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableFilterComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> protocolSnapshotsRefs(
    Expression<bool> Function($$ProtocolSnapshotsTableFilterComposer f) f,
  ) {
    final $$ProtocolSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.protocolSnapshots,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.protocolSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicationsRefs(
    Expression<bool> Function($$MedicationsTableFilterComposer f) f,
  ) {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> supplementsRefs(
    Expression<bool> Function($$SupplementsTableFilterComposer f) f,
  ) {
    final $$SupplementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.supplements,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableFilterComposer(
            $db: $db,
            $table: $db.supplements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scheduledWorkoutsRefs(
    Expression<bool> Function($$ScheduledWorkoutsTableFilterComposer f) f,
  ) {
    final $$ScheduledWorkoutsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduledWorkouts,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledWorkoutsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledWorkouts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProtocolsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get eatingWindowStartHour => $composableBuilder(
    column: $table.eatingWindowStartHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get eatingWindowStartMinute => $composableBuilder(
    column: $table.eatingWindowStartMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get eatingWindowEndHour => $composableBuilder(
    column: $table.eatingWindowEndHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get eatingWindowEndMinute => $composableBuilder(
    column: $table.eatingWindowEndMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationScheduleJson => $composableBuilder(
    column: $table.medicationScheduleJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weeklyActivityPlanJson => $composableBuilder(
    column: $table.weeklyActivityPlanJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get constraintsJson => $composableBuilder(
    column: $table.constraintsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lockedUntil => $composableBuilder(
    column: $table.lockedUntil,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserProfilesTableOrderingComposer get userId {
    final $$UserProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProtocolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get eatingWindowStartHour => $composableBuilder(
    column: $table.eatingWindowStartHour,
    builder: (column) => column,
  );

  GeneratedColumn<int> get eatingWindowStartMinute => $composableBuilder(
    column: $table.eatingWindowStartMinute,
    builder: (column) => column,
  );

  GeneratedColumn<int> get eatingWindowEndHour => $composableBuilder(
    column: $table.eatingWindowEndHour,
    builder: (column) => column,
  );

  GeneratedColumn<int> get eatingWindowEndMinute => $composableBuilder(
    column: $table.eatingWindowEndMinute,
    builder: (column) => column,
  );

  GeneratedColumn<String> get medicationScheduleJson => $composableBuilder(
    column: $table.medicationScheduleJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weeklyActivityPlanJson => $composableBuilder(
    column: $table.weeklyActivityPlanJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get constraintsJson => $composableBuilder(
    column: $table.constraintsJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lockedUntil => $composableBuilder(
    column: $table.lockedUntil,
    builder: (column) => column,
  );

  $$UserProfilesTableAnnotationComposer get userId {
    final $$UserProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> protocolSnapshotsRefs<T extends Object>(
    Expression<T> Function($$ProtocolSnapshotsTableAnnotationComposer a) f,
  ) {
    final $$ProtocolSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.protocolSnapshots,
          getReferencedColumn: (t) => t.protocolId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProtocolSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.protocolSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($$MedicationsTableAnnotationComposer a) f,
  ) {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> supplementsRefs<T extends Object>(
    Expression<T> Function($$SupplementsTableAnnotationComposer a) f,
  ) {
    final $$SupplementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.supplements,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplementsTableAnnotationComposer(
            $db: $db,
            $table: $db.supplements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scheduledWorkoutsRefs<T extends Object>(
    Expression<T> Function($$ScheduledWorkoutsTableAnnotationComposer a) f,
  ) {
    final $$ScheduledWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduledWorkouts,
          getReferencedColumn: (t) => t.protocolId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledWorkoutsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledWorkouts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProtocolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProtocolsTable,
          Protocol,
          $$ProtocolsTableFilterComposer,
          $$ProtocolsTableOrderingComposer,
          $$ProtocolsTableAnnotationComposer,
          $$ProtocolsTableCreateCompanionBuilder,
          $$ProtocolsTableUpdateCompanionBuilder,
          (Protocol, $$ProtocolsTableReferences),
          Protocol,
          PrefetchHooks Function({
            bool userId,
            bool protocolSnapshotsRefs,
            bool medicationsRefs,
            bool supplementsRefs,
            bool scheduledWorkoutsRefs,
          })
        > {
  $$ProtocolsTableTableManager(_$AppDatabase db, $ProtocolsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProtocolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProtocolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProtocolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> eatingWindowStartHour = const Value.absent(),
                Value<int> eatingWindowStartMinute = const Value.absent(),
                Value<int> eatingWindowEndHour = const Value.absent(),
                Value<int> eatingWindowEndMinute = const Value.absent(),
                Value<String> medicationScheduleJson = const Value.absent(),
                Value<String> weeklyActivityPlanJson = const Value.absent(),
                Value<String> constraintsJson = const Value.absent(),
                Value<DateTime?> lockedUntil = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProtocolsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                eatingWindowStartHour: eatingWindowStartHour,
                eatingWindowStartMinute: eatingWindowStartMinute,
                eatingWindowEndHour: eatingWindowEndHour,
                eatingWindowEndMinute: eatingWindowEndMinute,
                medicationScheduleJson: medicationScheduleJson,
                weeklyActivityPlanJson: weeklyActivityPlanJson,
                constraintsJson: constraintsJson,
                lockedUntil: lockedUntil,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime createdAt,
                required DateTime updatedAt,
                required int eatingWindowStartHour,
                required int eatingWindowStartMinute,
                required int eatingWindowEndHour,
                required int eatingWindowEndMinute,
                required String medicationScheduleJson,
                required String weeklyActivityPlanJson,
                required String constraintsJson,
                Value<DateTime?> lockedUntil = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProtocolsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                eatingWindowStartHour: eatingWindowStartHour,
                eatingWindowStartMinute: eatingWindowStartMinute,
                eatingWindowEndHour: eatingWindowEndHour,
                eatingWindowEndMinute: eatingWindowEndMinute,
                medicationScheduleJson: medicationScheduleJson,
                weeklyActivityPlanJson: weeklyActivityPlanJson,
                constraintsJson: constraintsJson,
                lockedUntil: lockedUntil,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProtocolsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                protocolSnapshotsRefs = false,
                medicationsRefs = false,
                supplementsRefs = false,
                scheduledWorkoutsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (protocolSnapshotsRefs) db.protocolSnapshots,
                    if (medicationsRefs) db.medications,
                    if (supplementsRefs) db.supplements,
                    if (scheduledWorkoutsRefs) db.scheduledWorkouts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable: $$ProtocolsTableReferences
                                        ._userIdTable(db),
                                    referencedColumn: $$ProtocolsTableReferences
                                        ._userIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (protocolSnapshotsRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          ProtocolSnapshot
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._protocolSnapshotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).protocolSnapshotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicationsRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          Medication
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._medicationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).medicationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (supplementsRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          Supplement
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._supplementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).supplementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduledWorkoutsRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          ScheduledWorkout
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._scheduledWorkoutsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduledWorkoutsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProtocolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProtocolsTable,
      Protocol,
      $$ProtocolsTableFilterComposer,
      $$ProtocolsTableOrderingComposer,
      $$ProtocolsTableAnnotationComposer,
      $$ProtocolsTableCreateCompanionBuilder,
      $$ProtocolsTableUpdateCompanionBuilder,
      (Protocol, $$ProtocolsTableReferences),
      Protocol,
      PrefetchHooks Function({
        bool userId,
        bool protocolSnapshotsRefs,
        bool medicationsRefs,
        bool supplementsRefs,
        bool scheduledWorkoutsRefs,
      })
    >;
typedef $$ProtocolSnapshotsTableCreateCompanionBuilder =
    ProtocolSnapshotsCompanion Function({
      required String id,
      required String protocolId,
      required DateTime effectiveDate,
      required String serializedProtocol,
      Value<String?> changeReason,
      Value<int> rowid,
    });
typedef $$ProtocolSnapshotsTableUpdateCompanionBuilder =
    ProtocolSnapshotsCompanion Function({
      Value<String> id,
      Value<String> protocolId,
      Value<DateTime> effectiveDate,
      Value<String> serializedProtocol,
      Value<String?> changeReason,
      Value<int> rowid,
    });

final class $$ProtocolSnapshotsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProtocolSnapshotsTable,
          ProtocolSnapshot
        > {
  $$ProtocolSnapshotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias(
        $_aliasNameGenerator(db.protocolSnapshots.protocolId, db.protocols.id),
      );

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<String>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProtocolSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $ProtocolSnapshotsTable> {
  $$ProtocolSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get effectiveDate => $composableBuilder(
    column: $table.effectiveDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serializedProtocol => $composableBuilder(
    column: $table.serializedProtocol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get changeReason => $composableBuilder(
    column: $table.changeReason,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProtocolSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProtocolSnapshotsTable> {
  $$ProtocolSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get effectiveDate => $composableBuilder(
    column: $table.effectiveDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serializedProtocol => $composableBuilder(
    column: $table.serializedProtocol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get changeReason => $composableBuilder(
    column: $table.changeReason,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProtocolSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProtocolSnapshotsTable> {
  $$ProtocolSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get effectiveDate => $composableBuilder(
    column: $table.effectiveDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serializedProtocol => $composableBuilder(
    column: $table.serializedProtocol,
    builder: (column) => column,
  );

  GeneratedColumn<String> get changeReason => $composableBuilder(
    column: $table.changeReason,
    builder: (column) => column,
  );

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProtocolSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProtocolSnapshotsTable,
          ProtocolSnapshot,
          $$ProtocolSnapshotsTableFilterComposer,
          $$ProtocolSnapshotsTableOrderingComposer,
          $$ProtocolSnapshotsTableAnnotationComposer,
          $$ProtocolSnapshotsTableCreateCompanionBuilder,
          $$ProtocolSnapshotsTableUpdateCompanionBuilder,
          (ProtocolSnapshot, $$ProtocolSnapshotsTableReferences),
          ProtocolSnapshot,
          PrefetchHooks Function({bool protocolId})
        > {
  $$ProtocolSnapshotsTableTableManager(
    _$AppDatabase db,
    $ProtocolSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProtocolSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProtocolSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProtocolSnapshotsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> protocolId = const Value.absent(),
                Value<DateTime> effectiveDate = const Value.absent(),
                Value<String> serializedProtocol = const Value.absent(),
                Value<String?> changeReason = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProtocolSnapshotsCompanion(
                id: id,
                protocolId: protocolId,
                effectiveDate: effectiveDate,
                serializedProtocol: serializedProtocol,
                changeReason: changeReason,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String protocolId,
                required DateTime effectiveDate,
                required String serializedProtocol,
                Value<String?> changeReason = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProtocolSnapshotsCompanion.insert(
                id: id,
                protocolId: protocolId,
                effectiveDate: effectiveDate,
                serializedProtocol: serializedProtocol,
                changeReason: changeReason,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProtocolSnapshotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protocolId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protocolId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.protocolId,
                                referencedTable:
                                    $$ProtocolSnapshotsTableReferences
                                        ._protocolIdTable(db),
                                referencedColumn:
                                    $$ProtocolSnapshotsTableReferences
                                        ._protocolIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProtocolSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProtocolSnapshotsTable,
      ProtocolSnapshot,
      $$ProtocolSnapshotsTableFilterComposer,
      $$ProtocolSnapshotsTableOrderingComposer,
      $$ProtocolSnapshotsTableAnnotationComposer,
      $$ProtocolSnapshotsTableCreateCompanionBuilder,
      $$ProtocolSnapshotsTableUpdateCompanionBuilder,
      (ProtocolSnapshot, $$ProtocolSnapshotsTableReferences),
      ProtocolSnapshot,
      PrefetchHooks Function({bool protocolId})
    >;
typedef $$DailyLogsTableCreateCompanionBuilder =
    DailyLogsCompanion Function({
      required String id,
      required DateTime date,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<double?> weight,
      Value<String?> notes,
      Value<int?> moodEnergy,
      Value<int?> hunger,
      Value<int?> stress,
      required String symptomsJson,
      Value<int> rowid,
    });
typedef $$DailyLogsTableUpdateCompanionBuilder =
    DailyLogsCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<double?> weight,
      Value<String?> notes,
      Value<int?> moodEnergy,
      Value<int?> hunger,
      Value<int?> stress,
      Value<String> symptomsJson,
      Value<int> rowid,
    });

final class $$DailyLogsTableReferences
    extends BaseReferences<_$AppDatabase, $DailyLogsTable, DailyLog> {
  $$DailyLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MeasurementLogsTable, List<MeasurementLog>>
  _measurementLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.measurementLogs,
    aliasName: $_aliasNameGenerator(
      db.dailyLogs.id,
      db.measurementLogs.dailyLogId,
    ),
  );

  $$MeasurementLogsTableProcessedTableManager get measurementLogsRefs {
    final manager = $$MeasurementLogsTableTableManager(
      $_db,
      $_db.measurementLogs,
    ).filter((f) => f.dailyLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _measurementLogsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealLogsTable, List<MealLog>> _mealLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.mealLogs,
    aliasName: $_aliasNameGenerator(db.dailyLogs.id, db.mealLogs.dailyLogId),
  );

  $$MealLogsTableProcessedTableManager get mealLogsRefs {
    final manager = $$MealLogsTableTableManager(
      $_db,
      $_db.mealLogs,
    ).filter((f) => f.dailyLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutLogsTable, List<WorkoutLog>>
  _workoutLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutLogs,
    aliasName: $_aliasNameGenerator(db.dailyLogs.id, db.workoutLogs.dailyLogId),
  );

  $$WorkoutLogsTableProcessedTableManager get workoutLogsRefs {
    final manager = $$WorkoutLogsTableTableManager(
      $_db,
      $_db.workoutLogs,
    ).filter((f) => f.dailyLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RecoveryMetricsTableTable,
    List<RecoveryMetricsTableData>
  >
  _recoveryMetricsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recoveryMetricsTable,
        aliasName: $_aliasNameGenerator(
          db.dailyLogs.id,
          db.recoveryMetricsTable.dailyLogId,
        ),
      );

  $$RecoveryMetricsTableTableProcessedTableManager
  get recoveryMetricsTableRefs {
    final manager = $$RecoveryMetricsTableTableTableManager(
      $_db,
      $_db.recoveryMetricsTable,
    ).filter((f) => f.dailyLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recoveryMetricsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DailyLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyLogsTable> {
  $$DailyLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moodEnergy => $composableBuilder(
    column: $table.moodEnergy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hunger => $composableBuilder(
    column: $table.hunger,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stress => $composableBuilder(
    column: $table.stress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symptomsJson => $composableBuilder(
    column: $table.symptomsJson,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> measurementLogsRefs(
    Expression<bool> Function($$MeasurementLogsTableFilterComposer f) f,
  ) {
    final $$MeasurementLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.measurementLogs,
      getReferencedColumn: (t) => t.dailyLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeasurementLogsTableFilterComposer(
            $db: $db,
            $table: $db.measurementLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealLogsRefs(
    Expression<bool> Function($$MealLogsTableFilterComposer f) f,
  ) {
    final $$MealLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.dailyLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableFilterComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutLogsRefs(
    Expression<bool> Function($$WorkoutLogsTableFilterComposer f) f,
  ) {
    final $$WorkoutLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.dailyLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recoveryMetricsTableRefs(
    Expression<bool> Function($$RecoveryMetricsTableTableFilterComposer f) f,
  ) {
    final $$RecoveryMetricsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recoveryMetricsTable,
      getReferencedColumn: (t) => t.dailyLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecoveryMetricsTableTableFilterComposer(
            $db: $db,
            $table: $db.recoveryMetricsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DailyLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyLogsTable> {
  $$DailyLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moodEnergy => $composableBuilder(
    column: $table.moodEnergy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hunger => $composableBuilder(
    column: $table.hunger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stress => $composableBuilder(
    column: $table.stress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symptomsJson => $composableBuilder(
    column: $table.symptomsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyLogsTable> {
  $$DailyLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get moodEnergy => $composableBuilder(
    column: $table.moodEnergy,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hunger =>
      $composableBuilder(column: $table.hunger, builder: (column) => column);

  GeneratedColumn<int> get stress =>
      $composableBuilder(column: $table.stress, builder: (column) => column);

  GeneratedColumn<String> get symptomsJson => $composableBuilder(
    column: $table.symptomsJson,
    builder: (column) => column,
  );

  Expression<T> measurementLogsRefs<T extends Object>(
    Expression<T> Function($$MeasurementLogsTableAnnotationComposer a) f,
  ) {
    final $$MeasurementLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.measurementLogs,
      getReferencedColumn: (t) => t.dailyLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeasurementLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.measurementLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealLogsRefs<T extends Object>(
    Expression<T> Function($$MealLogsTableAnnotationComposer a) f,
  ) {
    final $$MealLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.dailyLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workoutLogsRefs<T extends Object>(
    Expression<T> Function($$WorkoutLogsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.dailyLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recoveryMetricsTableRefs<T extends Object>(
    Expression<T> Function($$RecoveryMetricsTableTableAnnotationComposer a) f,
  ) {
    final $$RecoveryMetricsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recoveryMetricsTable,
          getReferencedColumn: (t) => t.dailyLogId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecoveryMetricsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recoveryMetricsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DailyLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyLogsTable,
          DailyLog,
          $$DailyLogsTableFilterComposer,
          $$DailyLogsTableOrderingComposer,
          $$DailyLogsTableAnnotationComposer,
          $$DailyLogsTableCreateCompanionBuilder,
          $$DailyLogsTableUpdateCompanionBuilder,
          (DailyLog, $$DailyLogsTableReferences),
          DailyLog,
          PrefetchHooks Function({
            bool measurementLogsRefs,
            bool mealLogsRefs,
            bool workoutLogsRefs,
            bool recoveryMetricsTableRefs,
          })
        > {
  $$DailyLogsTableTableManager(_$AppDatabase db, $DailyLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> moodEnergy = const Value.absent(),
                Value<int?> hunger = const Value.absent(),
                Value<int?> stress = const Value.absent(),
                Value<String> symptomsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyLogsCompanion(
                id: id,
                date: date,
                createdAt: createdAt,
                updatedAt: updatedAt,
                weight: weight,
                notes: notes,
                moodEnergy: moodEnergy,
                hunger: hunger,
                stress: stress,
                symptomsJson: symptomsJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<double?> weight = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> moodEnergy = const Value.absent(),
                Value<int?> hunger = const Value.absent(),
                Value<int?> stress = const Value.absent(),
                required String symptomsJson,
                Value<int> rowid = const Value.absent(),
              }) => DailyLogsCompanion.insert(
                id: id,
                date: date,
                createdAt: createdAt,
                updatedAt: updatedAt,
                weight: weight,
                notes: notes,
                moodEnergy: moodEnergy,
                hunger: hunger,
                stress: stress,
                symptomsJson: symptomsJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DailyLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                measurementLogsRefs = false,
                mealLogsRefs = false,
                workoutLogsRefs = false,
                recoveryMetricsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (measurementLogsRefs) db.measurementLogs,
                    if (mealLogsRefs) db.mealLogs,
                    if (workoutLogsRefs) db.workoutLogs,
                    if (recoveryMetricsTableRefs) db.recoveryMetricsTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (measurementLogsRefs)
                        await $_getPrefetchedData<
                          DailyLog,
                          $DailyLogsTable,
                          MeasurementLog
                        >(
                          currentTable: table,
                          referencedTable: $$DailyLogsTableReferences
                              ._measurementLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DailyLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).measurementLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dailyLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mealLogsRefs)
                        await $_getPrefetchedData<
                          DailyLog,
                          $DailyLogsTable,
                          MealLog
                        >(
                          currentTable: table,
                          referencedTable: $$DailyLogsTableReferences
                              ._mealLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DailyLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dailyLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutLogsRefs)
                        await $_getPrefetchedData<
                          DailyLog,
                          $DailyLogsTable,
                          WorkoutLog
                        >(
                          currentTable: table,
                          referencedTable: $$DailyLogsTableReferences
                              ._workoutLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DailyLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dailyLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recoveryMetricsTableRefs)
                        await $_getPrefetchedData<
                          DailyLog,
                          $DailyLogsTable,
                          RecoveryMetricsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$DailyLogsTableReferences
                              ._recoveryMetricsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DailyLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).recoveryMetricsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dailyLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DailyLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyLogsTable,
      DailyLog,
      $$DailyLogsTableFilterComposer,
      $$DailyLogsTableOrderingComposer,
      $$DailyLogsTableAnnotationComposer,
      $$DailyLogsTableCreateCompanionBuilder,
      $$DailyLogsTableUpdateCompanionBuilder,
      (DailyLog, $$DailyLogsTableReferences),
      DailyLog,
      PrefetchHooks Function({
        bool measurementLogsRefs,
        bool mealLogsRefs,
        bool workoutLogsRefs,
        bool recoveryMetricsTableRefs,
      })
    >;
typedef $$MeasurementLogsTableCreateCompanionBuilder =
    MeasurementLogsCompanion Function({
      required String id,
      required String dailyLogId,
      required DateTime date,
      Value<double?> waist,
      Value<double?> chest,
      Value<double?> hip,
      Value<double?> thigh,
      Value<double?> arm,
      Value<int> rowid,
    });
typedef $$MeasurementLogsTableUpdateCompanionBuilder =
    MeasurementLogsCompanion Function({
      Value<String> id,
      Value<String> dailyLogId,
      Value<DateTime> date,
      Value<double?> waist,
      Value<double?> chest,
      Value<double?> hip,
      Value<double?> thigh,
      Value<double?> arm,
      Value<int> rowid,
    });

final class $$MeasurementLogsTableReferences
    extends
        BaseReferences<_$AppDatabase, $MeasurementLogsTable, MeasurementLog> {
  $$MeasurementLogsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DailyLogsTable _dailyLogIdTable(_$AppDatabase db) =>
      db.dailyLogs.createAlias(
        $_aliasNameGenerator(db.measurementLogs.dailyLogId, db.dailyLogs.id),
      );

  $$DailyLogsTableProcessedTableManager get dailyLogId {
    final $_column = $_itemColumn<String>('daily_log_id')!;

    final manager = $$DailyLogsTableTableManager(
      $_db,
      $_db.dailyLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dailyLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MeasurementLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MeasurementLogsTable> {
  $$MeasurementLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get waist => $composableBuilder(
    column: $table.waist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get chest => $composableBuilder(
    column: $table.chest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hip => $composableBuilder(
    column: $table.hip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get thigh => $composableBuilder(
    column: $table.thigh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get arm => $composableBuilder(
    column: $table.arm,
    builder: (column) => ColumnFilters(column),
  );

  $$DailyLogsTableFilterComposer get dailyLogId {
    final $$DailyLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableFilterComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeasurementLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeasurementLogsTable> {
  $$MeasurementLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get waist => $composableBuilder(
    column: $table.waist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get chest => $composableBuilder(
    column: $table.chest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hip => $composableBuilder(
    column: $table.hip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get thigh => $composableBuilder(
    column: $table.thigh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get arm => $composableBuilder(
    column: $table.arm,
    builder: (column) => ColumnOrderings(column),
  );

  $$DailyLogsTableOrderingComposer get dailyLogId {
    final $$DailyLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableOrderingComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeasurementLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeasurementLogsTable> {
  $$MeasurementLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get waist =>
      $composableBuilder(column: $table.waist, builder: (column) => column);

  GeneratedColumn<double> get chest =>
      $composableBuilder(column: $table.chest, builder: (column) => column);

  GeneratedColumn<double> get hip =>
      $composableBuilder(column: $table.hip, builder: (column) => column);

  GeneratedColumn<double> get thigh =>
      $composableBuilder(column: $table.thigh, builder: (column) => column);

  GeneratedColumn<double> get arm =>
      $composableBuilder(column: $table.arm, builder: (column) => column);

  $$DailyLogsTableAnnotationComposer get dailyLogId {
    final $$DailyLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeasurementLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MeasurementLogsTable,
          MeasurementLog,
          $$MeasurementLogsTableFilterComposer,
          $$MeasurementLogsTableOrderingComposer,
          $$MeasurementLogsTableAnnotationComposer,
          $$MeasurementLogsTableCreateCompanionBuilder,
          $$MeasurementLogsTableUpdateCompanionBuilder,
          (MeasurementLog, $$MeasurementLogsTableReferences),
          MeasurementLog,
          PrefetchHooks Function({bool dailyLogId})
        > {
  $$MeasurementLogsTableTableManager(
    _$AppDatabase db,
    $MeasurementLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeasurementLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeasurementLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeasurementLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dailyLogId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double?> waist = const Value.absent(),
                Value<double?> chest = const Value.absent(),
                Value<double?> hip = const Value.absent(),
                Value<double?> thigh = const Value.absent(),
                Value<double?> arm = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MeasurementLogsCompanion(
                id: id,
                dailyLogId: dailyLogId,
                date: date,
                waist: waist,
                chest: chest,
                hip: hip,
                thigh: thigh,
                arm: arm,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dailyLogId,
                required DateTime date,
                Value<double?> waist = const Value.absent(),
                Value<double?> chest = const Value.absent(),
                Value<double?> hip = const Value.absent(),
                Value<double?> thigh = const Value.absent(),
                Value<double?> arm = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MeasurementLogsCompanion.insert(
                id: id,
                dailyLogId: dailyLogId,
                date: date,
                waist: waist,
                chest: chest,
                hip: hip,
                thigh: thigh,
                arm: arm,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MeasurementLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dailyLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dailyLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dailyLogId,
                                referencedTable:
                                    $$MeasurementLogsTableReferences
                                        ._dailyLogIdTable(db),
                                referencedColumn:
                                    $$MeasurementLogsTableReferences
                                        ._dailyLogIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MeasurementLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MeasurementLogsTable,
      MeasurementLog,
      $$MeasurementLogsTableFilterComposer,
      $$MeasurementLogsTableOrderingComposer,
      $$MeasurementLogsTableAnnotationComposer,
      $$MeasurementLogsTableCreateCompanionBuilder,
      $$MeasurementLogsTableUpdateCompanionBuilder,
      (MeasurementLog, $$MeasurementLogsTableReferences),
      MeasurementLog,
      PrefetchHooks Function({bool dailyLogId})
    >;
typedef $$MealLogsTableCreateCompanionBuilder =
    MealLogsCompanion Function({
      required String id,
      required String dailyLogId,
      required DateTime time,
      required DateTime createdAt,
      required String method,
      Value<String?> photoUri,
      Value<String?> templateId,
      Value<String?> aiAnalysisId,
      Value<int> rowid,
    });
typedef $$MealLogsTableUpdateCompanionBuilder =
    MealLogsCompanion Function({
      Value<String> id,
      Value<String> dailyLogId,
      Value<DateTime> time,
      Value<DateTime> createdAt,
      Value<String> method,
      Value<String?> photoUri,
      Value<String?> templateId,
      Value<String?> aiAnalysisId,
      Value<int> rowid,
    });

final class $$MealLogsTableReferences
    extends BaseReferences<_$AppDatabase, $MealLogsTable, MealLog> {
  $$MealLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DailyLogsTable _dailyLogIdTable(_$AppDatabase db) =>
      db.dailyLogs.createAlias(
        $_aliasNameGenerator(db.mealLogs.dailyLogId, db.dailyLogs.id),
      );

  $$DailyLogsTableProcessedTableManager get dailyLogId {
    final $_column = $_itemColumn<String>('daily_log_id')!;

    final manager = $$DailyLogsTableTableManager(
      $_db,
      $_db.dailyLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dailyLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MealItemsTable, List<MealItem>>
  _mealItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealItems,
    aliasName: $_aliasNameGenerator(db.mealLogs.id, db.mealItems.mealLogId),
  );

  $$MealItemsTableProcessedTableManager get mealItemsRefs {
    final manager = $$MealItemsTableTableManager(
      $_db,
      $_db.mealItems,
    ).filter((f) => f.mealLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AiFoodAnalysesTable, List<AiFoodAnalyse>>
  _aiFoodAnalysesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.aiFoodAnalyses,
    aliasName: $_aliasNameGenerator(
      db.mealLogs.id,
      db.aiFoodAnalyses.mealLogId,
    ),
  );

  $$AiFoodAnalysesTableProcessedTableManager get aiFoodAnalysesRefs {
    final manager = $$AiFoodAnalysesTableTableManager(
      $_db,
      $_db.aiFoodAnalyses,
    ).filter((f) => f.mealLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_aiFoodAnalysesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUri => $composableBuilder(
    column: $table.photoUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aiAnalysisId => $composableBuilder(
    column: $table.aiAnalysisId,
    builder: (column) => ColumnFilters(column),
  );

  $$DailyLogsTableFilterComposer get dailyLogId {
    final $$DailyLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableFilterComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> mealItemsRefs(
    Expression<bool> Function($$MealItemsTableFilterComposer f) f,
  ) {
    final $$MealItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealItems,
      getReferencedColumn: (t) => t.mealLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealItemsTableFilterComposer(
            $db: $db,
            $table: $db.mealItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> aiFoodAnalysesRefs(
    Expression<bool> Function($$AiFoodAnalysesTableFilterComposer f) f,
  ) {
    final $$AiFoodAnalysesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.aiFoodAnalyses,
      getReferencedColumn: (t) => t.mealLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AiFoodAnalysesTableFilterComposer(
            $db: $db,
            $table: $db.aiFoodAnalyses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUri => $composableBuilder(
    column: $table.photoUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aiAnalysisId => $composableBuilder(
    column: $table.aiAnalysisId,
    builder: (column) => ColumnOrderings(column),
  );

  $$DailyLogsTableOrderingComposer get dailyLogId {
    final $$DailyLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableOrderingComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get photoUri =>
      $composableBuilder(column: $table.photoUri, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get aiAnalysisId => $composableBuilder(
    column: $table.aiAnalysisId,
    builder: (column) => column,
  );

  $$DailyLogsTableAnnotationComposer get dailyLogId {
    final $$DailyLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> mealItemsRefs<T extends Object>(
    Expression<T> Function($$MealItemsTableAnnotationComposer a) f,
  ) {
    final $$MealItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealItems,
      getReferencedColumn: (t) => t.mealLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> aiFoodAnalysesRefs<T extends Object>(
    Expression<T> Function($$AiFoodAnalysesTableAnnotationComposer a) f,
  ) {
    final $$AiFoodAnalysesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.aiFoodAnalyses,
      getReferencedColumn: (t) => t.mealLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AiFoodAnalysesTableAnnotationComposer(
            $db: $db,
            $table: $db.aiFoodAnalyses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealLogsTable,
          MealLog,
          $$MealLogsTableFilterComposer,
          $$MealLogsTableOrderingComposer,
          $$MealLogsTableAnnotationComposer,
          $$MealLogsTableCreateCompanionBuilder,
          $$MealLogsTableUpdateCompanionBuilder,
          (MealLog, $$MealLogsTableReferences),
          MealLog,
          PrefetchHooks Function({
            bool dailyLogId,
            bool mealItemsRefs,
            bool aiFoodAnalysesRefs,
          })
        > {
  $$MealLogsTableTableManager(_$AppDatabase db, $MealLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dailyLogId = const Value.absent(),
                Value<DateTime> time = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String?> photoUri = const Value.absent(),
                Value<String?> templateId = const Value.absent(),
                Value<String?> aiAnalysisId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealLogsCompanion(
                id: id,
                dailyLogId: dailyLogId,
                time: time,
                createdAt: createdAt,
                method: method,
                photoUri: photoUri,
                templateId: templateId,
                aiAnalysisId: aiAnalysisId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dailyLogId,
                required DateTime time,
                required DateTime createdAt,
                required String method,
                Value<String?> photoUri = const Value.absent(),
                Value<String?> templateId = const Value.absent(),
                Value<String?> aiAnalysisId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealLogsCompanion.insert(
                id: id,
                dailyLogId: dailyLogId,
                time: time,
                createdAt: createdAt,
                method: method,
                photoUri: photoUri,
                templateId: templateId,
                aiAnalysisId: aiAnalysisId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                dailyLogId = false,
                mealItemsRefs = false,
                aiFoodAnalysesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mealItemsRefs) db.mealItems,
                    if (aiFoodAnalysesRefs) db.aiFoodAnalyses,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (dailyLogId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dailyLogId,
                                    referencedTable: $$MealLogsTableReferences
                                        ._dailyLogIdTable(db),
                                    referencedColumn: $$MealLogsTableReferences
                                        ._dailyLogIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (mealItemsRefs)
                        await $_getPrefetchedData<
                          MealLog,
                          $MealLogsTable,
                          MealItem
                        >(
                          currentTable: table,
                          referencedTable: $$MealLogsTableReferences
                              ._mealItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MealLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mealLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (aiFoodAnalysesRefs)
                        await $_getPrefetchedData<
                          MealLog,
                          $MealLogsTable,
                          AiFoodAnalyse
                        >(
                          currentTable: table,
                          referencedTable: $$MealLogsTableReferences
                              ._aiFoodAnalysesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MealLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).aiFoodAnalysesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mealLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MealLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealLogsTable,
      MealLog,
      $$MealLogsTableFilterComposer,
      $$MealLogsTableOrderingComposer,
      $$MealLogsTableAnnotationComposer,
      $$MealLogsTableCreateCompanionBuilder,
      $$MealLogsTableUpdateCompanionBuilder,
      (MealLog, $$MealLogsTableReferences),
      MealLog,
      PrefetchHooks Function({
        bool dailyLogId,
        bool mealItemsRefs,
        bool aiFoodAnalysesRefs,
      })
    >;
typedef $$MealItemsTableCreateCompanionBuilder =
    MealItemsCompanion Function({
      required String id,
      required String mealLogId,
      required String name,
      Value<String?> portion,
      Value<int?> caloriesEstimate,
      Value<int?> proteinEstimate,
      Value<int?> carbsEstimate,
      Value<int?> fatEstimate,
      Value<bool> isAiEstimate,
      Value<bool> isUserEdited,
      Value<int?> confidence,
      Value<int> rowid,
    });
typedef $$MealItemsTableUpdateCompanionBuilder =
    MealItemsCompanion Function({
      Value<String> id,
      Value<String> mealLogId,
      Value<String> name,
      Value<String?> portion,
      Value<int?> caloriesEstimate,
      Value<int?> proteinEstimate,
      Value<int?> carbsEstimate,
      Value<int?> fatEstimate,
      Value<bool> isAiEstimate,
      Value<bool> isUserEdited,
      Value<int?> confidence,
      Value<int> rowid,
    });

final class $$MealItemsTableReferences
    extends BaseReferences<_$AppDatabase, $MealItemsTable, MealItem> {
  $$MealItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MealLogsTable _mealLogIdTable(_$AppDatabase db) =>
      db.mealLogs.createAlias(
        $_aliasNameGenerator(db.mealItems.mealLogId, db.mealLogs.id),
      );

  $$MealLogsTableProcessedTableManager get mealLogId {
    final $_column = $_itemColumn<String>('meal_log_id')!;

    final manager = $$MealLogsTableTableManager(
      $_db,
      $_db.mealLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MealItemsTable> {
  $$MealItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get portion => $composableBuilder(
    column: $table.portion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caloriesEstimate => $composableBuilder(
    column: $table.caloriesEstimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get proteinEstimate => $composableBuilder(
    column: $table.proteinEstimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get carbsEstimate => $composableBuilder(
    column: $table.carbsEstimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fatEstimate => $composableBuilder(
    column: $table.fatEstimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAiEstimate => $composableBuilder(
    column: $table.isAiEstimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUserEdited => $composableBuilder(
    column: $table.isUserEdited,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  $$MealLogsTableFilterComposer get mealLogId {
    final $$MealLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealLogId,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableFilterComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealItemsTable> {
  $$MealItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get portion => $composableBuilder(
    column: $table.portion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caloriesEstimate => $composableBuilder(
    column: $table.caloriesEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get proteinEstimate => $composableBuilder(
    column: $table.proteinEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get carbsEstimate => $composableBuilder(
    column: $table.carbsEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fatEstimate => $composableBuilder(
    column: $table.fatEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAiEstimate => $composableBuilder(
    column: $table.isAiEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUserEdited => $composableBuilder(
    column: $table.isUserEdited,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealLogsTableOrderingComposer get mealLogId {
    final $$MealLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealLogId,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableOrderingComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealItemsTable> {
  $$MealItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get portion =>
      $composableBuilder(column: $table.portion, builder: (column) => column);

  GeneratedColumn<int> get caloriesEstimate => $composableBuilder(
    column: $table.caloriesEstimate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get proteinEstimate => $composableBuilder(
    column: $table.proteinEstimate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get carbsEstimate => $composableBuilder(
    column: $table.carbsEstimate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fatEstimate => $composableBuilder(
    column: $table.fatEstimate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAiEstimate => $composableBuilder(
    column: $table.isAiEstimate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUserEdited => $composableBuilder(
    column: $table.isUserEdited,
    builder: (column) => column,
  );

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  $$MealLogsTableAnnotationComposer get mealLogId {
    final $$MealLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealLogId,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealItemsTable,
          MealItem,
          $$MealItemsTableFilterComposer,
          $$MealItemsTableOrderingComposer,
          $$MealItemsTableAnnotationComposer,
          $$MealItemsTableCreateCompanionBuilder,
          $$MealItemsTableUpdateCompanionBuilder,
          (MealItem, $$MealItemsTableReferences),
          MealItem,
          PrefetchHooks Function({bool mealLogId})
        > {
  $$MealItemsTableTableManager(_$AppDatabase db, $MealItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mealLogId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> portion = const Value.absent(),
                Value<int?> caloriesEstimate = const Value.absent(),
                Value<int?> proteinEstimate = const Value.absent(),
                Value<int?> carbsEstimate = const Value.absent(),
                Value<int?> fatEstimate = const Value.absent(),
                Value<bool> isAiEstimate = const Value.absent(),
                Value<bool> isUserEdited = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealItemsCompanion(
                id: id,
                mealLogId: mealLogId,
                name: name,
                portion: portion,
                caloriesEstimate: caloriesEstimate,
                proteinEstimate: proteinEstimate,
                carbsEstimate: carbsEstimate,
                fatEstimate: fatEstimate,
                isAiEstimate: isAiEstimate,
                isUserEdited: isUserEdited,
                confidence: confidence,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mealLogId,
                required String name,
                Value<String?> portion = const Value.absent(),
                Value<int?> caloriesEstimate = const Value.absent(),
                Value<int?> proteinEstimate = const Value.absent(),
                Value<int?> carbsEstimate = const Value.absent(),
                Value<int?> fatEstimate = const Value.absent(),
                Value<bool> isAiEstimate = const Value.absent(),
                Value<bool> isUserEdited = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealItemsCompanion.insert(
                id: id,
                mealLogId: mealLogId,
                name: name,
                portion: portion,
                caloriesEstimate: caloriesEstimate,
                proteinEstimate: proteinEstimate,
                carbsEstimate: carbsEstimate,
                fatEstimate: fatEstimate,
                isAiEstimate: isAiEstimate,
                isUserEdited: isUserEdited,
                confidence: confidence,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mealLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mealLogId,
                                referencedTable: $$MealItemsTableReferences
                                    ._mealLogIdTable(db),
                                referencedColumn: $$MealItemsTableReferences
                                    ._mealLogIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MealItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealItemsTable,
      MealItem,
      $$MealItemsTableFilterComposer,
      $$MealItemsTableOrderingComposer,
      $$MealItemsTableAnnotationComposer,
      $$MealItemsTableCreateCompanionBuilder,
      $$MealItemsTableUpdateCompanionBuilder,
      (MealItem, $$MealItemsTableReferences),
      MealItem,
      PrefetchHooks Function({bool mealLogId})
    >;
typedef $$WorkoutLogsTableCreateCompanionBuilder =
    WorkoutLogsCompanion Function({
      required String id,
      required String dailyLogId,
      required DateTime date,
      required String type,
      required int duration,
      Value<int?> intensity,
      Value<String?> notes,
      required String source,
      Value<int?> caloriesBurned,
      Value<int> rowid,
    });
typedef $$WorkoutLogsTableUpdateCompanionBuilder =
    WorkoutLogsCompanion Function({
      Value<String> id,
      Value<String> dailyLogId,
      Value<DateTime> date,
      Value<String> type,
      Value<int> duration,
      Value<int?> intensity,
      Value<String?> notes,
      Value<String> source,
      Value<int?> caloriesBurned,
      Value<int> rowid,
    });

final class $$WorkoutLogsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutLogsTable, WorkoutLog> {
  $$WorkoutLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DailyLogsTable _dailyLogIdTable(_$AppDatabase db) =>
      db.dailyLogs.createAlias(
        $_aliasNameGenerator(db.workoutLogs.dailyLogId, db.dailyLogs.id),
      );

  $$DailyLogsTableProcessedTableManager get dailyLogId {
    final $_column = $_itemColumn<String>('daily_log_id')!;

    final manager = $$DailyLogsTableTableManager(
      $_db,
      $_db.dailyLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dailyLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkoutLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => ColumnFilters(column),
  );

  $$DailyLogsTableFilterComposer get dailyLogId {
    final $$DailyLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableFilterComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => ColumnOrderings(column),
  );

  $$DailyLogsTableOrderingComposer get dailyLogId {
    final $$DailyLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableOrderingComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get intensity =>
      $composableBuilder(column: $table.intensity, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => column,
  );

  $$DailyLogsTableAnnotationComposer get dailyLogId {
    final $$DailyLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutLogsTable,
          WorkoutLog,
          $$WorkoutLogsTableFilterComposer,
          $$WorkoutLogsTableOrderingComposer,
          $$WorkoutLogsTableAnnotationComposer,
          $$WorkoutLogsTableCreateCompanionBuilder,
          $$WorkoutLogsTableUpdateCompanionBuilder,
          (WorkoutLog, $$WorkoutLogsTableReferences),
          WorkoutLog,
          PrefetchHooks Function({bool dailyLogId})
        > {
  $$WorkoutLogsTableTableManager(_$AppDatabase db, $WorkoutLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dailyLogId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<int?> intensity = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int?> caloriesBurned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutLogsCompanion(
                id: id,
                dailyLogId: dailyLogId,
                date: date,
                type: type,
                duration: duration,
                intensity: intensity,
                notes: notes,
                source: source,
                caloriesBurned: caloriesBurned,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dailyLogId,
                required DateTime date,
                required String type,
                required int duration,
                Value<int?> intensity = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String source,
                Value<int?> caloriesBurned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutLogsCompanion.insert(
                id: id,
                dailyLogId: dailyLogId,
                date: date,
                type: type,
                duration: duration,
                intensity: intensity,
                notes: notes,
                source: source,
                caloriesBurned: caloriesBurned,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dailyLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dailyLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dailyLogId,
                                referencedTable: $$WorkoutLogsTableReferences
                                    ._dailyLogIdTable(db),
                                referencedColumn: $$WorkoutLogsTableReferences
                                    ._dailyLogIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutLogsTable,
      WorkoutLog,
      $$WorkoutLogsTableFilterComposer,
      $$WorkoutLogsTableOrderingComposer,
      $$WorkoutLogsTableAnnotationComposer,
      $$WorkoutLogsTableCreateCompanionBuilder,
      $$WorkoutLogsTableUpdateCompanionBuilder,
      (WorkoutLog, $$WorkoutLogsTableReferences),
      WorkoutLog,
      PrefetchHooks Function({bool dailyLogId})
    >;
typedef $$RecoveryMetricsTableTableCreateCompanionBuilder =
    RecoveryMetricsTableCompanion Function({
      required String id,
      required String dailyLogId,
      required DateTime date,
      required DateTime fetchedAt,
      Value<double?> sleepDuration,
      Value<int?> sleepQuality,
      Value<int?> hrv,
      Value<int?> restingHR,
      Value<int?> steps,
      Value<int?> activeEnergy,
      Value<int?> workoutsCount,
      required String dataSource,
      Value<int> rowid,
    });
typedef $$RecoveryMetricsTableTableUpdateCompanionBuilder =
    RecoveryMetricsTableCompanion Function({
      Value<String> id,
      Value<String> dailyLogId,
      Value<DateTime> date,
      Value<DateTime> fetchedAt,
      Value<double?> sleepDuration,
      Value<int?> sleepQuality,
      Value<int?> hrv,
      Value<int?> restingHR,
      Value<int?> steps,
      Value<int?> activeEnergy,
      Value<int?> workoutsCount,
      Value<String> dataSource,
      Value<int> rowid,
    });

final class $$RecoveryMetricsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecoveryMetricsTableTable,
          RecoveryMetricsTableData
        > {
  $$RecoveryMetricsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DailyLogsTable _dailyLogIdTable(_$AppDatabase db) =>
      db.dailyLogs.createAlias(
        $_aliasNameGenerator(
          db.recoveryMetricsTable.dailyLogId,
          db.dailyLogs.id,
        ),
      );

  $$DailyLogsTableProcessedTableManager get dailyLogId {
    final $_column = $_itemColumn<String>('daily_log_id')!;

    final manager = $$DailyLogsTableTableManager(
      $_db,
      $_db.dailyLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dailyLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecoveryMetricsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecoveryMetricsTableTable> {
  $$RecoveryMetricsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sleepDuration => $composableBuilder(
    column: $table.sleepDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleepQuality => $composableBuilder(
    column: $table.sleepQuality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hrv => $composableBuilder(
    column: $table.hrv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restingHR => $composableBuilder(
    column: $table.restingHR,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get activeEnergy => $composableBuilder(
    column: $table.activeEnergy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get workoutsCount => $composableBuilder(
    column: $table.workoutsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnFilters(column),
  );

  $$DailyLogsTableFilterComposer get dailyLogId {
    final $$DailyLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableFilterComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecoveryMetricsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecoveryMetricsTableTable> {
  $$RecoveryMetricsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sleepDuration => $composableBuilder(
    column: $table.sleepDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleepQuality => $composableBuilder(
    column: $table.sleepQuality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hrv => $composableBuilder(
    column: $table.hrv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restingHR => $composableBuilder(
    column: $table.restingHR,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get activeEnergy => $composableBuilder(
    column: $table.activeEnergy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get workoutsCount => $composableBuilder(
    column: $table.workoutsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnOrderings(column),
  );

  $$DailyLogsTableOrderingComposer get dailyLogId {
    final $$DailyLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableOrderingComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecoveryMetricsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecoveryMetricsTableTable> {
  $$RecoveryMetricsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);

  GeneratedColumn<double> get sleepDuration => $composableBuilder(
    column: $table.sleepDuration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sleepQuality => $composableBuilder(
    column: $table.sleepQuality,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hrv =>
      $composableBuilder(column: $table.hrv, builder: (column) => column);

  GeneratedColumn<int> get restingHR =>
      $composableBuilder(column: $table.restingHR, builder: (column) => column);

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<int> get activeEnergy => $composableBuilder(
    column: $table.activeEnergy,
    builder: (column) => column,
  );

  GeneratedColumn<int> get workoutsCount => $composableBuilder(
    column: $table.workoutsCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => column,
  );

  $$DailyLogsTableAnnotationComposer get dailyLogId {
    final $$DailyLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dailyLogId,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecoveryMetricsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecoveryMetricsTableTable,
          RecoveryMetricsTableData,
          $$RecoveryMetricsTableTableFilterComposer,
          $$RecoveryMetricsTableTableOrderingComposer,
          $$RecoveryMetricsTableTableAnnotationComposer,
          $$RecoveryMetricsTableTableCreateCompanionBuilder,
          $$RecoveryMetricsTableTableUpdateCompanionBuilder,
          (RecoveryMetricsTableData, $$RecoveryMetricsTableTableReferences),
          RecoveryMetricsTableData,
          PrefetchHooks Function({bool dailyLogId})
        > {
  $$RecoveryMetricsTableTableTableManager(
    _$AppDatabase db,
    $RecoveryMetricsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecoveryMetricsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecoveryMetricsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecoveryMetricsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dailyLogId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<double?> sleepDuration = const Value.absent(),
                Value<int?> sleepQuality = const Value.absent(),
                Value<int?> hrv = const Value.absent(),
                Value<int?> restingHR = const Value.absent(),
                Value<int?> steps = const Value.absent(),
                Value<int?> activeEnergy = const Value.absent(),
                Value<int?> workoutsCount = const Value.absent(),
                Value<String> dataSource = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecoveryMetricsTableCompanion(
                id: id,
                dailyLogId: dailyLogId,
                date: date,
                fetchedAt: fetchedAt,
                sleepDuration: sleepDuration,
                sleepQuality: sleepQuality,
                hrv: hrv,
                restingHR: restingHR,
                steps: steps,
                activeEnergy: activeEnergy,
                workoutsCount: workoutsCount,
                dataSource: dataSource,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dailyLogId,
                required DateTime date,
                required DateTime fetchedAt,
                Value<double?> sleepDuration = const Value.absent(),
                Value<int?> sleepQuality = const Value.absent(),
                Value<int?> hrv = const Value.absent(),
                Value<int?> restingHR = const Value.absent(),
                Value<int?> steps = const Value.absent(),
                Value<int?> activeEnergy = const Value.absent(),
                Value<int?> workoutsCount = const Value.absent(),
                required String dataSource,
                Value<int> rowid = const Value.absent(),
              }) => RecoveryMetricsTableCompanion.insert(
                id: id,
                dailyLogId: dailyLogId,
                date: date,
                fetchedAt: fetchedAt,
                sleepDuration: sleepDuration,
                sleepQuality: sleepQuality,
                hrv: hrv,
                restingHR: restingHR,
                steps: steps,
                activeEnergy: activeEnergy,
                workoutsCount: workoutsCount,
                dataSource: dataSource,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecoveryMetricsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dailyLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dailyLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dailyLogId,
                                referencedTable:
                                    $$RecoveryMetricsTableTableReferences
                                        ._dailyLogIdTable(db),
                                referencedColumn:
                                    $$RecoveryMetricsTableTableReferences
                                        ._dailyLogIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecoveryMetricsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecoveryMetricsTableTable,
      RecoveryMetricsTableData,
      $$RecoveryMetricsTableTableFilterComposer,
      $$RecoveryMetricsTableTableOrderingComposer,
      $$RecoveryMetricsTableTableAnnotationComposer,
      $$RecoveryMetricsTableTableCreateCompanionBuilder,
      $$RecoveryMetricsTableTableUpdateCompanionBuilder,
      (RecoveryMetricsTableData, $$RecoveryMetricsTableTableReferences),
      RecoveryMetricsTableData,
      PrefetchHooks Function({bool dailyLogId})
    >;
typedef $$DailyBriefsTableCreateCompanionBuilder =
    DailyBriefsCompanion Function({
      required String id,
      required DateTime date,
      required DateTime generatedAt,
      required int recoveryScore,
      required int readinessScore,
      required String topActionsJson,
      required String warningsJson,
      required int suggestedIntensity,
      required String coachingText,
      Value<bool> isAiGenerated,
      Value<String?> dailyLogId,
      Value<int> rowid,
    });
typedef $$DailyBriefsTableUpdateCompanionBuilder =
    DailyBriefsCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<DateTime> generatedAt,
      Value<int> recoveryScore,
      Value<int> readinessScore,
      Value<String> topActionsJson,
      Value<String> warningsJson,
      Value<int> suggestedIntensity,
      Value<String> coachingText,
      Value<bool> isAiGenerated,
      Value<String?> dailyLogId,
      Value<int> rowid,
    });

class $$DailyBriefsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyBriefsTable> {
  $$DailyBriefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recoveryScore => $composableBuilder(
    column: $table.recoveryScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readinessScore => $composableBuilder(
    column: $table.readinessScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topActionsJson => $composableBuilder(
    column: $table.topActionsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get suggestedIntensity => $composableBuilder(
    column: $table.suggestedIntensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coachingText => $composableBuilder(
    column: $table.coachingText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dailyLogId => $composableBuilder(
    column: $table.dailyLogId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyBriefsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyBriefsTable> {
  $$DailyBriefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recoveryScore => $composableBuilder(
    column: $table.recoveryScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readinessScore => $composableBuilder(
    column: $table.readinessScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topActionsJson => $composableBuilder(
    column: $table.topActionsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get suggestedIntensity => $composableBuilder(
    column: $table.suggestedIntensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coachingText => $composableBuilder(
    column: $table.coachingText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dailyLogId => $composableBuilder(
    column: $table.dailyLogId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyBriefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyBriefsTable> {
  $$DailyBriefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recoveryScore => $composableBuilder(
    column: $table.recoveryScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get readinessScore => $composableBuilder(
    column: $table.readinessScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get topActionsJson => $composableBuilder(
    column: $table.topActionsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get suggestedIntensity => $composableBuilder(
    column: $table.suggestedIntensity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coachingText => $composableBuilder(
    column: $table.coachingText,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dailyLogId => $composableBuilder(
    column: $table.dailyLogId,
    builder: (column) => column,
  );
}

class $$DailyBriefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyBriefsTable,
          DailyBrief,
          $$DailyBriefsTableFilterComposer,
          $$DailyBriefsTableOrderingComposer,
          $$DailyBriefsTableAnnotationComposer,
          $$DailyBriefsTableCreateCompanionBuilder,
          $$DailyBriefsTableUpdateCompanionBuilder,
          (
            DailyBrief,
            BaseReferences<_$AppDatabase, $DailyBriefsTable, DailyBrief>,
          ),
          DailyBrief,
          PrefetchHooks Function()
        > {
  $$DailyBriefsTableTableManager(_$AppDatabase db, $DailyBriefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyBriefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyBriefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyBriefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
                Value<int> recoveryScore = const Value.absent(),
                Value<int> readinessScore = const Value.absent(),
                Value<String> topActionsJson = const Value.absent(),
                Value<String> warningsJson = const Value.absent(),
                Value<int> suggestedIntensity = const Value.absent(),
                Value<String> coachingText = const Value.absent(),
                Value<bool> isAiGenerated = const Value.absent(),
                Value<String?> dailyLogId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyBriefsCompanion(
                id: id,
                date: date,
                generatedAt: generatedAt,
                recoveryScore: recoveryScore,
                readinessScore: readinessScore,
                topActionsJson: topActionsJson,
                warningsJson: warningsJson,
                suggestedIntensity: suggestedIntensity,
                coachingText: coachingText,
                isAiGenerated: isAiGenerated,
                dailyLogId: dailyLogId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                required DateTime generatedAt,
                required int recoveryScore,
                required int readinessScore,
                required String topActionsJson,
                required String warningsJson,
                required int suggestedIntensity,
                required String coachingText,
                Value<bool> isAiGenerated = const Value.absent(),
                Value<String?> dailyLogId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyBriefsCompanion.insert(
                id: id,
                date: date,
                generatedAt: generatedAt,
                recoveryScore: recoveryScore,
                readinessScore: readinessScore,
                topActionsJson: topActionsJson,
                warningsJson: warningsJson,
                suggestedIntensity: suggestedIntensity,
                coachingText: coachingText,
                isAiGenerated: isAiGenerated,
                dailyLogId: dailyLogId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyBriefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyBriefsTable,
      DailyBrief,
      $$DailyBriefsTableFilterComposer,
      $$DailyBriefsTableOrderingComposer,
      $$DailyBriefsTableAnnotationComposer,
      $$DailyBriefsTableCreateCompanionBuilder,
      $$DailyBriefsTableUpdateCompanionBuilder,
      (
        DailyBrief,
        BaseReferences<_$AppDatabase, $DailyBriefsTable, DailyBrief>,
      ),
      DailyBrief,
      PrefetchHooks Function()
    >;
typedef $$WeeklyReportsTableCreateCompanionBuilder =
    WeeklyReportsCompanion Function({
      required String id,
      required DateTime weekStartDate,
      required DateTime generatedAt,
      required String summary,
      required String highlightsJson,
      required String concernsJson,
      required String progressAnalysis,
      required String nextWeekFocus,
      Value<bool> isAiGenerated,
      Value<int> rowid,
    });
typedef $$WeeklyReportsTableUpdateCompanionBuilder =
    WeeklyReportsCompanion Function({
      Value<String> id,
      Value<DateTime> weekStartDate,
      Value<DateTime> generatedAt,
      Value<String> summary,
      Value<String> highlightsJson,
      Value<String> concernsJson,
      Value<String> progressAnalysis,
      Value<String> nextWeekFocus,
      Value<bool> isAiGenerated,
      Value<int> rowid,
    });

class $$WeeklyReportsTableFilterComposer
    extends Composer<_$AppDatabase, $WeeklyReportsTable> {
  $$WeeklyReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get highlightsJson => $composableBuilder(
    column: $table.highlightsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get concernsJson => $composableBuilder(
    column: $table.concernsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get progressAnalysis => $composableBuilder(
    column: $table.progressAnalysis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextWeekFocus => $composableBuilder(
    column: $table.nextWeekFocus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeeklyReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeeklyReportsTable> {
  $$WeeklyReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get highlightsJson => $composableBuilder(
    column: $table.highlightsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get concernsJson => $composableBuilder(
    column: $table.concernsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get progressAnalysis => $composableBuilder(
    column: $table.progressAnalysis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextWeekFocus => $composableBuilder(
    column: $table.nextWeekFocus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeeklyReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeeklyReportsTable> {
  $$WeeklyReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get highlightsJson => $composableBuilder(
    column: $table.highlightsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get concernsJson => $composableBuilder(
    column: $table.concernsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get progressAnalysis => $composableBuilder(
    column: $table.progressAnalysis,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextWeekFocus => $composableBuilder(
    column: $table.nextWeekFocus,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => column,
  );
}

class $$WeeklyReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeeklyReportsTable,
          WeeklyReport,
          $$WeeklyReportsTableFilterComposer,
          $$WeeklyReportsTableOrderingComposer,
          $$WeeklyReportsTableAnnotationComposer,
          $$WeeklyReportsTableCreateCompanionBuilder,
          $$WeeklyReportsTableUpdateCompanionBuilder,
          (
            WeeklyReport,
            BaseReferences<_$AppDatabase, $WeeklyReportsTable, WeeklyReport>,
          ),
          WeeklyReport,
          PrefetchHooks Function()
        > {
  $$WeeklyReportsTableTableManager(_$AppDatabase db, $WeeklyReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklyReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklyReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklyReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> weekStartDate = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<String> highlightsJson = const Value.absent(),
                Value<String> concernsJson = const Value.absent(),
                Value<String> progressAnalysis = const Value.absent(),
                Value<String> nextWeekFocus = const Value.absent(),
                Value<bool> isAiGenerated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeeklyReportsCompanion(
                id: id,
                weekStartDate: weekStartDate,
                generatedAt: generatedAt,
                summary: summary,
                highlightsJson: highlightsJson,
                concernsJson: concernsJson,
                progressAnalysis: progressAnalysis,
                nextWeekFocus: nextWeekFocus,
                isAiGenerated: isAiGenerated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime weekStartDate,
                required DateTime generatedAt,
                required String summary,
                required String highlightsJson,
                required String concernsJson,
                required String progressAnalysis,
                required String nextWeekFocus,
                Value<bool> isAiGenerated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeeklyReportsCompanion.insert(
                id: id,
                weekStartDate: weekStartDate,
                generatedAt: generatedAt,
                summary: summary,
                highlightsJson: highlightsJson,
                concernsJson: concernsJson,
                progressAnalysis: progressAnalysis,
                nextWeekFocus: nextWeekFocus,
                isAiGenerated: isAiGenerated,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeeklyReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeeklyReportsTable,
      WeeklyReport,
      $$WeeklyReportsTableFilterComposer,
      $$WeeklyReportsTableOrderingComposer,
      $$WeeklyReportsTableAnnotationComposer,
      $$WeeklyReportsTableCreateCompanionBuilder,
      $$WeeklyReportsTableUpdateCompanionBuilder,
      (
        WeeklyReport,
        BaseReferences<_$AppDatabase, $WeeklyReportsTable, WeeklyReport>,
      ),
      WeeklyReport,
      PrefetchHooks Function()
    >;
typedef $$ProgressPhotosTableCreateCompanionBuilder =
    ProgressPhotosCompanion Function({
      required String id,
      required String userId,
      required DateTime date,
      required String photoUri,
      required String bodyPart,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ProgressPhotosTableUpdateCompanionBuilder =
    ProgressPhotosCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> date,
      Value<String> photoUri,
      Value<String> bodyPart,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$ProgressPhotosTableReferences
    extends BaseReferences<_$AppDatabase, $ProgressPhotosTable, ProgressPhoto> {
  $$ProgressPhotosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserProfilesTable _userIdTable(_$AppDatabase db) =>
      db.userProfiles.createAlias(
        $_aliasNameGenerator(db.progressPhotos.userId, db.userProfiles.id),
      );

  $$UserProfilesTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserProfilesTableTableManager(
      $_db,
      $_db.userProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProgressPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $ProgressPhotosTable> {
  $$ProgressPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUri => $composableBuilder(
    column: $table.photoUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyPart => $composableBuilder(
    column: $table.bodyPart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$UserProfilesTableFilterComposer get userId {
    final $$UserProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableFilterComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgressPhotosTable> {
  $$ProgressPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUri => $composableBuilder(
    column: $table.photoUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyPart => $composableBuilder(
    column: $table.bodyPart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserProfilesTableOrderingComposer get userId {
    final $$UserProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgressPhotosTable> {
  $$ProgressPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get photoUri =>
      $composableBuilder(column: $table.photoUri, builder: (column) => column);

  GeneratedColumn<String> get bodyPart =>
      $composableBuilder(column: $table.bodyPart, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$UserProfilesTableAnnotationComposer get userId {
    final $$UserProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgressPhotosTable,
          ProgressPhoto,
          $$ProgressPhotosTableFilterComposer,
          $$ProgressPhotosTableOrderingComposer,
          $$ProgressPhotosTableAnnotationComposer,
          $$ProgressPhotosTableCreateCompanionBuilder,
          $$ProgressPhotosTableUpdateCompanionBuilder,
          (ProgressPhoto, $$ProgressPhotosTableReferences),
          ProgressPhoto,
          PrefetchHooks Function({bool userId})
        > {
  $$ProgressPhotosTableTableManager(
    _$AppDatabase db,
    $ProgressPhotosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgressPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgressPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgressPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> photoUri = const Value.absent(),
                Value<String> bodyPart = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressPhotosCompanion(
                id: id,
                userId: userId,
                date: date,
                photoUri: photoUri,
                bodyPart: bodyPart,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime date,
                required String photoUri,
                required String bodyPart,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressPhotosCompanion.insert(
                id: id,
                userId: userId,
                date: date,
                photoUri: photoUri,
                bodyPart: bodyPart,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgressPhotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ProgressPhotosTableReferences
                                    ._userIdTable(db),
                                referencedColumn:
                                    $$ProgressPhotosTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProgressPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgressPhotosTable,
      ProgressPhoto,
      $$ProgressPhotosTableFilterComposer,
      $$ProgressPhotosTableOrderingComposer,
      $$ProgressPhotosTableAnnotationComposer,
      $$ProgressPhotosTableCreateCompanionBuilder,
      $$ProgressPhotosTableUpdateCompanionBuilder,
      (ProgressPhoto, $$ProgressPhotosTableReferences),
      ProgressPhoto,
      PrefetchHooks Function({bool userId})
    >;
typedef $$AiFoodAnalysesTableCreateCompanionBuilder =
    AiFoodAnalysesCompanion Function({
      required String id,
      required String mealLogId,
      required String photoUri,
      required String rawResponse,
      required String parsedItemsJson,
      required int confidence,
      required int processingTime,
      Value<String> model,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AiFoodAnalysesTableUpdateCompanionBuilder =
    AiFoodAnalysesCompanion Function({
      Value<String> id,
      Value<String> mealLogId,
      Value<String> photoUri,
      Value<String> rawResponse,
      Value<String> parsedItemsJson,
      Value<int> confidence,
      Value<int> processingTime,
      Value<String> model,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AiFoodAnalysesTableReferences
    extends BaseReferences<_$AppDatabase, $AiFoodAnalysesTable, AiFoodAnalyse> {
  $$AiFoodAnalysesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MealLogsTable _mealLogIdTable(_$AppDatabase db) =>
      db.mealLogs.createAlias(
        $_aliasNameGenerator(db.aiFoodAnalyses.mealLogId, db.mealLogs.id),
      );

  $$MealLogsTableProcessedTableManager get mealLogId {
    final $_column = $_itemColumn<String>('meal_log_id')!;

    final manager = $$MealLogsTableTableManager(
      $_db,
      $_db.mealLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AiFoodAnalysesTableFilterComposer
    extends Composer<_$AppDatabase, $AiFoodAnalysesTable> {
  $$AiFoodAnalysesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUri => $composableBuilder(
    column: $table.photoUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawResponse => $composableBuilder(
    column: $table.rawResponse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsedItemsJson => $composableBuilder(
    column: $table.parsedItemsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get processingTime => $composableBuilder(
    column: $table.processingTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MealLogsTableFilterComposer get mealLogId {
    final $$MealLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealLogId,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableFilterComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AiFoodAnalysesTableOrderingComposer
    extends Composer<_$AppDatabase, $AiFoodAnalysesTable> {
  $$AiFoodAnalysesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUri => $composableBuilder(
    column: $table.photoUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawResponse => $composableBuilder(
    column: $table.rawResponse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsedItemsJson => $composableBuilder(
    column: $table.parsedItemsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get processingTime => $composableBuilder(
    column: $table.processingTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealLogsTableOrderingComposer get mealLogId {
    final $$MealLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealLogId,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableOrderingComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AiFoodAnalysesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiFoodAnalysesTable> {
  $$AiFoodAnalysesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoUri =>
      $composableBuilder(column: $table.photoUri, builder: (column) => column);

  GeneratedColumn<String> get rawResponse => $composableBuilder(
    column: $table.rawResponse,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parsedItemsJson => $composableBuilder(
    column: $table.parsedItemsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get processingTime => $composableBuilder(
    column: $table.processingTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MealLogsTableAnnotationComposer get mealLogId {
    final $$MealLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealLogId,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AiFoodAnalysesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiFoodAnalysesTable,
          AiFoodAnalyse,
          $$AiFoodAnalysesTableFilterComposer,
          $$AiFoodAnalysesTableOrderingComposer,
          $$AiFoodAnalysesTableAnnotationComposer,
          $$AiFoodAnalysesTableCreateCompanionBuilder,
          $$AiFoodAnalysesTableUpdateCompanionBuilder,
          (AiFoodAnalyse, $$AiFoodAnalysesTableReferences),
          AiFoodAnalyse,
          PrefetchHooks Function({bool mealLogId})
        > {
  $$AiFoodAnalysesTableTableManager(
    _$AppDatabase db,
    $AiFoodAnalysesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiFoodAnalysesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiFoodAnalysesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiFoodAnalysesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mealLogId = const Value.absent(),
                Value<String> photoUri = const Value.absent(),
                Value<String> rawResponse = const Value.absent(),
                Value<String> parsedItemsJson = const Value.absent(),
                Value<int> confidence = const Value.absent(),
                Value<int> processingTime = const Value.absent(),
                Value<String> model = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AiFoodAnalysesCompanion(
                id: id,
                mealLogId: mealLogId,
                photoUri: photoUri,
                rawResponse: rawResponse,
                parsedItemsJson: parsedItemsJson,
                confidence: confidence,
                processingTime: processingTime,
                model: model,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mealLogId,
                required String photoUri,
                required String rawResponse,
                required String parsedItemsJson,
                required int confidence,
                required int processingTime,
                Value<String> model = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AiFoodAnalysesCompanion.insert(
                id: id,
                mealLogId: mealLogId,
                photoUri: photoUri,
                rawResponse: rawResponse,
                parsedItemsJson: parsedItemsJson,
                confidence: confidence,
                processingTime: processingTime,
                model: model,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AiFoodAnalysesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mealLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mealLogId,
                                referencedTable: $$AiFoodAnalysesTableReferences
                                    ._mealLogIdTable(db),
                                referencedColumn:
                                    $$AiFoodAnalysesTableReferences
                                        ._mealLogIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AiFoodAnalysesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiFoodAnalysesTable,
      AiFoodAnalyse,
      $$AiFoodAnalysesTableFilterComposer,
      $$AiFoodAnalysesTableOrderingComposer,
      $$AiFoodAnalysesTableAnnotationComposer,
      $$AiFoodAnalysesTableCreateCompanionBuilder,
      $$AiFoodAnalysesTableUpdateCompanionBuilder,
      (AiFoodAnalyse, $$AiFoodAnalysesTableReferences),
      AiFoodAnalyse,
      PrefetchHooks Function({bool mealLogId})
    >;
typedef $$PhotoComparisonsTableCreateCompanionBuilder =
    PhotoComparisonsCompanion Function({
      required String id,
      required String beforePhotoId,
      required String afterPhotoId,
      required String insights,
      required String detectedChangesJson,
      required DateTime generatedAt,
      Value<bool> isAiGenerated,
      Value<int> rowid,
    });
typedef $$PhotoComparisonsTableUpdateCompanionBuilder =
    PhotoComparisonsCompanion Function({
      Value<String> id,
      Value<String> beforePhotoId,
      Value<String> afterPhotoId,
      Value<String> insights,
      Value<String> detectedChangesJson,
      Value<DateTime> generatedAt,
      Value<bool> isAiGenerated,
      Value<int> rowid,
    });

final class $$PhotoComparisonsTableReferences
    extends
        BaseReferences<_$AppDatabase, $PhotoComparisonsTable, PhotoComparison> {
  $$PhotoComparisonsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProgressPhotosTable _beforePhotoIdTable(_$AppDatabase db) =>
      db.progressPhotos.createAlias(
        $_aliasNameGenerator(
          db.photoComparisons.beforePhotoId,
          db.progressPhotos.id,
        ),
      );

  $$ProgressPhotosTableProcessedTableManager get beforePhotoId {
    final $_column = $_itemColumn<String>('before_photo_id')!;

    final manager = $$ProgressPhotosTableTableManager(
      $_db,
      $_db.progressPhotos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_beforePhotoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProgressPhotosTable _afterPhotoIdTable(_$AppDatabase db) =>
      db.progressPhotos.createAlias(
        $_aliasNameGenerator(
          db.photoComparisons.afterPhotoId,
          db.progressPhotos.id,
        ),
      );

  $$ProgressPhotosTableProcessedTableManager get afterPhotoId {
    final $_column = $_itemColumn<String>('after_photo_id')!;

    final manager = $$ProgressPhotosTableTableManager(
      $_db,
      $_db.progressPhotos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_afterPhotoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PhotoComparisonsTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoComparisonsTable> {
  $$PhotoComparisonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insights => $composableBuilder(
    column: $table.insights,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detectedChangesJson => $composableBuilder(
    column: $table.detectedChangesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => ColumnFilters(column),
  );

  $$ProgressPhotosTableFilterComposer get beforePhotoId {
    final $$ProgressPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beforePhotoId,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableFilterComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProgressPhotosTableFilterComposer get afterPhotoId {
    final $$ProgressPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afterPhotoId,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableFilterComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotoComparisonsTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoComparisonsTable> {
  $$PhotoComparisonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insights => $composableBuilder(
    column: $table.insights,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detectedChangesJson => $composableBuilder(
    column: $table.detectedChangesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProgressPhotosTableOrderingComposer get beforePhotoId {
    final $$ProgressPhotosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beforePhotoId,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableOrderingComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProgressPhotosTableOrderingComposer get afterPhotoId {
    final $$ProgressPhotosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afterPhotoId,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableOrderingComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotoComparisonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoComparisonsTable> {
  $$PhotoComparisonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get insights =>
      $composableBuilder(column: $table.insights, builder: (column) => column);

  GeneratedColumn<String> get detectedChangesJson => $composableBuilder(
    column: $table.detectedChangesJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAiGenerated => $composableBuilder(
    column: $table.isAiGenerated,
    builder: (column) => column,
  );

  $$ProgressPhotosTableAnnotationComposer get beforePhotoId {
    final $$ProgressPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beforePhotoId,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProgressPhotosTableAnnotationComposer get afterPhotoId {
    final $$ProgressPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afterPhotoId,
      referencedTable: $db.progressPhotos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.progressPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotoComparisonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotoComparisonsTable,
          PhotoComparison,
          $$PhotoComparisonsTableFilterComposer,
          $$PhotoComparisonsTableOrderingComposer,
          $$PhotoComparisonsTableAnnotationComposer,
          $$PhotoComparisonsTableCreateCompanionBuilder,
          $$PhotoComparisonsTableUpdateCompanionBuilder,
          (PhotoComparison, $$PhotoComparisonsTableReferences),
          PhotoComparison,
          PrefetchHooks Function({bool beforePhotoId, bool afterPhotoId})
        > {
  $$PhotoComparisonsTableTableManager(
    _$AppDatabase db,
    $PhotoComparisonsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotoComparisonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotoComparisonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotoComparisonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> beforePhotoId = const Value.absent(),
                Value<String> afterPhotoId = const Value.absent(),
                Value<String> insights = const Value.absent(),
                Value<String> detectedChangesJson = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
                Value<bool> isAiGenerated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoComparisonsCompanion(
                id: id,
                beforePhotoId: beforePhotoId,
                afterPhotoId: afterPhotoId,
                insights: insights,
                detectedChangesJson: detectedChangesJson,
                generatedAt: generatedAt,
                isAiGenerated: isAiGenerated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String beforePhotoId,
                required String afterPhotoId,
                required String insights,
                required String detectedChangesJson,
                required DateTime generatedAt,
                Value<bool> isAiGenerated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoComparisonsCompanion.insert(
                id: id,
                beforePhotoId: beforePhotoId,
                afterPhotoId: afterPhotoId,
                insights: insights,
                detectedChangesJson: detectedChangesJson,
                generatedAt: generatedAt,
                isAiGenerated: isAiGenerated,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PhotoComparisonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({beforePhotoId = false, afterPhotoId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (beforePhotoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.beforePhotoId,
                                    referencedTable:
                                        $$PhotoComparisonsTableReferences
                                            ._beforePhotoIdTable(db),
                                    referencedColumn:
                                        $$PhotoComparisonsTableReferences
                                            ._beforePhotoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (afterPhotoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.afterPhotoId,
                                    referencedTable:
                                        $$PhotoComparisonsTableReferences
                                            ._afterPhotoIdTable(db),
                                    referencedColumn:
                                        $$PhotoComparisonsTableReferences
                                            ._afterPhotoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$PhotoComparisonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotoComparisonsTable,
      PhotoComparison,
      $$PhotoComparisonsTableFilterComposer,
      $$PhotoComparisonsTableOrderingComposer,
      $$PhotoComparisonsTableAnnotationComposer,
      $$PhotoComparisonsTableCreateCompanionBuilder,
      $$PhotoComparisonsTableUpdateCompanionBuilder,
      (PhotoComparison, $$PhotoComparisonsTableReferences),
      PhotoComparison,
      PrefetchHooks Function({bool beforePhotoId, bool afterPhotoId})
    >;
typedef $$MealTemplatesTableCreateCompanionBuilder =
    MealTemplatesCompanion Function({
      required String id,
      required String userId,
      required String name,
      required String itemsJson,
      Value<int> usageCount,
      required DateTime createdAt,
      Value<DateTime?> lastUsedAt,
      Value<int> rowid,
    });
typedef $$MealTemplatesTableUpdateCompanionBuilder =
    MealTemplatesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> name,
      Value<String> itemsJson,
      Value<int> usageCount,
      Value<DateTime> createdAt,
      Value<DateTime?> lastUsedAt,
      Value<int> rowid,
    });

final class $$MealTemplatesTableReferences
    extends BaseReferences<_$AppDatabase, $MealTemplatesTable, MealTemplate> {
  $$MealTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserProfilesTable _userIdTable(_$AppDatabase db) =>
      db.userProfiles.createAlias(
        $_aliasNameGenerator(db.mealTemplates.userId, db.userProfiles.id),
      );

  $$UserProfilesTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserProfilesTableTableManager(
      $_db,
      $_db.userProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $MealTemplatesTable> {
  $$MealTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemsJson => $composableBuilder(
    column: $table.itemsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UserProfilesTableFilterComposer get userId {
    final $$UserProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableFilterComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $MealTemplatesTable> {
  $$MealTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemsJson => $composableBuilder(
    column: $table.itemsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserProfilesTableOrderingComposer get userId {
    final $$UserProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealTemplatesTable> {
  $$MealTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get itemsJson =>
      $composableBuilder(column: $table.itemsJson, builder: (column) => column);

  GeneratedColumn<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => column,
  );

  $$UserProfilesTableAnnotationComposer get userId {
    final $$UserProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealTemplatesTable,
          MealTemplate,
          $$MealTemplatesTableFilterComposer,
          $$MealTemplatesTableOrderingComposer,
          $$MealTemplatesTableAnnotationComposer,
          $$MealTemplatesTableCreateCompanionBuilder,
          $$MealTemplatesTableUpdateCompanionBuilder,
          (MealTemplate, $$MealTemplatesTableReferences),
          MealTemplate,
          PrefetchHooks Function({bool userId})
        > {
  $$MealTemplatesTableTableManager(_$AppDatabase db, $MealTemplatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> itemsJson = const Value.absent(),
                Value<int> usageCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUsedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealTemplatesCompanion(
                id: id,
                userId: userId,
                name: name,
                itemsJson: itemsJson,
                usageCount: usageCount,
                createdAt: createdAt,
                lastUsedAt: lastUsedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String name,
                required String itemsJson,
                Value<int> usageCount = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> lastUsedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealTemplatesCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                itemsJson: itemsJson,
                usageCount: usageCount,
                createdAt: createdAt,
                lastUsedAt: lastUsedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$MealTemplatesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$MealTemplatesTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MealTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealTemplatesTable,
      MealTemplate,
      $$MealTemplatesTableFilterComposer,
      $$MealTemplatesTableOrderingComposer,
      $$MealTemplatesTableAnnotationComposer,
      $$MealTemplatesTableCreateCompanionBuilder,
      $$MealTemplatesTableUpdateCompanionBuilder,
      (MealTemplate, $$MealTemplatesTableReferences),
      MealTemplate,
      PrefetchHooks Function({bool userId})
    >;
typedef $$JournalEntriesTableCreateCompanionBuilder =
    JournalEntriesCompanion Function({
      required String id,
      required DateTime date,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String behaviorsJson,
      Value<String?> notes,
      Value<int?> moodLevel,
      Value<int?> stressLevel,
      Value<bool> isReviewed,
      required String tagsJson,
      Value<int> rowid,
    });
typedef $$JournalEntriesTableUpdateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> behaviorsJson,
      Value<String?> notes,
      Value<int?> moodLevel,
      Value<int?> stressLevel,
      Value<bool> isReviewed,
      Value<String> tagsJson,
      Value<int> rowid,
    });

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get behaviorsJson => $composableBuilder(
    column: $table.behaviorsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moodLevel => $composableBuilder(
    column: $table.moodLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isReviewed => $composableBuilder(
    column: $table.isReviewed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get behaviorsJson => $composableBuilder(
    column: $table.behaviorsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moodLevel => $composableBuilder(
    column: $table.moodLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isReviewed => $composableBuilder(
    column: $table.isReviewed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get behaviorsJson => $composableBuilder(
    column: $table.behaviorsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get moodLevel =>
      $composableBuilder(column: $table.moodLevel, builder: (column) => column);

  GeneratedColumn<int> get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isReviewed => $composableBuilder(
    column: $table.isReviewed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);
}

class $$JournalEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalEntriesTable,
          JournalEntry,
          $$JournalEntriesTableFilterComposer,
          $$JournalEntriesTableOrderingComposer,
          $$JournalEntriesTableAnnotationComposer,
          $$JournalEntriesTableCreateCompanionBuilder,
          $$JournalEntriesTableUpdateCompanionBuilder,
          (
            JournalEntry,
            BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>,
          ),
          JournalEntry,
          PrefetchHooks Function()
        > {
  $$JournalEntriesTableTableManager(
    _$AppDatabase db,
    $JournalEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> behaviorsJson = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> moodLevel = const Value.absent(),
                Value<int?> stressLevel = const Value.absent(),
                Value<bool> isReviewed = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalEntriesCompanion(
                id: id,
                date: date,
                createdAt: createdAt,
                updatedAt: updatedAt,
                behaviorsJson: behaviorsJson,
                notes: notes,
                moodLevel: moodLevel,
                stressLevel: stressLevel,
                isReviewed: isReviewed,
                tagsJson: tagsJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                required DateTime createdAt,
                required DateTime updatedAt,
                required String behaviorsJson,
                Value<String?> notes = const Value.absent(),
                Value<int?> moodLevel = const Value.absent(),
                Value<int?> stressLevel = const Value.absent(),
                Value<bool> isReviewed = const Value.absent(),
                required String tagsJson,
                Value<int> rowid = const Value.absent(),
              }) => JournalEntriesCompanion.insert(
                id: id,
                date: date,
                createdAt: createdAt,
                updatedAt: updatedAt,
                behaviorsJson: behaviorsJson,
                notes: notes,
                moodLevel: moodLevel,
                stressLevel: stressLevel,
                isReviewed: isReviewed,
                tagsJson: tagsJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JournalEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalEntriesTable,
      JournalEntry,
      $$JournalEntriesTableFilterComposer,
      $$JournalEntriesTableOrderingComposer,
      $$JournalEntriesTableAnnotationComposer,
      $$JournalEntriesTableCreateCompanionBuilder,
      $$JournalEntriesTableUpdateCompanionBuilder,
      (
        JournalEntry,
        BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>,
      ),
      JournalEntry,
      PrefetchHooks Function()
    >;
typedef $$CustomBehaviorsTableCreateCompanionBuilder =
    CustomBehaviorsCompanion Function({
      required String id,
      required String name,
      required String category,
      required String inputType,
      Value<String?> icon,
      Value<String?> unit,
      Value<String?> description,
      Value<bool> isActive,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$CustomBehaviorsTableUpdateCompanionBuilder =
    CustomBehaviorsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<String> inputType,
      Value<String?> icon,
      Value<String?> unit,
      Value<String?> description,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$CustomBehaviorsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomBehaviorsTable> {
  $$CustomBehaviorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inputType => $composableBuilder(
    column: $table.inputType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomBehaviorsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomBehaviorsTable> {
  $$CustomBehaviorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inputType => $composableBuilder(
    column: $table.inputType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomBehaviorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomBehaviorsTable> {
  $$CustomBehaviorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get inputType =>
      $composableBuilder(column: $table.inputType, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CustomBehaviorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomBehaviorsTable,
          CustomBehavior,
          $$CustomBehaviorsTableFilterComposer,
          $$CustomBehaviorsTableOrderingComposer,
          $$CustomBehaviorsTableAnnotationComposer,
          $$CustomBehaviorsTableCreateCompanionBuilder,
          $$CustomBehaviorsTableUpdateCompanionBuilder,
          (
            CustomBehavior,
            BaseReferences<
              _$AppDatabase,
              $CustomBehaviorsTable,
              CustomBehavior
            >,
          ),
          CustomBehavior,
          PrefetchHooks Function()
        > {
  $$CustomBehaviorsTableTableManager(
    _$AppDatabase db,
    $CustomBehaviorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomBehaviorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomBehaviorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomBehaviorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> inputType = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomBehaviorsCompanion(
                id: id,
                name: name,
                category: category,
                inputType: inputType,
                icon: icon,
                unit: unit,
                description: description,
                isActive: isActive,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                required String inputType,
                Value<String?> icon = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CustomBehaviorsCompanion.insert(
                id: id,
                name: name,
                category: category,
                inputType: inputType,
                icon: icon,
                unit: unit,
                description: description,
                isActive: isActive,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomBehaviorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomBehaviorsTable,
      CustomBehavior,
      $$CustomBehaviorsTableFilterComposer,
      $$CustomBehaviorsTableOrderingComposer,
      $$CustomBehaviorsTableAnnotationComposer,
      $$CustomBehaviorsTableCreateCompanionBuilder,
      $$CustomBehaviorsTableUpdateCompanionBuilder,
      (
        CustomBehavior,
        BaseReferences<_$AppDatabase, $CustomBehaviorsTable, CustomBehavior>,
      ),
      CustomBehavior,
      PrefetchHooks Function()
    >;
typedef $$StrainScoresTableCreateCompanionBuilder =
    StrainScoresCompanion Function({
      required String id,
      required DateTime date,
      required DateTime calculatedAt,
      required double score,
      required int maxHeartRate,
      required String zoneDataJson,
      required int totalActiveMinutes,
      Value<int?> peakHeartRate,
      Value<int?> averageHeartRate,
      Value<int> workoutCount,
      Value<int?> caloriesBurned,
      required String dataSource,
      Value<int> rowid,
    });
typedef $$StrainScoresTableUpdateCompanionBuilder =
    StrainScoresCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<DateTime> calculatedAt,
      Value<double> score,
      Value<int> maxHeartRate,
      Value<String> zoneDataJson,
      Value<int> totalActiveMinutes,
      Value<int?> peakHeartRate,
      Value<int?> averageHeartRate,
      Value<int> workoutCount,
      Value<int?> caloriesBurned,
      Value<String> dataSource,
      Value<int> rowid,
    });

class $$StrainScoresTableFilterComposer
    extends Composer<_$AppDatabase, $StrainScoresTable> {
  $$StrainScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get calculatedAt => $composableBuilder(
    column: $table.calculatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHeartRate => $composableBuilder(
    column: $table.maxHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zoneDataJson => $composableBuilder(
    column: $table.zoneDataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalActiveMinutes => $composableBuilder(
    column: $table.totalActiveMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get peakHeartRate => $composableBuilder(
    column: $table.peakHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get averageHeartRate => $composableBuilder(
    column: $table.averageHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get workoutCount => $composableBuilder(
    column: $table.workoutCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StrainScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $StrainScoresTable> {
  $$StrainScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get calculatedAt => $composableBuilder(
    column: $table.calculatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHeartRate => $composableBuilder(
    column: $table.maxHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zoneDataJson => $composableBuilder(
    column: $table.zoneDataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalActiveMinutes => $composableBuilder(
    column: $table.totalActiveMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get peakHeartRate => $composableBuilder(
    column: $table.peakHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get averageHeartRate => $composableBuilder(
    column: $table.averageHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get workoutCount => $composableBuilder(
    column: $table.workoutCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StrainScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $StrainScoresTable> {
  $$StrainScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get calculatedAt => $composableBuilder(
    column: $table.calculatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get maxHeartRate => $composableBuilder(
    column: $table.maxHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get zoneDataJson => $composableBuilder(
    column: $table.zoneDataJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalActiveMinutes => $composableBuilder(
    column: $table.totalActiveMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get peakHeartRate => $composableBuilder(
    column: $table.peakHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get averageHeartRate => $composableBuilder(
    column: $table.averageHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get workoutCount => $composableBuilder(
    column: $table.workoutCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => column,
  );
}

class $$StrainScoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StrainScoresTable,
          StrainScore,
          $$StrainScoresTableFilterComposer,
          $$StrainScoresTableOrderingComposer,
          $$StrainScoresTableAnnotationComposer,
          $$StrainScoresTableCreateCompanionBuilder,
          $$StrainScoresTableUpdateCompanionBuilder,
          (
            StrainScore,
            BaseReferences<_$AppDatabase, $StrainScoresTable, StrainScore>,
          ),
          StrainScore,
          PrefetchHooks Function()
        > {
  $$StrainScoresTableTableManager(_$AppDatabase db, $StrainScoresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StrainScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StrainScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StrainScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> calculatedAt = const Value.absent(),
                Value<double> score = const Value.absent(),
                Value<int> maxHeartRate = const Value.absent(),
                Value<String> zoneDataJson = const Value.absent(),
                Value<int> totalActiveMinutes = const Value.absent(),
                Value<int?> peakHeartRate = const Value.absent(),
                Value<int?> averageHeartRate = const Value.absent(),
                Value<int> workoutCount = const Value.absent(),
                Value<int?> caloriesBurned = const Value.absent(),
                Value<String> dataSource = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrainScoresCompanion(
                id: id,
                date: date,
                calculatedAt: calculatedAt,
                score: score,
                maxHeartRate: maxHeartRate,
                zoneDataJson: zoneDataJson,
                totalActiveMinutes: totalActiveMinutes,
                peakHeartRate: peakHeartRate,
                averageHeartRate: averageHeartRate,
                workoutCount: workoutCount,
                caloriesBurned: caloriesBurned,
                dataSource: dataSource,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                required DateTime calculatedAt,
                required double score,
                required int maxHeartRate,
                required String zoneDataJson,
                required int totalActiveMinutes,
                Value<int?> peakHeartRate = const Value.absent(),
                Value<int?> averageHeartRate = const Value.absent(),
                Value<int> workoutCount = const Value.absent(),
                Value<int?> caloriesBurned = const Value.absent(),
                required String dataSource,
                Value<int> rowid = const Value.absent(),
              }) => StrainScoresCompanion.insert(
                id: id,
                date: date,
                calculatedAt: calculatedAt,
                score: score,
                maxHeartRate: maxHeartRate,
                zoneDataJson: zoneDataJson,
                totalActiveMinutes: totalActiveMinutes,
                peakHeartRate: peakHeartRate,
                averageHeartRate: averageHeartRate,
                workoutCount: workoutCount,
                caloriesBurned: caloriesBurned,
                dataSource: dataSource,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StrainScoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StrainScoresTable,
      StrainScore,
      $$StrainScoresTableFilterComposer,
      $$StrainScoresTableOrderingComposer,
      $$StrainScoresTableAnnotationComposer,
      $$StrainScoresTableCreateCompanionBuilder,
      $$StrainScoresTableUpdateCompanionBuilder,
      (
        StrainScore,
        BaseReferences<_$AppDatabase, $StrainScoresTable, StrainScore>,
      ),
      StrainScore,
      PrefetchHooks Function()
    >;
typedef $$RecoveryScoresTableCreateCompanionBuilder =
    RecoveryScoresCompanion Function({
      required String id,
      required DateTime date,
      required DateTime calculatedAt,
      required int score,
      required String componentsJson,
      required String baselineJson,
      required String deviationsJson,
      Value<String?> sleepPerformanceJson,
      required String state,
      required String dataSource,
      Value<int> rowid,
    });
typedef $$RecoveryScoresTableUpdateCompanionBuilder =
    RecoveryScoresCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<DateTime> calculatedAt,
      Value<int> score,
      Value<String> componentsJson,
      Value<String> baselineJson,
      Value<String> deviationsJson,
      Value<String?> sleepPerformanceJson,
      Value<String> state,
      Value<String> dataSource,
      Value<int> rowid,
    });

class $$RecoveryScoresTableFilterComposer
    extends Composer<_$AppDatabase, $RecoveryScoresTable> {
  $$RecoveryScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get calculatedAt => $composableBuilder(
    column: $table.calculatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get componentsJson => $composableBuilder(
    column: $table.componentsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baselineJson => $composableBuilder(
    column: $table.baselineJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviationsJson => $composableBuilder(
    column: $table.deviationsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sleepPerformanceJson => $composableBuilder(
    column: $table.sleepPerformanceJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecoveryScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $RecoveryScoresTable> {
  $$RecoveryScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get calculatedAt => $composableBuilder(
    column: $table.calculatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get componentsJson => $composableBuilder(
    column: $table.componentsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baselineJson => $composableBuilder(
    column: $table.baselineJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviationsJson => $composableBuilder(
    column: $table.deviationsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sleepPerformanceJson => $composableBuilder(
    column: $table.sleepPerformanceJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecoveryScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecoveryScoresTable> {
  $$RecoveryScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get calculatedAt => $composableBuilder(
    column: $table.calculatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get componentsJson => $composableBuilder(
    column: $table.componentsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get baselineJson => $composableBuilder(
    column: $table.baselineJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviationsJson => $composableBuilder(
    column: $table.deviationsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sleepPerformanceJson => $composableBuilder(
    column: $table.sleepPerformanceJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => column,
  );
}

class $$RecoveryScoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecoveryScoresTable,
          RecoveryScore,
          $$RecoveryScoresTableFilterComposer,
          $$RecoveryScoresTableOrderingComposer,
          $$RecoveryScoresTableAnnotationComposer,
          $$RecoveryScoresTableCreateCompanionBuilder,
          $$RecoveryScoresTableUpdateCompanionBuilder,
          (
            RecoveryScore,
            BaseReferences<_$AppDatabase, $RecoveryScoresTable, RecoveryScore>,
          ),
          RecoveryScore,
          PrefetchHooks Function()
        > {
  $$RecoveryScoresTableTableManager(
    _$AppDatabase db,
    $RecoveryScoresTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecoveryScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecoveryScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecoveryScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> calculatedAt = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<String> componentsJson = const Value.absent(),
                Value<String> baselineJson = const Value.absent(),
                Value<String> deviationsJson = const Value.absent(),
                Value<String?> sleepPerformanceJson = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<String> dataSource = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecoveryScoresCompanion(
                id: id,
                date: date,
                calculatedAt: calculatedAt,
                score: score,
                componentsJson: componentsJson,
                baselineJson: baselineJson,
                deviationsJson: deviationsJson,
                sleepPerformanceJson: sleepPerformanceJson,
                state: state,
                dataSource: dataSource,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                required DateTime calculatedAt,
                required int score,
                required String componentsJson,
                required String baselineJson,
                required String deviationsJson,
                Value<String?> sleepPerformanceJson = const Value.absent(),
                required String state,
                required String dataSource,
                Value<int> rowid = const Value.absent(),
              }) => RecoveryScoresCompanion.insert(
                id: id,
                date: date,
                calculatedAt: calculatedAt,
                score: score,
                componentsJson: componentsJson,
                baselineJson: baselineJson,
                deviationsJson: deviationsJson,
                sleepPerformanceJson: sleepPerformanceJson,
                state: state,
                dataSource: dataSource,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecoveryScoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecoveryScoresTable,
      RecoveryScore,
      $$RecoveryScoresTableFilterComposer,
      $$RecoveryScoresTableOrderingComposer,
      $$RecoveryScoresTableAnnotationComposer,
      $$RecoveryScoresTableCreateCompanionBuilder,
      $$RecoveryScoresTableUpdateCompanionBuilder,
      (
        RecoveryScore,
        BaseReferences<_$AppDatabase, $RecoveryScoresTable, RecoveryScore>,
      ),
      RecoveryScore,
      PrefetchHooks Function()
    >;
typedef $$MedicationsTableCreateCompanionBuilder =
    MedicationsCompanion Function({
      required String id,
      required String protocolId,
      required String name,
      required String dosage,
      required String frequency,
      required String timesJson,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<String?> notes,
      Value<bool> remindersEnabled,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MedicationsTableUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<String> id,
      Value<String> protocolId,
      Value<String> name,
      Value<String> dosage,
      Value<String> frequency,
      Value<String> timesJson,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<String?> notes,
      Value<bool> remindersEnabled,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias(
        $_aliasNameGenerator(db.medications.protocolId, db.protocols.id),
      );

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<String>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timesJson => $composableBuilder(
    column: $table.timesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timesJson => $composableBuilder(
    column: $table.timesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get timesJson =>
      $composableBuilder(column: $table.timesJson, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationsTable,
          Medication,
          $$MedicationsTableFilterComposer,
          $$MedicationsTableOrderingComposer,
          $$MedicationsTableAnnotationComposer,
          $$MedicationsTableCreateCompanionBuilder,
          $$MedicationsTableUpdateCompanionBuilder,
          (Medication, $$MedicationsTableReferences),
          Medication,
          PrefetchHooks Function({bool protocolId})
        > {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> protocolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> dosage = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String> timesJson = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                protocolId: protocolId,
                name: name,
                dosage: dosage,
                frequency: frequency,
                timesJson: timesJson,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                remindersEnabled: remindersEnabled,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String protocolId,
                required String name,
                required String dosage,
                required String frequency,
                required String timesJson,
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                protocolId: protocolId,
                name: name,
                dosage: dosage,
                frequency: frequency,
                timesJson: timesJson,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                remindersEnabled: remindersEnabled,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protocolId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protocolId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.protocolId,
                                referencedTable: $$MedicationsTableReferences
                                    ._protocolIdTable(db),
                                referencedColumn: $$MedicationsTableReferences
                                    ._protocolIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationsTable,
      Medication,
      $$MedicationsTableFilterComposer,
      $$MedicationsTableOrderingComposer,
      $$MedicationsTableAnnotationComposer,
      $$MedicationsTableCreateCompanionBuilder,
      $$MedicationsTableUpdateCompanionBuilder,
      (Medication, $$MedicationsTableReferences),
      Medication,
      PrefetchHooks Function({bool protocolId})
    >;
typedef $$SupplementsTableCreateCompanionBuilder =
    SupplementsCompanion Function({
      required String id,
      required String protocolId,
      required String name,
      required String dosage,
      required String frequency,
      required String timesJson,
      Value<bool> withMeals,
      Value<String?> notes,
      Value<bool> remindersEnabled,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SupplementsTableUpdateCompanionBuilder =
    SupplementsCompanion Function({
      Value<String> id,
      Value<String> protocolId,
      Value<String> name,
      Value<String> dosage,
      Value<String> frequency,
      Value<String> timesJson,
      Value<bool> withMeals,
      Value<String?> notes,
      Value<bool> remindersEnabled,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SupplementsTableReferences
    extends BaseReferences<_$AppDatabase, $SupplementsTable, Supplement> {
  $$SupplementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias(
        $_aliasNameGenerator(db.supplements.protocolId, db.protocols.id),
      );

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<String>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SupplementsTableFilterComposer
    extends Composer<_$AppDatabase, $SupplementsTable> {
  $$SupplementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timesJson => $composableBuilder(
    column: $table.timesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get withMeals => $composableBuilder(
    column: $table.withMeals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementsTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplementsTable> {
  $$SupplementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timesJson => $composableBuilder(
    column: $table.timesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get withMeals => $composableBuilder(
    column: $table.withMeals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplementsTable> {
  $$SupplementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get timesJson =>
      $composableBuilder(column: $table.timesJson, builder: (column) => column);

  GeneratedColumn<bool> get withMeals =>
      $composableBuilder(column: $table.withMeals, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplementsTable,
          Supplement,
          $$SupplementsTableFilterComposer,
          $$SupplementsTableOrderingComposer,
          $$SupplementsTableAnnotationComposer,
          $$SupplementsTableCreateCompanionBuilder,
          $$SupplementsTableUpdateCompanionBuilder,
          (Supplement, $$SupplementsTableReferences),
          Supplement,
          PrefetchHooks Function({bool protocolId})
        > {
  $$SupplementsTableTableManager(_$AppDatabase db, $SupplementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> protocolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> dosage = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String> timesJson = const Value.absent(),
                Value<bool> withMeals = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SupplementsCompanion(
                id: id,
                protocolId: protocolId,
                name: name,
                dosage: dosage,
                frequency: frequency,
                timesJson: timesJson,
                withMeals: withMeals,
                notes: notes,
                remindersEnabled: remindersEnabled,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String protocolId,
                required String name,
                required String dosage,
                required String frequency,
                required String timesJson,
                Value<bool> withMeals = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SupplementsCompanion.insert(
                id: id,
                protocolId: protocolId,
                name: name,
                dosage: dosage,
                frequency: frequency,
                timesJson: timesJson,
                withMeals: withMeals,
                notes: notes,
                remindersEnabled: remindersEnabled,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protocolId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protocolId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.protocolId,
                                referencedTable: $$SupplementsTableReferences
                                    ._protocolIdTable(db),
                                referencedColumn: $$SupplementsTableReferences
                                    ._protocolIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SupplementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplementsTable,
      Supplement,
      $$SupplementsTableFilterComposer,
      $$SupplementsTableOrderingComposer,
      $$SupplementsTableAnnotationComposer,
      $$SupplementsTableCreateCompanionBuilder,
      $$SupplementsTableUpdateCompanionBuilder,
      (Supplement, $$SupplementsTableReferences),
      Supplement,
      PrefetchHooks Function({bool protocolId})
    >;
typedef $$ScheduledWorkoutsTableCreateCompanionBuilder =
    ScheduledWorkoutsCompanion Function({
      required String id,
      required String protocolId,
      required String name,
      required String type,
      required int dayOfWeek,
      Value<int?> preferredTimeHour,
      Value<int?> preferredTimeMinute,
      Value<int?> duration,
      Value<double?> targetStrain,
      Value<String?> notes,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ScheduledWorkoutsTableUpdateCompanionBuilder =
    ScheduledWorkoutsCompanion Function({
      Value<String> id,
      Value<String> protocolId,
      Value<String> name,
      Value<String> type,
      Value<int> dayOfWeek,
      Value<int?> preferredTimeHour,
      Value<int?> preferredTimeMinute,
      Value<int?> duration,
      Value<double?> targetStrain,
      Value<String?> notes,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ScheduledWorkoutsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ScheduledWorkoutsTable,
          ScheduledWorkout
        > {
  $$ScheduledWorkoutsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias(
        $_aliasNameGenerator(db.scheduledWorkouts.protocolId, db.protocols.id),
      );

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<String>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduledWorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduledWorkoutsTable> {
  $$ScheduledWorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get preferredTimeHour => $composableBuilder(
    column: $table.preferredTimeHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get preferredTimeMinute => $composableBuilder(
    column: $table.preferredTimeMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetStrain => $composableBuilder(
    column: $table.targetStrain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduledWorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduledWorkoutsTable> {
  $$ScheduledWorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preferredTimeHour => $composableBuilder(
    column: $table.preferredTimeHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preferredTimeMinute => $composableBuilder(
    column: $table.preferredTimeMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetStrain => $composableBuilder(
    column: $table.targetStrain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduledWorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduledWorkoutsTable> {
  $$ScheduledWorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<int> get preferredTimeHour => $composableBuilder(
    column: $table.preferredTimeHour,
    builder: (column) => column,
  );

  GeneratedColumn<int> get preferredTimeMinute => $composableBuilder(
    column: $table.preferredTimeMinute,
    builder: (column) => column,
  );

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<double> get targetStrain => $composableBuilder(
    column: $table.targetStrain,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduledWorkoutsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduledWorkoutsTable,
          ScheduledWorkout,
          $$ScheduledWorkoutsTableFilterComposer,
          $$ScheduledWorkoutsTableOrderingComposer,
          $$ScheduledWorkoutsTableAnnotationComposer,
          $$ScheduledWorkoutsTableCreateCompanionBuilder,
          $$ScheduledWorkoutsTableUpdateCompanionBuilder,
          (ScheduledWorkout, $$ScheduledWorkoutsTableReferences),
          ScheduledWorkout,
          PrefetchHooks Function({bool protocolId})
        > {
  $$ScheduledWorkoutsTableTableManager(
    _$AppDatabase db,
    $ScheduledWorkoutsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduledWorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduledWorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduledWorkoutsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> protocolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<int?> preferredTimeHour = const Value.absent(),
                Value<int?> preferredTimeMinute = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<double?> targetStrain = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScheduledWorkoutsCompanion(
                id: id,
                protocolId: protocolId,
                name: name,
                type: type,
                dayOfWeek: dayOfWeek,
                preferredTimeHour: preferredTimeHour,
                preferredTimeMinute: preferredTimeMinute,
                duration: duration,
                targetStrain: targetStrain,
                notes: notes,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String protocolId,
                required String name,
                required String type,
                required int dayOfWeek,
                Value<int?> preferredTimeHour = const Value.absent(),
                Value<int?> preferredTimeMinute = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<double?> targetStrain = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ScheduledWorkoutsCompanion.insert(
                id: id,
                protocolId: protocolId,
                name: name,
                type: type,
                dayOfWeek: dayOfWeek,
                preferredTimeHour: preferredTimeHour,
                preferredTimeMinute: preferredTimeMinute,
                duration: duration,
                targetStrain: targetStrain,
                notes: notes,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScheduledWorkoutsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protocolId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protocolId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.protocolId,
                                referencedTable:
                                    $$ScheduledWorkoutsTableReferences
                                        ._protocolIdTable(db),
                                referencedColumn:
                                    $$ScheduledWorkoutsTableReferences
                                        ._protocolIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ScheduledWorkoutsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduledWorkoutsTable,
      ScheduledWorkout,
      $$ScheduledWorkoutsTableFilterComposer,
      $$ScheduledWorkoutsTableOrderingComposer,
      $$ScheduledWorkoutsTableAnnotationComposer,
      $$ScheduledWorkoutsTableCreateCompanionBuilder,
      $$ScheduledWorkoutsTableUpdateCompanionBuilder,
      (ScheduledWorkout, $$ScheduledWorkoutsTableReferences),
      ScheduledWorkout,
      PrefetchHooks Function({bool protocolId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$ProtocolsTableTableManager get protocols =>
      $$ProtocolsTableTableManager(_db, _db.protocols);
  $$ProtocolSnapshotsTableTableManager get protocolSnapshots =>
      $$ProtocolSnapshotsTableTableManager(_db, _db.protocolSnapshots);
  $$DailyLogsTableTableManager get dailyLogs =>
      $$DailyLogsTableTableManager(_db, _db.dailyLogs);
  $$MeasurementLogsTableTableManager get measurementLogs =>
      $$MeasurementLogsTableTableManager(_db, _db.measurementLogs);
  $$MealLogsTableTableManager get mealLogs =>
      $$MealLogsTableTableManager(_db, _db.mealLogs);
  $$MealItemsTableTableManager get mealItems =>
      $$MealItemsTableTableManager(_db, _db.mealItems);
  $$WorkoutLogsTableTableManager get workoutLogs =>
      $$WorkoutLogsTableTableManager(_db, _db.workoutLogs);
  $$RecoveryMetricsTableTableTableManager get recoveryMetricsTable =>
      $$RecoveryMetricsTableTableTableManager(_db, _db.recoveryMetricsTable);
  $$DailyBriefsTableTableManager get dailyBriefs =>
      $$DailyBriefsTableTableManager(_db, _db.dailyBriefs);
  $$WeeklyReportsTableTableManager get weeklyReports =>
      $$WeeklyReportsTableTableManager(_db, _db.weeklyReports);
  $$ProgressPhotosTableTableManager get progressPhotos =>
      $$ProgressPhotosTableTableManager(_db, _db.progressPhotos);
  $$AiFoodAnalysesTableTableManager get aiFoodAnalyses =>
      $$AiFoodAnalysesTableTableManager(_db, _db.aiFoodAnalyses);
  $$PhotoComparisonsTableTableManager get photoComparisons =>
      $$PhotoComparisonsTableTableManager(_db, _db.photoComparisons);
  $$MealTemplatesTableTableManager get mealTemplates =>
      $$MealTemplatesTableTableManager(_db, _db.mealTemplates);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$CustomBehaviorsTableTableManager get customBehaviors =>
      $$CustomBehaviorsTableTableManager(_db, _db.customBehaviors);
  $$StrainScoresTableTableManager get strainScores =>
      $$StrainScoresTableTableManager(_db, _db.strainScores);
  $$RecoveryScoresTableTableManager get recoveryScores =>
      $$RecoveryScoresTableTableManager(_db, _db.recoveryScores);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$SupplementsTableTableManager get supplements =>
      $$SupplementsTableTableManager(_db, _db.supplements);
  $$ScheduledWorkoutsTableTableManager get scheduledWorkouts =>
      $$ScheduledWorkoutsTableTableManager(_db, _db.scheduledWorkouts);
}
