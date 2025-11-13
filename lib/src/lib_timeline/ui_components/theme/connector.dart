import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'timeline.dart';

@immutable
class ConnectorThemeData with Diagnosticable {
  final Color? color;
  final double? spacing;
  final double? thickness;
  final double? indent;

  const ConnectorThemeData({
    this.color,
    this.spacing,
    this.thickness,
    this.indent,
  });

  /// Creates a copy of this object with the given fields replaced with the new
  /// values.
  ConnectorThemeData copyWith({
    Color? color,
    double? spacing,
    double? thickness,
    double? indent,
  }) {
    return ConnectorThemeData(
      color: color ?? this.color,
      spacing: spacing ?? this.spacing,
      thickness: thickness ?? this.thickness,
      indent: indent ?? this.indent,
    );
  }

  /// Linearly interpolate between two Connector themes.
  ///
  /// The argument `t` must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static ConnectorThemeData lerp(
      ConnectorThemeData? a, ConnectorThemeData? b, double t) {
    return ConnectorThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      thickness: lerpDouble(a?.thickness, b?.thickness, t),
      indent: lerpDouble(a?.indent, b?.indent, t),
    );
  }

  @override
  int get hashCode {
    return Object.hash(
      color,
      spacing,
      thickness,
      indent,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ConnectorThemeData &&
        other.color == color &&
        other.spacing == spacing &&
        other.thickness == thickness &&
        other.indent == indent;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color, defaultValue: null))
      ..add(DoubleProperty('spacing', spacing, defaultValue: null))
      ..add(DoubleProperty('thickness', thickness, defaultValue: null))
      ..add(DoubleProperty('indent', indent, defaultValue: null));
  }
}

class ConnectorTheme extends InheritedTheme {
  /// Creates a connector theme that controls the configurations for
  /// [SolidLineConnector]s, connectors inside [TimelineNode]s.
  const ConnectorTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// The properties for descendant [SolidLineConnector]s, connectors inside
  /// [TimelineNode]s.
  final ConnectorThemeData data;

  /// The closest instance of this class's [data] value that encloses the given
  /// context.
  ///
  /// If there is no ancestor, it returns [TimelineThemeData.connectorTheme].
  /// Applications can assume that the returned value will not be null.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ConnectorThemeData theme = ConnectorTheme.of(context);
  /// ```
  static ConnectorThemeData of(BuildContext context) {
    final connectorTheme =
        context.dependOnInheritedWidgetOfExactType<ConnectorTheme>();
    return connectorTheme?.data ?? TimelineTheme.of(context).connectorTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme =
        context.findAncestorWidgetOfExactType<ConnectorTheme>();
    return identical(this, ancestorTheme)
        ? child
        : ConnectorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ConnectorTheme oldWidget) => data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// Connector component configured through [ConnectorTheme]
mixin ThemedConnectorComponent on Widget {
  /// {@template timelines.connector.direction}
  /// If this is null, then the [TimelineThemeData.direction] is used.
  /// {@endtemplate}
  Axis? get direction;
  Axis getEffectiveDirection(BuildContext context) {
    return direction ?? TimelineTheme.of(context).direction;
  }

  /// {@template timelines.connector.thickness}
  /// If this is null, then the [ConnectorThemeData.thickness] is used which
  /// defaults to 2.0.
  /// {@endtemplate}
  double? get thickness;
  double getEffectiveThickness(BuildContext context) {
    return thickness ?? ConnectorTheme.of(context).thickness ?? 2.0;
  }

  /// {@template timelines.connector.spacing}
  /// If this is null, then the [ConnectorThemeData.spacing] is used. If that is
  /// also null, then this defaults to double.infinity.
  /// {@endtemplate}
  double? get spacing;
  double? getEffectiveSpacing(BuildContext context) {
    return spacing ?? ConnectorTheme.of(context).spacing;
  }

  double? get indent;
  double getEffectiveIndent(BuildContext context) {
    return indent ?? ConnectorTheme.of(context).indent ?? 0.0;
  }

  double? get endIndent;
  double getEffectiveEndIndent(BuildContext context) {
    return endIndent ?? ConnectorTheme.of(context).indent ?? 0.0;
  }

  Color? get color;
  Color getEffectiveColor(BuildContext context) {
    return color ??
        ConnectorTheme.of(context).color ??
        TimelineTheme.of(context).color;
  }
}
