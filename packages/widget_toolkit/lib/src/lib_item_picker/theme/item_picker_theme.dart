import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'item_picker_theme.tailor.dart';

@TailorMixinComponent()
class ItemPickerTheme extends ThemeExtension<ItemPickerTheme>
    with _$ItemPickerThemeTailorMixin {
  @override
  final EdgeInsets titlePadding;
  @override
  final TextStyle titleTextStyle;
  @override
  final EdgeInsets errorPadding;
  @override
  final EdgeInsets contentListPadding;
  @override
  final EdgeInsets footerPadding;
  @override
  final EdgeInsets itemOuterPadding;
  @override
  final EdgeInsets itemInnerPadding;
  @override
  final Color itemSelectedColor;
  @override
  final Color itemUnselectedColor;
  @override
  final TextStyle itemTextStyle;
  @override
  final double itemBorderRadius;

  const ItemPickerTheme({
    required this.titlePadding,
    required this.titleTextStyle,
    required this.errorPadding,
    required this.contentListPadding,
    required this.footerPadding,
    required this.itemOuterPadding,
    required this.itemInnerPadding,
    required this.itemSelectedColor,
    required this.itemUnselectedColor,
    required this.itemTextStyle,
    required this.itemBorderRadius,
  });

  /// region Themes

  ItemPickerTheme.light()
    : contentListPadding = EdgeInsets.zero,
      titlePadding = EdgeInsets.only(
        bottom: WidgetToolkitDesignSystem.light().spacings.m,
        left: WidgetToolkitDesignSystem.light().spacings.xs,
      ),
      titleTextStyle = WidgetToolkitDesignSystem.light().typography.titleMedM,
      errorPadding = EdgeInsets.zero,
      footerPadding = EdgeInsets.only(
        top: WidgetToolkitDesignSystem.light().spacings.m,
      ),
      itemOuterPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.light().spacings.s,
        horizontal: WidgetToolkitDesignSystem.light().spacings.m,
      ),
      itemInnerPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.light().spacings.s,
        horizontal: WidgetToolkitDesignSystem.light().spacings.m,
      ),
      itemSelectedColor =
          WidgetToolkitDesignSystem.light().colors.primaryContainer,
      itemUnselectedColor = WidgetToolkitDesignSystem.light().colors.surface,
      itemTextStyle = WidgetToolkitDesignSystem.light().typography.bodyRegM,
      itemBorderRadius = WidgetToolkitDesignSystem.light().spacings.s;

  ItemPickerTheme.dark()
    : titlePadding = EdgeInsets.only(
        bottom: WidgetToolkitDesignSystem.dark().spacings.m,
        left: WidgetToolkitDesignSystem.dark().spacings.xs,
      ),
      titleTextStyle = WidgetToolkitDesignSystem.dark().typography.titleMedM,
      errorPadding = EdgeInsets.zero,
      contentListPadding = EdgeInsets.zero,
      footerPadding = EdgeInsets.only(
        top: WidgetToolkitDesignSystem.dark().spacings.m,
      ),
      itemOuterPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.dark().spacings.s,
        horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
      ),
      itemInnerPadding = EdgeInsets.symmetric(
        vertical: WidgetToolkitDesignSystem.dark().spacings.s,
        horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
      ),
      itemSelectedColor =
          WidgetToolkitDesignSystem.dark().colors.primaryContainer,
      itemUnselectedColor = WidgetToolkitDesignSystem.dark().colors.surface,
      itemTextStyle = WidgetToolkitDesignSystem.dark().typography.bodyRegM,
      itemBorderRadius = WidgetToolkitDesignSystem.dark().spacings.s;

  /// endregion
}

extension ItemPickerThemeContextExtension on BuildContext {
  /// Returns a reference to the [ItemPickerTheme] theme extension of the current [Theme]
  ItemPickerTheme get itemPickerTheme {
    final theme = Theme.of(this).extension<ItemPickerTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented ItemPickerTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
