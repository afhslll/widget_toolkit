import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'design_system/design_system_spacings.dart';
import 'design_system/design_system_colors.dart';
import 'design_system/design_system_typography.dart';
import 'design_system/widget_toolkit_design_system.dart';

part 'widget_toolkit_theme.tailor.dart';

@TailorMixinComponent()
class WidgetToolkitTheme extends ThemeExtension<WidgetToolkitTheme>
    with _$WidgetToolkitThemeTailorMixin {
  @override
  final DesignSystemSpacings spacings;
  @override
  final DesignSystemTypography typography;
  @override
  final DesignSystemColors colors;
  @override
  final Color loadingIndicatorColor;
  // Start region - button
  @override
  final Color buttonBackgroundColor;
  @override
  final Color buttonForegroundColor;
  @override
  final Color buttonDisabledBackgroundColor;
  @override
  final Color buttonDisabledForegroundColor;
  @override
  final Color buttonBorderColor;
  @override
  final Color buttonShadowColor;
  @override
  final double buttonBorderRadius;
  @override
  final TextStyle buttonTextStyle;
  @override
  final double buttonElevation;
  @override
  final EdgeInsetsGeometry buttonPadding;
  @override
  final double buttonIconSize;
  // End region - button
  // Start region - shimmer
  @override
  final Color shimmerBaseColor;
  @override
  final Color shimmerHighlightColor;
  // End region - shimmer
  // Start region - error card
  @override
  final Color errorCardBackgroundColor;
  @override
  final Color errorCardIconColor;
  @override
  final Color errorCardTextColor;
  // End region - error card
  // Start region - bottom sheet
  @override
  final Color bottomSheetBarrierColor;
  @override
  final Color bottomSheetBackgroundColor;
  @override
  final EdgeInsetsGeometry bottomSheetContentPadding;
  @override
  final Color bottomSheetLineColor;
  @override
  final EdgeInsetsGeometry bottomSheetHeaderPadding;
  @override
  final double bottomSheetBottomHeight;
  @override
  final double bottomSheetTopRadius;
  // End region - bottom sheet

  const WidgetToolkitTheme({
    required this.typography,
    required this.colors,
    required this.spacings,
    required this.buttonBackgroundColor,
    required this.buttonForegroundColor,
    required this.buttonDisabledBackgroundColor,
    required this.buttonDisabledForegroundColor,
    required this.buttonBorderColor,
    required this.buttonShadowColor,
    required this.buttonBorderRadius,
    required this.buttonTextStyle,
    required this.buttonElevation,
    required this.buttonPadding,
    required this.buttonIconSize,
    required this.loadingIndicatorColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.errorCardBackgroundColor,
    required this.errorCardIconColor,
    required this.errorCardTextColor,
    required this.bottomSheetBarrierColor,
    required this.bottomSheetBackgroundColor,
    required this.bottomSheetContentPadding,
    required this.bottomSheetLineColor,
    required this.bottomSheetHeaderPadding,
    required this.bottomSheetBottomHeight,
    required this.bottomSheetTopRadius,
  });

  WidgetToolkitTheme.light()
    : spacings = WidgetToolkitDesignSystem.light().spacings,
      typography = WidgetToolkitDesignSystem.light().typography,
      colors = WidgetToolkitDesignSystem.light().colors,
      buttonBackgroundColor = WidgetToolkitDesignSystem.light().colors.primary,
      buttonForegroundColor =
          WidgetToolkitDesignSystem.light().colors.onPrimary,
      buttonDisabledBackgroundColor =
          WidgetToolkitDesignSystem.light().colors.neutral80,
      buttonDisabledForegroundColor =
          WidgetToolkitDesignSystem.light().colors.neutral40,
      buttonBorderColor = WidgetToolkitDesignSystem.light().colors.primary,
      buttonShadowColor = WidgetToolkitDesignSystem.light().colors.primary,
      buttonBorderRadius = 10.0,
      buttonTextStyle = WidgetToolkitDesignSystem.light().typography.titleMedM,
      buttonElevation = 32.0,
      buttonPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.light().spacings.s,
      ),
      buttonIconSize = WidgetToolkitDesignSystem.light().spacings.l,
      loadingIndicatorColor =
          WidgetToolkitDesignSystem.light().colors.onPrimary,
      shimmerBaseColor =
          WidgetToolkitDesignSystem.light().colors.primaryContainer,
      shimmerHighlightColor = WidgetToolkitDesignSystem.light().colors.primary,
      errorCardBackgroundColor =
          WidgetToolkitDesignSystem.light().colors.surface,
      errorCardIconColor = WidgetToolkitDesignSystem.light().colors.error,
      errorCardTextColor = WidgetToolkitDesignSystem.light().colors.onSurface,
      bottomSheetBarrierColor =
          WidgetToolkitDesignSystem.light().colors.transparent,
      bottomSheetBackgroundColor =
          WidgetToolkitDesignSystem.light().colors.surface,
      bottomSheetContentPadding = EdgeInsets.all(
        WidgetToolkitDesignSystem.light().spacings.m,
      ),
      bottomSheetLineColor = WidgetToolkitDesignSystem.light().colors.neutral40,
      bottomSheetHeaderPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.light().spacings.s,
      ),
      bottomSheetBottomHeight = WidgetToolkitDesignSystem.light().spacings.m,
      bottomSheetTopRadius = WidgetToolkitDesignSystem.light().spacings.m;

  WidgetToolkitTheme.dark()
    : spacings = WidgetToolkitDesignSystem.dark().spacings,
      typography = WidgetToolkitDesignSystem.dark().typography,
      colors = WidgetToolkitDesignSystem.dark().colors,
      buttonBackgroundColor = WidgetToolkitDesignSystem.dark().colors.primary,
      buttonForegroundColor = WidgetToolkitDesignSystem.dark().colors.onPrimary,
      buttonDisabledBackgroundColor =
          WidgetToolkitDesignSystem.dark().colors.neutral80,
      buttonDisabledForegroundColor =
          WidgetToolkitDesignSystem.dark().colors.white,
      buttonBorderColor = WidgetToolkitDesignSystem.dark().colors.primary,
      buttonShadowColor = WidgetToolkitDesignSystem.dark().colors.primary,
      buttonBorderRadius = 10.0,
      buttonTextStyle = WidgetToolkitDesignSystem.dark().typography.titleMedM,
      buttonElevation = 32.0,
      buttonPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.dark().spacings.s,
      ),
      buttonIconSize = WidgetToolkitDesignSystem.dark().spacings.l,
      loadingIndicatorColor = WidgetToolkitDesignSystem.dark().colors.onPrimary,
      shimmerBaseColor =
          WidgetToolkitDesignSystem.dark().colors.primaryContainer,
      shimmerHighlightColor = WidgetToolkitDesignSystem.dark().colors.primary,
      errorCardBackgroundColor =
          WidgetToolkitDesignSystem.dark().colors.surface,
      errorCardIconColor = WidgetToolkitDesignSystem.dark().colors.error,
      errorCardTextColor = WidgetToolkitDesignSystem.dark().colors.onSurface,
      bottomSheetBarrierColor =
          WidgetToolkitDesignSystem.dark().colors.transparent,
      bottomSheetBackgroundColor =
          WidgetToolkitDesignSystem.dark().colors.surface,
      bottomSheetContentPadding = EdgeInsets.all(
        WidgetToolkitDesignSystem.dark().spacings.m,
      ),
      bottomSheetLineColor = WidgetToolkitDesignSystem.dark().colors.neutral40,
      bottomSheetHeaderPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.dark().spacings.s,
      ),
      bottomSheetBottomHeight = WidgetToolkitDesignSystem.dark().spacings.m,
      bottomSheetTopRadius = WidgetToolkitDesignSystem.dark().spacings.m;
}

extension ThemeContextExtension on BuildContext {
  /// Returns a reference to the [WidgetToolkitTheme] theme extension of the current [Theme]
  WidgetToolkitTheme get widgetToolkitTheme {
    final theme = Theme.of(this).extension<WidgetToolkitTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented WidgetToolkitTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
