import 'package:flutter/material.dart';

import 'design_system_colors.dart';

class DesignSystemTypography {
  DesignSystemTypography.withColor(DesignSystemColors customDesignSystemColors)
    : _customDesignSystemColors = customDesignSystemColors;

  final DesignSystemColors _customDesignSystemColors;

  // Material design typography:
  // https://m3.material.io/styles/typography/type-scale-tokens#0020d4d9-4f5b-4666-b3ce-c26db849bd73

  // Keep the general purpose styles declared as 'const'. If not possible then
  // declare them as late final properties.

  final displayRegL = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 38.0,
  );

  final displayRegM = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 34.0,
  );

  final displayRegS = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 30.0,
  );

  final headlineRegL = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 28.0,
  );

  final headlineRegM = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 24.0,
  );

  final headlineRegS = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 20.0,
  );

  final titleRegL = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
  );

  final titleMedL = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
  );

  final titleRegM = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  );

  final titleMedM = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  );

  final titleRegS = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  final titleMedS = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  final bodyRegL = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  final bodyRegM = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
  );

  final bodyRegS = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 10.0,
  );

  final labelMedL = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  final labelMedM = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
  );

  final labelMedS = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 11.0,
  );
}
