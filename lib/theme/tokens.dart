import 'package:flutter/material.dart';

/// Design tokens extracted from the reference app (§4).
/// Navy primary, white background, soft blue accent panels, butter/coral warmth.
class AppColors {
  AppColors._();

  /// Primary / headings / dark app-bar / primary buttons.
  static const Color navy = Color(0xFF30384D);
  static const Color navyDeep = Color(0xFF262C3D);

  /// Background.
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  /// Accent panels — onboarding question bubbles, info cards.
  static const Color softBlue = Color(0xFFE8EEFB);
  static const Color softBlueBorder = Color(0xFFD6E0F5);

  /// Warm decorative — hero blobs, sparkles, highlight badges.
  static const Color butter = Color(0xFFFCEFC7);
  static const Color coral = Color(0xFFF7B79B);

  /// Allergen badge — amber/orange pill with a dot.
  static const Color amber = Color(0xFFF5A623);
  static const Color amberSoft = Color(0xFFFDF0D9);

  /// Disabled button = light blue-grey pill.
  static const Color disabledPill = Color(0xFFDDE3EE);

  /// Text.
  static const Color textPrimary = navy;
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9AA1AE);

  /// Status colours.
  static const Color success = Color(0xFF3F9E6E);
  static const Color warning = amber;
  static const Color danger = Color(0xFFD2544B);

  /// Subtle dividers / card borders.
  static const Color hairline = Color(0xFFEDEFF3);
}

class AppRadius {
  AppRadius._();
  static const double card = 18;
  static const double pill = 999;
  static const double chip = 14;
  static const double media = 16;
}

class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
}

class AppShadows {
  AppShadows._();
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 16,
      offset: Offset(0, 6),
    ),
  ];
  static const List<BoxShadow> soft = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 10,
      offset: Offset(0, 3),
    ),
  ];
}
