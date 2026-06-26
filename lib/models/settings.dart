import 'package:flutter/material.dart';

/// App settings (§8). Notification time, default maintenance cadence, region.
class AppSettings {
  final TimeOfDay reminderTime;
  final int defaultMaintenanceInterval; // days; default 3 → ~2×/week
  final String region; // US / UK / EU / SG
  final String units; // metric / imperial
  final bool notificationsEnabled;
  final bool onboardingComplete;
  final bool disclaimerAccepted;

  const AppSettings({
    this.reminderTime = const TimeOfDay(hour: 9, minute: 0),
    this.defaultMaintenanceInterval = 3,
    this.region = 'UK',
    this.units = 'metric',
    this.notificationsEnabled = true,
    this.onboardingComplete = false,
    this.disclaimerAccepted = false,
  });

  AppSettings copyWith({
    TimeOfDay? reminderTime,
    int? defaultMaintenanceInterval,
    String? region,
    String? units,
    bool? notificationsEnabled,
    bool? onboardingComplete,
    bool? disclaimerAccepted,
  }) =>
      AppSettings(
        reminderTime: reminderTime ?? this.reminderTime,
        defaultMaintenanceInterval:
            defaultMaintenanceInterval ?? this.defaultMaintenanceInterval,
        region: region ?? this.region,
        units: units ?? this.units,
        notificationsEnabled:
            notificationsEnabled ?? this.notificationsEnabled,
        onboardingComplete: onboardingComplete ?? this.onboardingComplete,
        disclaimerAccepted: disclaimerAccepted ?? this.disclaimerAccepted,
      );

  Map<String, String> toMap() => {
        'reminderHour': '${reminderTime.hour}',
        'reminderMinute': '${reminderTime.minute}',
        'defaultMaintenanceInterval': '$defaultMaintenanceInterval',
        'region': region,
        'units': units,
        'notificationsEnabled': notificationsEnabled ? '1' : '0',
        'onboardingComplete': onboardingComplete ? '1' : '0',
        'disclaimerAccepted': disclaimerAccepted ? '1' : '0',
      };

  factory AppSettings.fromMap(Map<String, String> m) => AppSettings(
        reminderTime: TimeOfDay(
          hour: int.tryParse(m['reminderHour'] ?? '9') ?? 9,
          minute: int.tryParse(m['reminderMinute'] ?? '0') ?? 0,
        ),
        defaultMaintenanceInterval:
            int.tryParse(m['defaultMaintenanceInterval'] ?? '3') ?? 3,
        region: m['region'] ?? 'UK',
        units: m['units'] ?? 'metric',
        notificationsEnabled: (m['notificationsEnabled'] ?? '1') == '1',
        onboardingComplete: (m['onboardingComplete'] ?? '0') == '1',
        disclaimerAccepted: (m['disclaimerAccepted'] ?? '0') == '1',
      );
}
