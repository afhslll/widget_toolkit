// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$DayPickerThemeTailorMixin on ThemeExtension<DayPickerTheme> {
  TextStyle get titleStyle;
  TextStyle get statusStyle;
  TextStyle get dayStyle;
  TextStyle get selectedDayStyle;
  TextStyle get errorStyle;
  EdgeInsets get itemPadding;

  @override
  DayPickerTheme copyWith({
    TextStyle? titleStyle,
    TextStyle? statusStyle,
    TextStyle? dayStyle,
    TextStyle? selectedDayStyle,
    TextStyle? errorStyle,
    EdgeInsets? itemPadding,
  }) {
    return DayPickerTheme(
      titleStyle: titleStyle ?? this.titleStyle,
      statusStyle: statusStyle ?? this.statusStyle,
      dayStyle: dayStyle ?? this.dayStyle,
      selectedDayStyle: selectedDayStyle ?? this.selectedDayStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      itemPadding: itemPadding ?? this.itemPadding,
    );
  }

  @override
  DayPickerTheme lerp(
    covariant ThemeExtension<DayPickerTheme>? other,
    double t,
  ) {
    if (other is! DayPickerTheme) return this as DayPickerTheme;
    return DayPickerTheme(
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      statusStyle: TextStyle.lerp(statusStyle, other.statusStyle, t)!,
      dayStyle: TextStyle.lerp(dayStyle, other.dayStyle, t)!,
      selectedDayStyle: TextStyle.lerp(
        selectedDayStyle,
        other.selectedDayStyle,
        t,
      )!,
      errorStyle: TextStyle.lerp(errorStyle, other.errorStyle, t)!,
      itemPadding: t < 0.5 ? itemPadding : other.itemPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DayPickerTheme &&
            const DeepCollectionEquality().equals(
              titleStyle,
              other.titleStyle,
            ) &&
            const DeepCollectionEquality().equals(
              statusStyle,
              other.statusStyle,
            ) &&
            const DeepCollectionEquality().equals(dayStyle, other.dayStyle) &&
            const DeepCollectionEquality().equals(
              selectedDayStyle,
              other.selectedDayStyle,
            ) &&
            const DeepCollectionEquality().equals(
              errorStyle,
              other.errorStyle,
            ) &&
            const DeepCollectionEquality().equals(
              itemPadding,
              other.itemPadding,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(statusStyle),
      const DeepCollectionEquality().hash(dayStyle),
      const DeepCollectionEquality().hash(selectedDayStyle),
      const DeepCollectionEquality().hash(errorStyle),
      const DeepCollectionEquality().hash(itemPadding),
    );
  }
}
