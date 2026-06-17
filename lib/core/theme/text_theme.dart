import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppTextTheme {
  AppTextTheme._();

  // === DISPLAY ===
  static const TextStyle hero = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontHero,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle display = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontDisplay,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontXxl,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontXl,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontLg,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // === BODY ===
  static const TextStyle bodyLg = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontLg,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontMd,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontMd,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontSm,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // === LABEL ===
  static const TextStyle labelLg = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontLg,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle label = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontMd,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelSm = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontSm,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // === SPECIAL ===
  static const TextStyle chip = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontSm,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle liveText = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontLg,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.8,
  );

  static const TextStyle liveTextHighlight = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontLg,
    fontWeight: FontWeight.w500,
    color: AppColors.accent,
    height: 1.8,
  );

  static const TextStyle timestamp = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontXs,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    letterSpacing: 0.5,
  );

  static const TextStyle gradient = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppSizes.fontDisplay,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );
}
