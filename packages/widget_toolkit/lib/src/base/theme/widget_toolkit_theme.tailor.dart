// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_toolkit_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$WidgetToolkitThemeTailorMixin on ThemeExtension<WidgetToolkitTheme> {
  DesignSystemSpacings get spacings;
  ToolkitButtonStyle get buttonStyle;
  Color get loadingIndicatorColor;

  @override
  WidgetToolkitTheme copyWith({
    DesignSystemSpacings? spacings,
    ToolkitButtonStyle? buttonStyle,
    Color? loadingIndicatorColor,
  }) {
    return WidgetToolkitTheme(
      spacings: spacings ?? this.spacings,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      loadingIndicatorColor:
          loadingIndicatorColor ?? this.loadingIndicatorColor,
    );
  }

  @override
  WidgetToolkitTheme lerp(
    covariant ThemeExtension<WidgetToolkitTheme>? other,
    double t,
  ) {
    if (other is! WidgetToolkitTheme) return this as WidgetToolkitTheme;
    return WidgetToolkitTheme(
      spacings: t < 0.5 ? spacings : other.spacings,
      buttonStyle: t < 0.5 ? buttonStyle : other.buttonStyle,
      loadingIndicatorColor: Color.lerp(
        loadingIndicatorColor,
        other.loadingIndicatorColor,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WidgetToolkitTheme &&
            const DeepCollectionEquality().equals(spacings, other.spacings) &&
            const DeepCollectionEquality().equals(
              buttonStyle,
              other.buttonStyle,
            ) &&
            const DeepCollectionEquality().equals(
              loadingIndicatorColor,
              other.loadingIndicatorColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(spacings),
      const DeepCollectionEquality().hash(buttonStyle),
      const DeepCollectionEquality().hash(loadingIndicatorColor),
    );
  }
}
