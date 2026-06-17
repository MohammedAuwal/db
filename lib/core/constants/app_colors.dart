import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // === PRIMARY BRAND COLORS ===
  static const Color primary = Color(0xFF7C3AED);        // Purple
  static const Color primaryLight = Color(0xFF9D5FF5);
  static const Color primaryDark = Color(0xFF5B21B6);

  static const Color secondary = Color(0xFF3B82F6);      // Blue
  static const Color secondaryLight = Color(0xFF60A5FA);
  static const Color secondaryDark = Color(0xFF1D4ED8);

  static const Color accent = Color(0xFF22D3EE);         // Cyan

  // === BACKGROUND COLORS ===
  static const Color background = Color(0xFF0B0F1A);     // Main dark bg
  static const Color surface = Color(0xFF111827);        // Card bg
  static const Color surfaceLight = Color(0xFF1F2937);   // Elevated card
  static const Color surfaceHighlight = Color(0xFF374151);

  // === TEXT COLORS ===
  static const Color textPrimary = Color(0xFFF9FAFB);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color textAccent = Color(0xFF22D3EE);

  // === STATUS COLORS ===
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFF34D399);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // === PROCESSING STATUS ===
  static const Color uploading = Color(0xFF3B82F6);
  static const Color processing = Color(0xFF7C3AED);
  static const Color completed = Color(0xFF10B981);
  static const Color failed = Color(0xFFEF4444);

  // === GRADIENT COLORS ===
  static const List<Color> primaryGradient = [
    Color(0xFF7C3AED),
    Color(0xFF3B82F6),
  ];

  static const List<Color> backgroundGradient = [
    Color(0xFF0B0F1A),
    Color(0xFF111827),
  ];

  static const List<Color> uploadCardGradient = [
    Color(0xFF2D1B69),
    Color(0xFF1E3A5F),
  ];

  static const List<Color> glowGradient = [
    Color(0x667C3AED),
    Color(0x663B82F6),
  ];

  // === GLASS / OVERLAY ===
  static const Color glassWhite = Color(0x0FFFFFFF);
  static const Color glassBorder = Color(0x1AFFFFFF);
  static const Color overlayDark = Color(0x80000000);

  // === GLOW COLORS ===
  static const Color purpleGlow = Color(0x667C3AED);
  static const Color blueGlow = Color(0x663B82F6);
  static const Color cyanGlow = Color(0x6622D3EE);
}
