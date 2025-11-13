import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'timeline.dart';

@immutable
class IndicatorThemeData with Diagnosticable {
  IndicatorThemeData({
    this.position,
    this.size,
    this.color,
  });

  final double? position;
  final double? size;
  final Color? color;

  IndicatorThemeData copyWith({
    double? position,
    double? size,
    Color? color,
  }) {
    return IndicatorThemeData(
      position: position ?? this.position,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }

  static IndicatorThemeData lerp(
      IndicatorThemeData a, IndicatorThemeData b, double t) {
    return IndicatorThemeData(
      position: lerpDouble(a.position, b.position, t),
      size: lerpDouble(a.size, b.size, t),
      color: Color.lerp(a.color, b.color, t),
    );
  }

  @override
  int get hashCode => Object.hash(color, size, position);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is IndicatorThemeData &&
        other.color == color &&
        other.size == size &&
        other.position == position;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color, defaultValue: null))
      ..add(DoubleProperty('size', size, defaultValue: null))
      ..add(DoubleProperty('position', size, defaultValue: null));
  }
}

class IndicatorTheme extends InheritedTheme {
  /// Creates an indicator theme that controls the color and size for
  /// [DotIndicator]s, indicators inside [TimelineNode]s.
  const IndicatorTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// The properties for descendant [DotIndicator]s, indicators inside
  /// [TimelineNode]s.
  final IndicatorThemeData data;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// Defaults to the current [TimelineThemeData.indicatorTheme].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  ///  IndicatorThemeData theme = IndicatorTheme.of(context);
  /// ```
  static IndicatorThemeData of(BuildContext context) {
    final indicatorTheme =
        context.dependOnInheritedWidgetOfExactType<IndicatorTheme>();
    return indicatorTheme?.data ?? TimelineTheme.of(context).indicatorTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme =
        context.findAncestorWidgetOfExactType<IndicatorTheme>();
    return identical(this, ancestorTheme)
        ? child
        : IndicatorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(IndicatorTheme oldWidget) => data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// Indicator component configured through [IndicatorTheme]
mixin ThemedIndicatorComponent on PositionedIndicator {
  /// {@template timelines.indicator.color}
  /// Defaults to the current [IndicatorTheme] color, if any.
  ///
  /// If no [IndicatorTheme] and no [TimelineTheme] is specified, indicators
  /// will default to blue.
  /// {@endtemplate}
  Color? get color;
  Color getEffectiveColor(BuildContext context) {
    return color ??
        IndicatorTheme.of(context).color ??
        TimelineTheme.of(context).color;
  }

  double? get size;
  double? getEffectiveSize(BuildContext context) {
    return size ?? IndicatorTheme.of(context).size;
  }
}

mixin PositionedIndicator on Widget {
  double? get position;
  double getEffectivePosition(BuildContext context) {
    return position ??
        IndicatorTheme.of(context).position ??
        TimelineTheme.of(context).indicatorPosition;
  }
}
