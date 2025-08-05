import 'package:flutter/material.dart';
import 'package:widget_toolkit/src/base/theme/widget_toolkit_theme.dart';

class ToolkitButtonStyle {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? startGradientColor;
  final Color? endGradientColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;

  const ToolkitButtonStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.startGradientColor,
    this.endGradientColor,
    this.borderColor,
    this.shadowColor,
    this.borderRadius,
    this.textStyle,
    this.elevation,
    this.padding,
    this.iconSize,
  });

  factory ToolkitButtonStyle.fromContext(
    BuildContext context, {
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? startGradientColor,
    Color? endGradientColor,
    Color? borderColor,
    Color? shadowColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? elevation,
    EdgeInsetsGeometry? padding,
    double? iconSize,
  }) {
    return ToolkitButtonStyle(
      backgroundColor:
          backgroundColor ?? context.widgetToolkitTheme.buttonBackgroundColor,
      foregroundColor:
          foregroundColor ?? context.widgetToolkitTheme.buttonForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ??
          context.widgetToolkitTheme.buttonDisabledBackgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ??
          context.widgetToolkitTheme.buttonDisabledForegroundColor,
      startGradientColor: startGradientColor,
      endGradientColor: endGradientColor,
      borderColor: borderColor ?? context.widgetToolkitTheme.buttonBorderColor,
      shadowColor: shadowColor ?? context.widgetToolkitTheme.buttonShadowColor,
      borderRadius:
          borderRadius ?? context.widgetToolkitTheme.buttonBorderRadius,
      textStyle: textStyle ?? context.widgetToolkitTheme.buttonTextStyle,
      elevation: elevation ?? context.widgetToolkitTheme.buttonElevation,
      padding: padding ?? context.widgetToolkitTheme.buttonPadding,
      iconSize: iconSize ?? context.widgetToolkitTheme.buttonIconSize,
    );
  }
}
