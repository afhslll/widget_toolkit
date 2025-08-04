import 'package:flutter/material.dart';

@immutable
class DesignSystemColors {
  const DesignSystemColors.light()
    : brightness = Brightness.light,
      primary = const Color(0xFF6750A4),
      onPrimary = const Color(0xFFFFFFFF),
      primaryContainer = const Color(0xFFEADDFF),
      onPrimaryContainer = const Color(0xFF21005D),
      secondary = const Color(0xFF625B71),
      onSecondary = const Color(0xFFFFFFFF),
      secondaryContainer = const Color(0xFFE8DEF8),
      onSecondaryContainer = const Color(0xFF1D192B),
      tertiary = const Color(0xFF7D5260),
      onTertiary = const Color(0xFFFFFFFF),
      error = const Color(0xFFBA1A1A),
      onError = const Color(0xFFFFFFFF),
      surface = const Color(0xFFFEF7FF),
      onSurface = const Color(0xFF1C1B1F);

  const DesignSystemColors.dark()
    : brightness = Brightness.dark,
      primary = const Color(0xFFD0BCFF),
      onPrimary = const Color(0xFF381E72),
      primaryContainer = const Color(0xFF4F378B),
      onPrimaryContainer = const Color(0xFFEADDFF),
      secondary = const Color(0xFFCCC2DC),
      onSecondary = const Color(0xFF332D41),
      secondaryContainer = const Color(0xFF4A4458),
      onSecondaryContainer = const Color(0xFFE8DEF8),
      tertiary = const Color(0xFFEFB8C8),
      onTertiary = const Color(0xFF492532),
      error = const Color(0xFFFFB4AB),
      onError = const Color(0xFF690005),
      surface = const Color(0xFF141218),
      onSurface = const Color(0xFFE6E0E9);

  final Brightness brightness;

  /// region Essential (Material and component) colors

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color error;
  final Color onError;
  final Color surface;
  final Color onSurface;

  /// region General purpose colors

  final transparent = const Color(0x00000000);

  final black = Colors.black;

  final blueAccent = Colors.blueAccent;

  final neutral90 = const Color.fromARGB(255, 232, 232, 232);

  final neutral80 = const Color(0xffc9c6c5);

  final neutral40 = const Color(0xff605e5e);

  final blue = const Color(0xFF2196F3);

  final lightBlue = const Color(0xFF90CAF9);

  final white = const Color(0xFFFFFFFF);

  final mediumWhite = const Color(0xFFF6F6F6);

  final green = const Color(0xFF4CAF50);

  final lightGreen = const Color(0xFFA5D6A7);

  final red = const Color(0xffd40e14);

  final redDark = const Color(0xff990f13);

  final orange = const Color(0xffec6601);

  final mediumBlack = const Color(0xff393f40);

  /// endregion
}

class _HexColor extends Color {
  _HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var hex = hexColor.toUpperCase().replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return int.parse(hex, radix: 16);
  }
}
