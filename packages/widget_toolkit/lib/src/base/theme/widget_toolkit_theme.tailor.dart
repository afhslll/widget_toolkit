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
  DesignSystemTypography get typography;
  DesignSystemColors get colors;
  Color get loadingIndicatorColor;
  Color get buttonBackgroundColor;
  Color get buttonForegroundColor;
  Color get buttonDisabledBackgroundColor;
  Color get buttonDisabledForegroundColor;
  Color get buttonBorderColor;
  Color get buttonShadowColor;
  double get buttonBorderRadius;
  TextStyle get buttonTextStyle;
  double get buttonElevation;
  EdgeInsetsGeometry get buttonPadding;
  double get buttonIconSize;
  Color get shimmerBaseColor;
  Color get shimmerHighlightColor;
  double get shimmerBorderRadius;
  Color get errorCardBackgroundColor;
  Color get errorCardIconColor;
  Color get errorCardTextColor;
  Color get bottomSheetBarrierColor;
  Color get bottomSheetBackgroundColor;
  EdgeInsetsGeometry get bottomSheetContentPadding;
  Color get bottomSheetLineColor;
  EdgeInsetsGeometry get bottomSheetHeaderPadding;
  double get bottomSheetBottomHeight;
  double get bottomSheetTopRadius;

  @override
  WidgetToolkitTheme copyWith({
    DesignSystemSpacings? spacings,
    DesignSystemTypography? typography,
    DesignSystemColors? colors,
    Color? loadingIndicatorColor,
    Color? buttonBackgroundColor,
    Color? buttonForegroundColor,
    Color? buttonDisabledBackgroundColor,
    Color? buttonDisabledForegroundColor,
    Color? buttonBorderColor,
    Color? buttonShadowColor,
    double? buttonBorderRadius,
    TextStyle? buttonTextStyle,
    double? buttonElevation,
    EdgeInsetsGeometry? buttonPadding,
    double? buttonIconSize,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    double? shimmerBorderRadius,
    Color? errorCardBackgroundColor,
    Color? errorCardIconColor,
    Color? errorCardTextColor,
    Color? bottomSheetBarrierColor,
    Color? bottomSheetBackgroundColor,
    EdgeInsetsGeometry? bottomSheetContentPadding,
    Color? bottomSheetLineColor,
    EdgeInsetsGeometry? bottomSheetHeaderPadding,
    double? bottomSheetBottomHeight,
    double? bottomSheetTopRadius,
  }) {
    return WidgetToolkitTheme(
      spacings: spacings ?? this.spacings,
      typography: typography ?? this.typography,
      colors: colors ?? this.colors,
      loadingIndicatorColor:
          loadingIndicatorColor ?? this.loadingIndicatorColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonForegroundColor:
          buttonForegroundColor ?? this.buttonForegroundColor,
      buttonDisabledBackgroundColor:
          buttonDisabledBackgroundColor ?? this.buttonDisabledBackgroundColor,
      buttonDisabledForegroundColor:
          buttonDisabledForegroundColor ?? this.buttonDisabledForegroundColor,
      buttonBorderColor: buttonBorderColor ?? this.buttonBorderColor,
      buttonShadowColor: buttonShadowColor ?? this.buttonShadowColor,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      buttonTextStyle: buttonTextStyle ?? this.buttonTextStyle,
      buttonElevation: buttonElevation ?? this.buttonElevation,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      buttonIconSize: buttonIconSize ?? this.buttonIconSize,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor:
          shimmerHighlightColor ?? this.shimmerHighlightColor,
      shimmerBorderRadius: shimmerBorderRadius ?? this.shimmerBorderRadius,
      errorCardBackgroundColor:
          errorCardBackgroundColor ?? this.errorCardBackgroundColor,
      errorCardIconColor: errorCardIconColor ?? this.errorCardIconColor,
      errorCardTextColor: errorCardTextColor ?? this.errorCardTextColor,
      bottomSheetBarrierColor:
          bottomSheetBarrierColor ?? this.bottomSheetBarrierColor,
      bottomSheetBackgroundColor:
          bottomSheetBackgroundColor ?? this.bottomSheetBackgroundColor,
      bottomSheetContentPadding:
          bottomSheetContentPadding ?? this.bottomSheetContentPadding,
      bottomSheetLineColor: bottomSheetLineColor ?? this.bottomSheetLineColor,
      bottomSheetHeaderPadding:
          bottomSheetHeaderPadding ?? this.bottomSheetHeaderPadding,
      bottomSheetBottomHeight:
          bottomSheetBottomHeight ?? this.bottomSheetBottomHeight,
      bottomSheetTopRadius: bottomSheetTopRadius ?? this.bottomSheetTopRadius,
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
      typography: t < 0.5 ? typography : other.typography,
      colors: t < 0.5 ? colors : other.colors,
      loadingIndicatorColor: Color.lerp(
        loadingIndicatorColor,
        other.loadingIndicatorColor,
        t,
      )!,
      buttonBackgroundColor: Color.lerp(
        buttonBackgroundColor,
        other.buttonBackgroundColor,
        t,
      )!,
      buttonForegroundColor: Color.lerp(
        buttonForegroundColor,
        other.buttonForegroundColor,
        t,
      )!,
      buttonDisabledBackgroundColor: Color.lerp(
        buttonDisabledBackgroundColor,
        other.buttonDisabledBackgroundColor,
        t,
      )!,
      buttonDisabledForegroundColor: Color.lerp(
        buttonDisabledForegroundColor,
        other.buttonDisabledForegroundColor,
        t,
      )!,
      buttonBorderColor: Color.lerp(
        buttonBorderColor,
        other.buttonBorderColor,
        t,
      )!,
      buttonShadowColor: Color.lerp(
        buttonShadowColor,
        other.buttonShadowColor,
        t,
      )!,
      buttonBorderRadius: t < 0.5
          ? buttonBorderRadius
          : other.buttonBorderRadius,
      buttonTextStyle: TextStyle.lerp(
        buttonTextStyle,
        other.buttonTextStyle,
        t,
      )!,
      buttonElevation: t < 0.5 ? buttonElevation : other.buttonElevation,
      buttonPadding: t < 0.5 ? buttonPadding : other.buttonPadding,
      buttonIconSize: t < 0.5 ? buttonIconSize : other.buttonIconSize,
      shimmerBaseColor: Color.lerp(
        shimmerBaseColor,
        other.shimmerBaseColor,
        t,
      )!,
      shimmerHighlightColor: Color.lerp(
        shimmerHighlightColor,
        other.shimmerHighlightColor,
        t,
      )!,
      shimmerBorderRadius: t < 0.5
          ? shimmerBorderRadius
          : other.shimmerBorderRadius,
      errorCardBackgroundColor: Color.lerp(
        errorCardBackgroundColor,
        other.errorCardBackgroundColor,
        t,
      )!,
      errorCardIconColor: Color.lerp(
        errorCardIconColor,
        other.errorCardIconColor,
        t,
      )!,
      errorCardTextColor: Color.lerp(
        errorCardTextColor,
        other.errorCardTextColor,
        t,
      )!,
      bottomSheetBarrierColor: Color.lerp(
        bottomSheetBarrierColor,
        other.bottomSheetBarrierColor,
        t,
      )!,
      bottomSheetBackgroundColor: Color.lerp(
        bottomSheetBackgroundColor,
        other.bottomSheetBackgroundColor,
        t,
      )!,
      bottomSheetContentPadding: t < 0.5
          ? bottomSheetContentPadding
          : other.bottomSheetContentPadding,
      bottomSheetLineColor: Color.lerp(
        bottomSheetLineColor,
        other.bottomSheetLineColor,
        t,
      )!,
      bottomSheetHeaderPadding: t < 0.5
          ? bottomSheetHeaderPadding
          : other.bottomSheetHeaderPadding,
      bottomSheetBottomHeight: t < 0.5
          ? bottomSheetBottomHeight
          : other.bottomSheetBottomHeight,
      bottomSheetTopRadius: t < 0.5
          ? bottomSheetTopRadius
          : other.bottomSheetTopRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WidgetToolkitTheme &&
            const DeepCollectionEquality().equals(spacings, other.spacings) &&
            const DeepCollectionEquality().equals(
              typography,
              other.typography,
            ) &&
            const DeepCollectionEquality().equals(colors, other.colors) &&
            const DeepCollectionEquality().equals(
              loadingIndicatorColor,
              other.loadingIndicatorColor,
            ) &&
            const DeepCollectionEquality().equals(
              buttonBackgroundColor,
              other.buttonBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              buttonForegroundColor,
              other.buttonForegroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              buttonDisabledBackgroundColor,
              other.buttonDisabledBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              buttonDisabledForegroundColor,
              other.buttonDisabledForegroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              buttonBorderColor,
              other.buttonBorderColor,
            ) &&
            const DeepCollectionEquality().equals(
              buttonShadowColor,
              other.buttonShadowColor,
            ) &&
            const DeepCollectionEquality().equals(
              buttonBorderRadius,
              other.buttonBorderRadius,
            ) &&
            const DeepCollectionEquality().equals(
              buttonTextStyle,
              other.buttonTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              buttonElevation,
              other.buttonElevation,
            ) &&
            const DeepCollectionEquality().equals(
              buttonPadding,
              other.buttonPadding,
            ) &&
            const DeepCollectionEquality().equals(
              buttonIconSize,
              other.buttonIconSize,
            ) &&
            const DeepCollectionEquality().equals(
              shimmerBaseColor,
              other.shimmerBaseColor,
            ) &&
            const DeepCollectionEquality().equals(
              shimmerHighlightColor,
              other.shimmerHighlightColor,
            ) &&
            const DeepCollectionEquality().equals(
              shimmerBorderRadius,
              other.shimmerBorderRadius,
            ) &&
            const DeepCollectionEquality().equals(
              errorCardBackgroundColor,
              other.errorCardBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              errorCardIconColor,
              other.errorCardIconColor,
            ) &&
            const DeepCollectionEquality().equals(
              errorCardTextColor,
              other.errorCardTextColor,
            ) &&
            const DeepCollectionEquality().equals(
              bottomSheetBarrierColor,
              other.bottomSheetBarrierColor,
            ) &&
            const DeepCollectionEquality().equals(
              bottomSheetBackgroundColor,
              other.bottomSheetBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              bottomSheetContentPadding,
              other.bottomSheetContentPadding,
            ) &&
            const DeepCollectionEquality().equals(
              bottomSheetLineColor,
              other.bottomSheetLineColor,
            ) &&
            const DeepCollectionEquality().equals(
              bottomSheetHeaderPadding,
              other.bottomSheetHeaderPadding,
            ) &&
            const DeepCollectionEquality().equals(
              bottomSheetBottomHeight,
              other.bottomSheetBottomHeight,
            ) &&
            const DeepCollectionEquality().equals(
              bottomSheetTopRadius,
              other.bottomSheetTopRadius,
            ));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(spacings),
      const DeepCollectionEquality().hash(typography),
      const DeepCollectionEquality().hash(colors),
      const DeepCollectionEquality().hash(loadingIndicatorColor),
      const DeepCollectionEquality().hash(buttonBackgroundColor),
      const DeepCollectionEquality().hash(buttonForegroundColor),
      const DeepCollectionEquality().hash(buttonDisabledBackgroundColor),
      const DeepCollectionEquality().hash(buttonDisabledForegroundColor),
      const DeepCollectionEquality().hash(buttonBorderColor),
      const DeepCollectionEquality().hash(buttonShadowColor),
      const DeepCollectionEquality().hash(buttonBorderRadius),
      const DeepCollectionEquality().hash(buttonTextStyle),
      const DeepCollectionEquality().hash(buttonElevation),
      const DeepCollectionEquality().hash(buttonPadding),
      const DeepCollectionEquality().hash(buttonIconSize),
      const DeepCollectionEquality().hash(shimmerBaseColor),
      const DeepCollectionEquality().hash(shimmerHighlightColor),
      const DeepCollectionEquality().hash(shimmerBorderRadius),
      const DeepCollectionEquality().hash(errorCardBackgroundColor),
      const DeepCollectionEquality().hash(errorCardIconColor),
      const DeepCollectionEquality().hash(errorCardTextColor),
      const DeepCollectionEquality().hash(bottomSheetBarrierColor),
      const DeepCollectionEquality().hash(bottomSheetBackgroundColor),
      const DeepCollectionEquality().hash(bottomSheetContentPadding),
      const DeepCollectionEquality().hash(bottomSheetLineColor),
      const DeepCollectionEquality().hash(bottomSheetHeaderPadding),
      const DeepCollectionEquality().hash(bottomSheetBottomHeight),
      const DeepCollectionEquality().hash(bottomSheetTopRadius),
    ]);
  }
}
