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
          backgroundColor ??
          context.widgetToolkitTheme.buttonStyle.backgroundColor,
      foregroundColor:
          foregroundColor ??
          context.widgetToolkitTheme.buttonStyle.foregroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ??
          context.widgetToolkitTheme.buttonStyle.disabledBackgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ??
          context.widgetToolkitTheme.buttonStyle.disabledForegroundColor,
      startGradientColor:
          startGradientColor ??
          context.widgetToolkitTheme.buttonStyle.startGradientColor,
      endGradientColor:
          endGradientColor ??
          context.widgetToolkitTheme.buttonStyle.endGradientColor,
      borderColor:
          borderColor ?? context.widgetToolkitTheme.buttonStyle.borderColor,
      shadowColor:
          shadowColor ?? context.widgetToolkitTheme.buttonStyle.shadowColor,
      borderRadius:
          borderRadius ?? context.widgetToolkitTheme.buttonStyle.borderRadius,
      textStyle: textStyle ?? context.widgetToolkitTheme.buttonStyle.textStyle,
      elevation: elevation ?? context.widgetToolkitTheme.buttonStyle.elevation,
      padding: padding ?? context.widgetToolkitTheme.buttonStyle.padding,
      iconSize: iconSize ?? context.widgetToolkitTheme.buttonStyle.iconSize,
    );
  }
}
