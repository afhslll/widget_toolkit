import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../lib_ui_components/buttons/button_style.dart';
import 'design_system/design_system_spacings.dart';
import 'design_system/widget_toolkit_design_system.dart';

part 'widget_toolkit_theme.tailor.dart';

@TailorMixinComponent()
class WidgetToolkitTheme extends ThemeExtension<WidgetToolkitTheme>
    with _$WidgetToolkitThemeTailorMixin {
  @override
  final DesignSystemSpacings spacings;
  @override
  final ToolkitButtonStyle buttonStyle;
  @override
  final Color loadingIndicatorColor;

  const WidgetToolkitTheme({
    required this.buttonStyle,
    required this.spacings,
    required this.loadingIndicatorColor,
  });

  WidgetToolkitTheme.light()
    : spacings = WidgetToolkitDesignSystem.light().spacings,
      buttonStyle = ToolkitButtonStyle(
        backgroundColor: WidgetToolkitDesignSystem.light().colors.primary,
        foregroundColor: WidgetToolkitDesignSystem.light().colors.onPrimary,
        disabledBackgroundColor:
            WidgetToolkitDesignSystem.light().colors.neutral80,
        disabledForegroundColor:
            WidgetToolkitDesignSystem.light().colors.neutral40,
        borderColor: WidgetToolkitDesignSystem.light().colors.primary,
        shadowColor: WidgetToolkitDesignSystem.light().colors.primary,
        borderRadius: 10.0,
        textStyle: WidgetToolkitDesignSystem.light().typography.titleMedM,
        elevation: 32.0,
        padding: EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.light().spacings.s,
        ),
        iconSize: WidgetToolkitDesignSystem.light().spacings.l,
      ),
      loadingIndicatorColor =
          WidgetToolkitDesignSystem.light().colors.onPrimary;

  WidgetToolkitTheme.dark()
    : spacings = WidgetToolkitDesignSystem.dark().spacings,
      buttonStyle = ToolkitButtonStyle(
        backgroundColor: WidgetToolkitDesignSystem.dark().colors.primary,
        foregroundColor: WidgetToolkitDesignSystem.dark().colors.onPrimary,
        disabledBackgroundColor:
            WidgetToolkitDesignSystem.dark().colors.neutral80,
        disabledForegroundColor: WidgetToolkitDesignSystem.dark().colors.white,
        borderColor: WidgetToolkitDesignSystem.dark().colors.primary,
        shadowColor: WidgetToolkitDesignSystem.dark().colors.primary,
        borderRadius: 10.0,
        textStyle: WidgetToolkitDesignSystem.dark().typography.titleMedM,
        elevation: 32.0,
        padding: EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.dark().spacings.s,
        ),
        iconSize: WidgetToolkitDesignSystem.dark().spacings.l,
      ),
      loadingIndicatorColor = WidgetToolkitDesignSystem.dark().colors.onPrimary;
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
