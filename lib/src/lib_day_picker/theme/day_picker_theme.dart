import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../theme_data.dart';

part 'day_picker_theme.tailor.dart';

@TailorMixinComponent()
class DayPickerTheme extends ThemeExtension<DayPickerTheme>
    with _$DayPickerThemeTailorMixin {
  const DayPickerTheme({
    required this.titleStyle,
    required this.statusStyle,
    required this.dayStyle,
    required this.selectedDayStyle,
    required this.errorStyle,
    required this.itemPadding,
  });

  DayPickerTheme.light()
    : titleStyle = WidgetToolkitDesignSystem.light().typography.titleMedS,
      statusStyle = WidgetToolkitDesignSystem.light().typography.bodyRegM,
      dayStyle = WidgetToolkitDesignSystem.light().typography.bodyRegM,
      selectedDayStyle = WidgetToolkitDesignSystem.light().typography.titleMedS
          .copyWith(color: WidgetToolkitDesignSystem.light().colors.primary),
      errorStyle = WidgetToolkitDesignSystem.light().typography.labelMedS
          .copyWith(color: WidgetToolkitDesignSystem.light().colors.red),
      itemPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.light().spacings.s,
        horizontal: WidgetToolkitDesignSystem.light().spacings.s,
      );

  DayPickerTheme.dark()
    : titleStyle = WidgetToolkitDesignSystem.dark().typography.titleMedS,
      statusStyle = WidgetToolkitDesignSystem.dark().typography.bodyRegM,
      dayStyle = WidgetToolkitDesignSystem.dark().typography.bodyRegM,
      errorStyle = WidgetToolkitDesignSystem.dark().typography.labelMedS
          .copyWith(color: WidgetToolkitDesignSystem.dark().colors.red),
      itemPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.dark().spacings.s,
        horizontal: WidgetToolkitDesignSystem.dark().spacings.s,
      ),
      selectedDayStyle = WidgetToolkitDesignSystem.dark().typography.titleMedS
          .copyWith(color: WidgetToolkitDesignSystem.dark().colors.primary);

  @override
  final TextStyle titleStyle;

  @override
  final TextStyle statusStyle;

  @override
  final TextStyle dayStyle;

  @override
  final TextStyle selectedDayStyle;

  @override
  final TextStyle errorStyle;

  @override
  final EdgeInsets itemPadding;
}

extension DayPickerThemeContextX on BuildContext {
  DayPickerTheme get dayPickerTheme {
    final theme = Theme.of(this).extension<DayPickerTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented DayPickerTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
