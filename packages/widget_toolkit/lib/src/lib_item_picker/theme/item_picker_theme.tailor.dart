// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ItemPickerThemeTailorMixin on ThemeExtension<ItemPickerTheme> {
  EdgeInsets get titlePadding;
  TextStyle get titleTextStyle;
  EdgeInsets get errorPadding;
  EdgeInsets get contentListPadding;
  EdgeInsets get footerPadding;
  EdgeInsets get itemOuterPadding;
  EdgeInsets get itemInnerPadding;
  Color get itemSelectedColor;
  Color get itemUnselectedColor;
  TextStyle get itemTextStyle;
  double get itemBorderRadius;

  @override
  ItemPickerTheme copyWith({
    EdgeInsets? titlePadding,
    TextStyle? titleTextStyle,
    EdgeInsets? errorPadding,
    EdgeInsets? contentListPadding,
    EdgeInsets? footerPadding,
    EdgeInsets? itemOuterPadding,
    EdgeInsets? itemInnerPadding,
    Color? itemSelectedColor,
    Color? itemUnselectedColor,
    TextStyle? itemTextStyle,
    double? itemBorderRadius,
  }) {
    return ItemPickerTheme(
      titlePadding: titlePadding ?? this.titlePadding,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      errorPadding: errorPadding ?? this.errorPadding,
      contentListPadding: contentListPadding ?? this.contentListPadding,
      footerPadding: footerPadding ?? this.footerPadding,
      itemOuterPadding: itemOuterPadding ?? this.itemOuterPadding,
      itemInnerPadding: itemInnerPadding ?? this.itemInnerPadding,
      itemSelectedColor: itemSelectedColor ?? this.itemSelectedColor,
      itemUnselectedColor: itemUnselectedColor ?? this.itemUnselectedColor,
      itemTextStyle: itemTextStyle ?? this.itemTextStyle,
      itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
    );
  }

  @override
  ItemPickerTheme lerp(
    covariant ThemeExtension<ItemPickerTheme>? other,
    double t,
  ) {
    if (other is! ItemPickerTheme) return this as ItemPickerTheme;
    return ItemPickerTheme(
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      errorPadding: t < 0.5 ? errorPadding : other.errorPadding,
      contentListPadding: t < 0.5
          ? contentListPadding
          : other.contentListPadding,
      footerPadding: t < 0.5 ? footerPadding : other.footerPadding,
      itemOuterPadding: t < 0.5 ? itemOuterPadding : other.itemOuterPadding,
      itemInnerPadding: t < 0.5 ? itemInnerPadding : other.itemInnerPadding,
      itemSelectedColor: Color.lerp(
        itemSelectedColor,
        other.itemSelectedColor,
        t,
      )!,
      itemUnselectedColor: Color.lerp(
        itemUnselectedColor,
        other.itemUnselectedColor,
        t,
      )!,
      itemTextStyle: TextStyle.lerp(itemTextStyle, other.itemTextStyle, t)!,
      itemBorderRadius: t < 0.5 ? itemBorderRadius : other.itemBorderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemPickerTheme &&
            const DeepCollectionEquality().equals(
              titlePadding,
              other.titlePadding,
            ) &&
            const DeepCollectionEquality().equals(
              titleTextStyle,
              other.titleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              errorPadding,
              other.errorPadding,
            ) &&
            const DeepCollectionEquality().equals(
              contentListPadding,
              other.contentListPadding,
            ) &&
            const DeepCollectionEquality().equals(
              footerPadding,
              other.footerPadding,
            ) &&
            const DeepCollectionEquality().equals(
              itemOuterPadding,
              other.itemOuterPadding,
            ) &&
            const DeepCollectionEquality().equals(
              itemInnerPadding,
              other.itemInnerPadding,
            ) &&
            const DeepCollectionEquality().equals(
              itemSelectedColor,
              other.itemSelectedColor,
            ) &&
            const DeepCollectionEquality().equals(
              itemUnselectedColor,
              other.itemUnselectedColor,
            ) &&
            const DeepCollectionEquality().equals(
              itemTextStyle,
              other.itemTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              itemBorderRadius,
              other.itemBorderRadius,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(errorPadding),
      const DeepCollectionEquality().hash(contentListPadding),
      const DeepCollectionEquality().hash(footerPadding),
      const DeepCollectionEquality().hash(itemOuterPadding),
      const DeepCollectionEquality().hash(itemInnerPadding),
      const DeepCollectionEquality().hash(itemSelectedColor),
      const DeepCollectionEquality().hash(itemUnselectedColor),
      const DeepCollectionEquality().hash(itemTextStyle),
      const DeepCollectionEquality().hash(itemBorderRadius),
    );
  }
}
